#!/usr/bin/env bash
set -euo pipefail

config_file="service.conf"

if [[ ! -f "$config_file" ]]; then
    printf 'Error: configuration file not found: %s\n' "$config_file" >&2
    exit 1
fi

source "$config_file"

echo "Service: $SERVICE_NAME"
echo "Environment: $ENVIRONMENT"