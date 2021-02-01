#!/usr/bin/env bash
set -e

if [ -n "$SKIP_DEPLOY_ANSIBLE" ]; then
    echo "SKIP_DEPLOY_ANSIBLE set..."
    exit 0
fi

if [ ! -d "$ENVIRONMENT_DIR" ]; then
  echo "No ansible directory.  Skipping."
  exit 0
fi

echo "cd Ansible Root: $ENVIRONMENT_DIR"
cd $ENVIRONMENT_DIR

bash $PLUGIN_DIR/scripts/validate_env.sh

echo "Running Ansible Playbooks"
bash -x $PLUGIN_DIR/scripts/ansible_install_playbooks.sh "$CLI_OPTIONS"