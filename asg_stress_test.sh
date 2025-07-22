#!/bin/bash
set -euo pipefail

# Script to simulate high CPU load on all instances in an Auto Scaling Group
# and observe the scaling activity. It dynamically retrieves the ASG name from
# the Terraform state based on the target environment.

# --- Dependency Check ---
# Ensure all required command-line tools are installed before proceeding.
check_deps() {
    local missing_deps=0
    if ! command -v terraform &> /dev/null; then
        echo "Error: 'terraform' command not found. Please install Terraform."
        missing_deps=1
    fi
    if ! command -v aws &> /dev/null; then
        echo "Error: 'aws' command not found. Please install the AWS CLI."
        missing_deps=1
    fi
    if ! command -v session-manager-plugin &> /dev/null; then
        echo "Error: 'session-manager-plugin' command not found. Please install the AWS Session Manager plugin."
        missing_deps=1
    fi
    if [ "$missing_deps" -ne 0 ]; then
        echo "Please install missing dependencies and try again."
        exit 1
    fi
}
check_deps # Run the dependency check

# --- Configuration ---
TERRAFORM_DIR="./terraform"

# Duration of the stress test in seconds.
STRESS_DURATION=360 # 6 minutes

# Cooldown period to allow for scale-down activity after the test.
COOLDOWN_PERIOD=600 # 10 minutes

# --- Script Logic ---

# 1. Get and validate the target environment argument.
TARGET_ENVIRONMENT="${1-}"
if [ -z "${TARGET_ENVIRONMENT}" ]; then
    echo "Error: Target environment not specified."
    echo "Usage: ${0} {dev|uat|prod}"
    exit 1
fi

echo "Target environment set to: ${TARGET_ENVIRONMENT}"
echo "----------------------------------------------------------------"

# 2. Automatically determine the AWS region from the AWS CLI config, with a fallback.
AWS_REGION=$(aws configure get region)
AWS_REGION=${AWS_REGION:-us-east-1} # Fallback to us-east-1 if not configured
echo "Using AWS Region: ${AWS_REGION}"

# 3. Retrieve the Auto Scaling Group name from the Terraform output.
echo "Retrieving Auto Scaling Group name from Terraform state..."
ASG_NAME=$(terraform -chdir="${TERRAFORM_DIR}" output -raw ec2_asg_target_asg_name)

if [ -z "${ASG_NAME}" ]; then
    echo "Error: Could not retrieve Auto Scaling Group name from Terraform output."
    echo "Please ensure you have run './terraform_init.sh ${TARGET_ENVIRONMENT}' and './terraform_apply.sh ${TARGET_ENVIRONMENT}' successfully."
    exit 1
fi

echo "Starting load test simulation for Auto Scaling Group: ${ASG_NAME}"
echo "----------------------------------------------------------------"

# 4. Get the list of running instance IDs, waiting for them to become 'InService'.
echo "Fetching target instance IDs from ASG..."
echo "(Waiting up to 2 minutes for instances to become 'InService')..."

# DEBUG: Dump the raw instance status from the ASG's perspective
echo "Current instance states reported by API:"
aws autoscaling describe-auto-scaling-groups \
    --auto-scaling-group-names "${ASG_NAME}" \
    --region "${AWS_REGION}" \
    --query "AutoScalingGroups[0].Instances[*].{ID:InstanceId, State:LifecycleState, Health:HealthStatus}" \
    --output table

INSTANCE_IDS=""
for i in {1..12}; do # Retry for up to 120 seconds (12 * 10s)
    INSTANCE_IDS=$(aws autoscaling describe-auto-scaling-groups \
        --auto-scaling-group-names "${ASG_NAME}" \
        --region "${AWS_REGION}" \
        --query "AutoScalingGroups[0].Instances[?LifecycleState=='InService'].InstanceId" \
        --output text)

    if [ -n "${INSTANCE_IDS}" ] && [ "${INSTANCE_IDS}" != "None" ]; then
        break
    fi
    echo -n "."
    sleep 10
done
echo

# Check if instances were found after waiting.
if [ -z "${INSTANCE_IDS}" ] || [ "${INSTANCE_IDS}" == "None" ]; then
    echo "No 'InService' instances found in the Auto Scaling Group after waiting. Exiting."
    echo "Please check the AWS Console for instance health and ASG events."
    exit 0
fi

echo "Found instances to test: ${INSTANCE_IDS}"

# 5. Use SSM Send-Command to install 'stress' and run the test on all instances.
echo
echo "Sending stress test command to all instances via SSM..."
echo "This will generate high CPU load for ${STRESS_DURATION} seconds ($((STRESS_DURATION / 60)) minutes)."

# FINAL FIX: The here-document template MUST contain valid JSON.
# This means double quotes inside the command strings must be escaped with a backslash.
PARAMETERS_TEMPLATE=$(cat <<'EOF'
{
  "commands": [
    "sudo yum update -y",
    "sudo yum install -y stress",
    "STRESS_TIME=__DURATION__",
    "NPROC=$(nproc)",
    "echo \"Stressing ${NPROC} cores for ${STRESS_TIME} seconds...\"",
    "stress --cpu ${NPROC} --timeout ${STRESS_TIME}s"
  ]
}
EOF
)
# Safely replace the placeholder with the actual duration value.
PARAMETERS_JSON=$(echo "${PARAMETERS_TEMPLATE}" | sed "s/__DURATION__/${STRESS_DURATION}/")


COMMAND_ID=$(aws ssm send-command \
    --region "${AWS_REGION}" \
    --instance-ids ${INSTANCE_IDS} \
    --document-name "AWS-RunShellScript" \
    --comment "CPU stress test for ASG ${ASG_NAME}" \
    --parameters "${PARAMETERS_JSON}" \
    --query "Command.CommandId" \
    --output text)

echo "SSM Command sent successfully. Command ID: ${COMMAND_ID}"
echo "Waiting for the stress test to complete..."
sleep ${STRESS_DURATION}

echo
echo "Stress test duration has elapsed."
echo "Waiting ${COOLDOWN_PERIOD} seconds ($((COOLDOWN_PERIOD / 60)) minutes) for ASG to cool down and scale in..."
sleep ${COOLDOWN_PERIOD}

# 6. Dump the ASG activity log to show scale-up and scale-down events.
echo
echo "Cooldown period finished. Fetching ASG activity history..."
echo "----------------------------------------------------------------"
echo "Auto Scaling Group Activity for: ${ASG_NAME}"
echo "----------------------------------------------------------------"
aws autoscaling describe-scaling-activities \
    --auto-scaling-group-name "${ASG_NAME}" \
    --region "${AWS_REGION}" \
    --query "Activities | sort_by(@, &StartTime) | reverse(@)[*].{Time:StartTime, Status:StatusCode, Description:Description}" \
    --output table

echo
echo "Load test simulation complete."
