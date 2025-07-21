#!/bin/bash
set -euo pipefail

TERRAFORM_DIR="./terraform"

TARGET_ENVIRONMENT="${1}"
if [ -z "${TARGET_ENVIRONMENT}" ]; then
	echo "usage: ${0} {dev,uat,prod}"
	exit -1
fi

echo "Running terraform plan for target environment ${TARGET_ENVIRONMENT}."
terraform -chdir="${TERRAFORM_DIR}" plan -var="${target_environment=TARGET_ENVIRONMENT}"