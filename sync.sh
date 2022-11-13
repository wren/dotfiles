#!/usr/bin/env zsh
set -e
# Sets up and runs ansible

# Config Options
export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dotfiles}"

if ! command -v ansible >/dev/null; then
  python3 -m pip install ansible
fi

ansible-playbook "${DOTFILES_DIR}/dotfiles.yaml" --ask-become-pass
