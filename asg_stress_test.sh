#!/bin/bash
set -euo pipefail

# Script to simulate high CPU load on all instances in an Auto Scaling Group
# via SSH and observe the scaling activity.

# --- Dependency Check ---
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
    if ! command -v ssh &> /dev/null; then
        echo "Error: 'ssh' command not found. Please install it."
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

# IMPORTANT: Configure your SSH settings here
# Specify the path to your private key file (.pem). This must match the key_name in your Terraform code.
SSH_KEY_PATH="~/.ssh/dp-webapp-dev-key.pem"
# The default user for Amazon Linux 2023 AMIs is 'ec2-user'.
SSH_USER="ec2-user"

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

# 2. Check for SSH Key
# Use eval to handle tilde expansion
EVAL_SSH_KEY_PATH=$(eval echo "${SSH_KEY_PATH}")
if [ ! -f "${EVAL_SSH_KEY_PATH}" ]; then
    echo "Error: SSH private key not found at '${EVAL_SSH_KEY_PATH}'."
    echo "Please update the SSH_KEY_PATH variable in this script."
    exit 1
fi
echo "Using SSH Key: ${EVAL_SSH_KEY_PATH}"
echo "----------------------------------------------------------------"

# 3. Automatically determine the AWS region from the AWS CLI config, with a fallback.
AWS_REGION=${AWS_REGION:-us-east-1} # Fallback to us-east-1 if not configured
echo "Using AWS Region: ${AWS_REGION}"

# 4. Retrieve the Auto Scaling Group name from the Terraform output.
echo "Retrieving Auto Scaling Group name from Terraform state..."
ASG_NAME=$(terraform -chdir="${TERRAFORM_DIR}" output -raw ec2_asg_target_asg_name)

if [ -z "${ASG_NAME}" ]; then
    echo "Error: Could not retrieve Auto Scaling Group name from Terraform output."
    exit 1
fi
echo "Target Auto Scaling Group: ${ASG_NAME}"
echo "----------------------------------------------------------------"

# 5. Get the Public IP addresses of running instances in the ASG.
echo "Fetching Public IPs of 'InService' instances..."
echo "(Waiting up to 2 minutes for instances to be ready)..."

PUBLIC_IPS=""
for i in {1..12}; do # Retry for up to 120 seconds (12 * 10s)
    INSTANCE_IDS=$(aws autoscaling describe-auto-scaling-groups \
        --auto-scaling-group-names "${ASG_NAME}" \
        --region "${AWS_REGION}" \
        --query "AutoScalingGroups[0].Instances[?LifecycleState=='InService'].InstanceId" \
        --output text)

    if [ -n "${INSTANCE_IDS}" ] && [ "${INSTANCE_IDS}" != "None" ]; then
        # Get public IPs for the collected instance IDs
        PUBLIC_IPS=$(aws ec2 describe-instances \
            --region "${AWS_REGION}" \
            --instance-ids ${INSTANCE_IDS} \
            --query "Reservations[*].Instances[?PublicIpAddress!=null].PublicIpAddress" \
            --output text)
        
        if [ -n "${PUBLIC_IPS}" ]; then
            break
        fi
    fi
    echo -n "."
    sleep 10
done
echo

if [ -z "${PUBLIC_IPS}" ]; then
    echo "No running instances with public IPs found in the Auto Scaling Group. Exiting."
    exit 0
fi

echo "Found instances to test: ${PUBLIC_IPS}"
echo "----------------------------------------------------------------"

# 6. Use SSH to install 'stress' and run the test on all instances.
echo "Connecting to each instance via SSH to start the stress test..."
echo "This will generate high CPU load for ${STRESS_DURATION} seconds ($((STRESS_DURATION / 60)) minutes)."

SSH_COMMAND="sudo yum update -y && sudo yum install -y stress && NPROC=\$(nproc) && echo 'Stressing \${NPROC} cores for ${STRESS_DURATION} seconds...' && stress --cpu \${NPROC} --timeout ${STRESS_DURATION}s"

for IP in ${PUBLIC_IPS}; do
    echo "Starting test on instance: ${IP}"
    # Run the command in the background on the remote host and log its output
    ssh -i "${EVAL_SSH_KEY_PATH}" \
        -o StrictHostKeyChecking=no \
        -o UserKnownHostsFile=/dev/null \
        -o ConnectTimeout=10 \
        "${SSH_USER}@${IP}" "${SSH_COMMAND}" > "/tmp/stress_test_${IP}.log" 2>&1 &
done

echo "Stress test commands sent to all instances. Waiting for completion..."
sleep ${STRESS_DURATION}

echo
echo "Stress test duration has elapsed."
echo "Waiting ${COOLDOWN_PERIOD} seconds ($((COOLDOWN_PERIOD / 60)) minutes) for ASG to cool down..."
sleep ${COOLDOWN_PERIOD}

# 7. Dump the ASG activity log to show scaling events.
echo
echo "Cooldown period finished. Fetching ASG activity history..."
echo "----------------------------------------------------------------"
aws autoscaling describe-scaling-activities \
    --auto-scaling-group-name "${ASG_NAME}" \
    --region "${AWS_REGION}" \
    --query "Activities | sort_by(@, &StartTime) | reverse(@)[*].{Time:StartTime, Status:StatusCode, Description:Description}" \
    --output table

echo
echo "Load test simulation complete."
