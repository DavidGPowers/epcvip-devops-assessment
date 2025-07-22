#!/bin/bash
set -euo pipefail

TERRAFORM_DIR="./terraform"

TARGET_ENVIRONMENT="${1}"
if [ -z "${TARGET_ENVIRONMENT}" ]; then
	echo "usage: ${0} {dev,uat,prd}"
	exit -1
fi

BACKEND_FILE="${TERRAFORM_DIR}/backend-${TARGET_ENVIRONMENT}.config"
if [ ! -f "${BACKEND_FILE}" ]; then
	echo "Invalid Target Environment"
	echo "Cannot find backend config file, ${BACKEND_FILE}"
	exit -1
fi

TF_BACKEND_FILE="backend-${TARGET_ENVIRONMENT}.config"
echo "Running terraform init for ${TARGET_ENVIRONMENT}: ${BACKEND_FILE}"
terraform -chdir="${TERRAFORM_DIR}" init -backend-config "${TF_BACKEND_FILE}" -reconfigure -upgrade
