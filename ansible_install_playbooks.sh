#!/usr/bin/env bash
set -e

ANSIBLE_ARGS=$1

echo "Running ansible_install_playbook.sh for $ENVIRONMENT_DIR"

for playbook in $(ls $ENVIRONMENT_DIR/*[^bitops.config].yaml || ls $ENVIRONMENT_DIR/*[^bitops.config].yml); do
    echo "Executing playbook: $playbook"
    ansible-playbook $playbook $ANSIBLE_ARGS
done