#!/usr/bin/env bash

cp -f "${DOTFILES_DIR}/.mackup.cfg" "${HOME}/"
cp -rf "${DOTFILES_DIR}/.mackup" "${HOME}/"

mackup restore -f

