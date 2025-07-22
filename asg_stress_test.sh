#!/bin/bash
set -euo pipefail

# Script to simulate high CPU load on all instances in an Auto Scaling Group
# and observe the scaling activity. It dynamically retrieves the ASG name from
# the Terraform state based on the target environment.

# Prerequisites:
# 1. AWS CLI installed and configured.
# 2. AWS Session Manager (SSM) plugin for the AWS CLI installed.
# 3. The Terraform state for the target environment must exist (i.e., 'terraform apply' has been run).
# 4. EC2 instances must have the SSM Agent installed and have an IAM instance profile
#    with the 'AmazonSSMManagedInstanceCore' policy attached. The launch template in
#    this project already handles this.

# --- Configuration ---
TERRAFORM_DIR="./terraform"

# The AWS region where your resources are deployed.
AWS_REGION="us-east-2" # <--- Adjust if you deployed to a different region.

# Duration of the stress test in seconds.
STRESS_DURATION=360 # 6 minutes

# Cooldown period to allow for scale-down activity after the test.
COOLDOWN_PERIOD=360 # 6 minutes

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

# 2. Retrieve the Auto Scaling Group name from the Terraform output.
#    This assumes you have already run 'terraform_init.sh <env>' so the state is configured.
echo "Retrieving Auto Scaling Group name from Terraform state..."
ASG_NAME=$(terraform -chdir="${TERRAFORM_DIR}" output -raw ec2_asg_target_asg_name)

if [ -z "${ASG_NAME}" ]; then
    echo "Error: Could not retrieve Auto Scaling Group name from Terraform output."
    echo "Please ensure you have run 'terraform_init.sh ${TARGET_ENVIRONMENT}' and 'terraform_apply.sh ${TARGET_ENVIRONMENT}' successfully."
    exit 1
fi

echo "Starting load test simulation for Auto Scaling Group: ${ASG_NAME}"
echo "----------------------------------------------------------------"

# 3. Get the list of running instance IDs in the Auto Scaling Group.
echo "Fetching target instance IDs from ASG..."
INSTANCE_IDS=$(aws autoscaling describe-auto-scaling-groups \
    --auto-scaling-group-names "${ASG_NAME}" \
    --region "${AWS_REGION}" \
    --query "AutoScalingGroups[0].Instances[?LifecycleState=='InService'].InstanceId" \
    --output text)

if [ -z "${INSTANCE_IDS}" ]; then
    echo "No running instances found in the Auto Scaling Group. Exiting."
    exit 0
fi

echo "Found instances to test: ${INSTANCE_IDS}"

# 4. Use SSM Send-Command to install 'stress' and run the test on all instances.
# The commands will:
#   - Update the package manager (yum).
#   - Install the 'stress' utility.
#   - Run 'stress' to load all available CPU cores for the specified duration.
echo
echo "Sending stress test command to all instances via SSM..."
echo "This will generate high CPU load for ${STRESS_DURATION} seconds (${STRESS_DURATION / 60} minutes)."

COMMAND_ID=$(aws ssm send-command \
    --region "${AWS_REGION}" \
    --instance-ids ${INSTANCE_IDS} \
    --document-name "AWS-RunShellScript" \
    --comment "CPU stress test for ASG ${ASG_NAME}" \
    --parameters 'commands=[
        "sudo yum update -y",
        "sudo yum install -y stress",
        "nproc=$(nproc)",
        "echo \"Stressing \${nproc} cores for ${STRESS_DURATION} seconds...\"",
        "stress --cpu \${nproc} --timeout ${STRESS_DURATION}s"
    ]' \
    --query "Command.CommandId" \
    --output text)

echo "SSM Command sent successfully. Command ID: ${COMMAND_ID}"
echo "Waiting for the stress test to complete..."
sleep ${STRESS_DURATION}

echo
echo "Stress test duration has elapsed."
echo "Waiting ${COOLDOWN_PERIOD} seconds (${COOLDOWN_PERIOD / 60} minutes) for ASG to cool down and scale in..."
sleep ${COOLDOWN_PERIOD}

# 5. Dump the ASG activity log to show scale-up and scale-down events.
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
