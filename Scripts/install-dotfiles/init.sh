#!/usr/bin/env bash

# Set some variables
DOTFILES_DIR="${HOME}/Dotfiles"
DOTFILES_PARENT="$(dirname "$DOTFILES_DIR")"
DOTFILE_SCRIPTS_DIR="${DOTFILES_DIR}/Scripts"

# Go to parent directory of dotfiles
mkdir -p "$DOTFILES_PARENT"
cd "$DOTFILES_PARENT"

# Check if Git is already installed
if command -v git >/dev/null 2>&1; then
  printf "Cloning repo into '${DOTFILES_DIR}'...\n"
  git clone https://github.com/jonathanwren/dotfiles.git "$DOTFILES_DIR"
else
  printf "Git isn't installed! Using other means to get repo into '${DOTFILES_DIR}'...\n"
  curl -L https://github.com/jonathanwren/dotfiles/archive/master.zip -o /tmp/dotfiles.zip
  unzip /tmp/dotfiles.zip -d ~ && mv ~/dotfiles-master "$DOTFILES_DIR" && cd "$DOTFILES_DIR" && ./Scripts/init.sh && rm /tmp/dotfiles.zip
fi
