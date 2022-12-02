#!/usr/bin/env bash
set -e
# Sets up and runs ansible

# Config Options
export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dotfiles}"

PATH=~/.local/bin:$PATH

if ! command -v ansible >/dev/null; then
  if ! command -v pip >/dev/null; then
    sudo apt install python3-pip -y
  fi
  python3 -m pip install ansible
fi

ansible-galaxy install -r requirements.yaml
ansible-playbook "${DOTFILES_DIR}/dotfiles.yaml" --ask-become-pass -i hosts "$@"
