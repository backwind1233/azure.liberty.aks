#!/usr/bin/env bash
# Copyright (c) IBM Corporation.
# Copyright (c) Microsoft Corporation.

set -Eeuo pipefail

CURRENT_FILE_NAME=$(basename "$0")
echo "Execute $CURRENT_FILE_NAME - Start------------------------------------------"

gh secret delete "AZURE_CREDENTIALS"
AZURE_CREDENTIALS_SP_NAME=$(gh variable get "AZURE_CREDENTIALS_SP_NAME")
az ad app delete --id $(az ad sp list --display-name "$AZURE_CREDENTIALS_SP_NAME" --query '[].appId' -o tsv| tr -d '\r\n')
gh variable delete "AZURE_CREDENTIALS_SP_NAME"

echo "Execute $CURRENT_FILE_NAME - End--------------------------------------------"
