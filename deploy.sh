#!/usr/bin/env bash
set -e

# run ansible (should be after terraform and before helm)
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

bash $PLUGIN_DIR/validate_env.sh

echo "Running Ansible Playbooks"
bash -x $PLUGIN_DIR/ansible_install_playbooks.sh "$CLI_OPTIONS"