#!/usr/bin/env bash
set -e
# Sets up and runs ansible

# Config Options
export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dotfiles}"

PATH=~/.local/bin:$PATH:$HOME/Library/Python/3.9/bin

function print-header() {
  printf -- "$(tput setaf 6)───── %s ─────$(tput sgr0)\n" "$@"
}

if ! command -v ansible >/dev/null; then
  if ! command -v python3 >/dev/null; then
    # mac ships with python, so we only install on linux
    sudo apt install python3 python3-pip -y
  fi
  python3 -m pip install ansible simplejson jmespath
fi

print-header 'Pre-reqs'
ansible-galaxy install -r requirements.yaml

print-header 'Tasks'
ansible-playbook "${DOTFILES_DIR}/dotfiles.yaml" --ask-become-pass -i hosts "$@"
