#!/usr/bin/env bash

cp -f "${DOTFILES_DIR}/Backup/.mackup.cfg" "${HOME}/"
cp -rf "${DOTFILES_DIR}/Backup/.mackup" "${HOME}/"

mackup restore -f