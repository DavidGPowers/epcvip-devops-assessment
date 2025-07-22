#!/bin/bash
set -euo pipefail

TERRAFORM_DIR="./terraform"

STAMP=$(date +%Y%m%d_%H%M%S)
PLAN_FILE="tfplan_${STAMP}.out"

TARGET_ENVIRONMENT="${1}"
if [ -z "${TARGET_ENVIRONMENT}" ]; then
	echo "usage: ${0} {dev,uat,prd}"
	exit -1
fi

# prefer to run plan with planfile over simple apply with -auto-approve
echo "Running terraform plan for target environment ${TARGET_ENVIRONMENT}."
terraform -chdir=./terraform plan -var="target_environment=${TARGET_ENVIRONMENT}" -out "${PLAN_FILE}"

echo "Running terraform apply for target environment ${TARGET_ENVIRONMENT}."
terraform -chdir="${TERRAFORM_DIR}" apply -var="target_environment=${TARGET_ENVIRONMENT}" "${PLAN_FILE}"
