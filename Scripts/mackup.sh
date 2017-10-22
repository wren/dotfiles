#!/usr/bin/env bash

export DOTFILES_DIR="$(dirname "$(dirname "${BASH_SOURCE[0]}")")"

cp -f "${DOTFILES_DIR}/../backup/.mackup.cfg" "${HOME}/"
cp -rf "${DOTFILES_DIR}/../backup/.mackup" "${HOME}/"

mackup restore -f