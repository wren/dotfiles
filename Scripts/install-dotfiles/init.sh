#!/bin/bash

# ---- Styling ---- #
UNDERLINE=$(tput smul)
ERROR_STYLE=$UNDERLINE$(tput setaf 1)
WARNING_STYLE=$UNDERLINE$(tput setaf 3)
RESET=$(tput sgr0)
DOTFILES_DIR="${HOME}/Dotfiles-test"
DOTFILES_PARENT="$(dirname "$DOTFILES_DIR")"
DOTFILE_SCRIPTS_DIR="${DOTFILES_DIR}/Scripts"

# Export some variables
export DOTFILES_DIR
export DOTFILES_PARENT
export DOTFILE_SCRIPTS_DIR

# Go to parent directory of dotfiles
mkdir -p "$DOTFILES_PARENT"
cd "$DOTFILES_PARENT" || exit

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

install_homebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

clone_dotfiles() {
  printf "Cloning repo into '%s'...\\n" "$DOTFILES_DIR"
  git clone https://github.com/wren/dotfiles.git "$DOTFILES_DIR"
}

print_warning() {
  printf "\\n${WARNING_STYLE}WARNING: %s${RESET}\\n" "$1"
}

print_error() {
  printf "\\n${ERROR_STYLE}ERROR: %s${RESET}\\n" "$1"
}

# @todo Tell user what we're doing and give chance to abort

# Do Dotfiles already exist?
if [ -d "$DOTFILES_DIR" ]; then
  print_warning 'Dotfiles directory already exists!'

  read -r -p "This will erase your current Dotfiles! Are you sure you want to continue? (y/n) " answer
  case ${answer:0:1} in
    [yY])
      # Keep going
      timestamp="$(date +"%Y-%m-%d_%H%M%S")"
      old_dir="${DOTFILES_DIR}_OLD_${timestamp}"
      printf -- '\n--- Okay! Moving old Dotfiles into "%s"---\n\n' "$old_dir"
      mv "$DOTFILES_DIR" "$old_dir"
    ;;
    *)
      # @todo add more info about installing later here
      print_error 'Dotfiles directory already exists!'
      printf 'Are Dotfiles already installed?\n'
      printf 'Please remove "%s" and try again.\n' "$DOTFILES_DIR"
      exit
    ;;
  esac

fi

# Homebrew first
if ! command_exists brew; then
  printf "Homebrew isn't installed! Installing now...\\n"
  install_homebrew || exit
fi

# Now git (we can't ask MacOS because ugh)
if ! brew ls --versions git > /dev/null; then
  printf "Git isn't installed through Homebrew! Installing now...\\n"
  brew install git || exit
fi

clone_dotfiles

# Should we do the thing?
printf '\n'
read -r -p 'Do you want to install right now (y), or stop to edit the settings (n)? (y/n) ' answer
case ${answer:0:1} in
  [yY])
    # Start the install
    mkdir -p "$DOTFILES_DIR"
    cd "$DOTFILES_DIR" || exit
    ./Scripts/install.sh
    ./Scripts/mackup.sh
    ./Scripts/osx.sh
  ;;
  *)
    # @todo add more info about installing later here
    printf '\\nExiting...\\n\\nBy the way, you can finish the install later by running this command:\\n  /bin/bash "%s/Scripts/install-dotfiles/init.sh"\\n' "$DOTFILES_DIR"
    printf '\\nBye!\\n'
  ;;
esac


