#!/usr/bin/env bash

# ---- Styling ---- #
HIGHLIGHT_STYLE="\e[4;36m"
ERROR_STYLE="\e[4;31m"
WARNING_STYLE="\e[4;33m"
RESET="\033[00m"
ERR=0

# Set some variables
DOTFILES_DIR="${HOME}/Dotfiles"
DOTFILES_PARENT="$(dirname "$DOTFILES_DIR")"
DOTFILE_SCRIPTS_DIR="${DOTFILES_DIR}/Scripts"

# Go to parent directory of dotfiles
mkdir -p "$DOTFILES_PARENT"
cd "$DOTFILES_PARENT"

# Dotfiles already exist?
if [ -d "$DOTFILES_DIR" ]; then
  printf "\n${ERROR_STYLE}ERROR: Dotfiles directory already exists!${RESET}\n"
  printf "Are dotfiles already installed?\n"
  printf "Please remove '%s' and try again.\n" "$DOTFILES_DIR"
  exit
fi

# Check if Git is already installed
if command -v git >/dev/null 2>&1; then
  printf "Cloning repo into '${DOTFILES_DIR}'...\n"
  git clone https://github.com/jonathanwren/dotfiles.git "$DOTFILES_DIR"
else
  printf "Git isn't installed! Using other means to get repo into '${DOTFILES_DIR}'...\n"
  curl -L https://github.com/jonathanwren/dotfiles/archive/master.zip -o /tmp/dotfiles.zip
  unzip /tmp/dotfiles.zip -d "$DOTFILES_PARENT"
  mv "${DOTFILES_PARENT}/dotfiles-master" "$DOTFILES_DIR"

  # Clean up
  rm /tmp/dotfiles.zip
fi

# Should we do the thing?
read -p "Do you want to install now, too? (y/n)? " answer
case ${answer:0:1} in
  y|Y|Yes|yes|YES )
    # Start the install
    cd "$DOTFILES_DIR"
    ./Scripts/init.sh
  ;;
  * )
    # @todo add more info about installing later here
    printf '\nExiting...\n\nBy the way, you can finish the install later by running this command:\n  sh %s/Scripts/init.sh\n' "$DOTFILES_DIR"
    printf '\nBye!\n'
  ;;
esac


