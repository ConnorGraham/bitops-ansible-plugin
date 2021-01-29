#!/usr/bin/env bash
set -e

if [ ! -d "$ENVIRONMENT_DIR" ]; then
  echo "No ansible directory.  Skipping."
  exit 0
else
  printf "Deploying ansible..."
fi

echo "cd Ansible Root: $ENVIRONMENT_DIR"
cd $ENVIRONMENT_DIR

bash $PLUGIN_DIR/validate_env.sh

echo "Running Ansible Playbooks"
bash -x $PLUGIN_DIR/ansible_install_playbooks.sh "$CLI_OPTIONS"