#!/usr/bin/env bash
# Sets up and runs ansible.

set -euo pipefail

# Config Options
export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dotfiles}"

UV_BIN_DIR="${UV_BIN_DIR:-$HOME/.local/bin}"
PATH="$UV_BIN_DIR:$PATH"

# ansible-core ships the binaries we need ( the `ansible` dist only provides
# `ansible-community` and nothing else)
ANSIBLE_PKG=ansible-core
ANSIBLE_EXTRAS=(--with ansible --with jmespath)

function print-header() {
  printf -- "$(tput setaf 6 2>/dev/null || true)───── %s ─────$(tput sgr0 2>/dev/null || true)\n" "$@"
}

function have() { command -v "$1" >/dev/null 2>&1; }

if ! have uv; then
  if ! have curl; then
    # Debian netinst / ubuntu-minimal may lack curl; macOS always has it.
    print-header 'Installing curl'
    sudo apt-get update -qq && sudo apt-get install -y curl
  fi

  print-header 'Installing uv'
  curl -fsSL https://astral.sh/uv/install.sh | sh
fi

if ! have ansible-playbook; then
  # If ansible is already installed (pipx, system, etc.) just use it.
  print-header 'Installing ansible'
  uv tool install "$ANSIBLE_PKG" "${ANSIBLE_EXTRAS[@]}"
fi

# Clean up the output a bit since ansible-galaxy is a bit verbose
if ! out=$(ansible-galaxy install -r "${DOTFILES_DIR}/requirements.yaml" 2>&1); then
  printf '%s\n' "$out" >&2
  exit 1
fi
if ! grep -q "Nothing to do" <<<"$out"; then
  print-header 'Pre-reqs'
  printf '%s\n' "$out"
fi

print-header 'Tasks'
ansible-playbook "${DOTFILES_DIR}/dotfiles.yaml" --ask-become-pass -i "${DOTFILES_DIR}/hosts" "$@"
