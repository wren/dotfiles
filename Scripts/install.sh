#!/bin/bash
# Install command-line tools using Node
# Usage: `./install.sh`

# some styling
HIGHLIGHT_STYLE="\e[4;33m"
ERROR_STYLE="\e[4;31m"
WARNING_STYLE="\e[4;33m"
RESET="\033[00m"
ERR=0


#--- Check for sudo ---#
if [ "$EUID" -ne 0 ]; then
  printf "${WARNING_STYLE}Sudo is required for this script!${RESET} \n"
  sudo -v || {
    printf "\n${ERROR_STYLE}Sudo password is required for this script. Exiting... Bye!${RESET}\n\n"
    exit
  }
  printf "\nThank you!\n\n"
fi
# see: https://gist.github.com/cowboy/3118588
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#--- PREREQS ---#
# Ruby
command -v ruby >/dev/null 2>&1 || {
  printf >&2 "${ERROR_STYLE}Error${RESET}: I require Ruby but it's not installed!\n"
  exit 1
}
printf "Updating Ruby... "
# sudo gem update --system || exit 1

# Homebrew
command -v brew >/dev/null 2>&1 || {
  printf >&2 "${WARNING_STYLE}Warning${RESET}: I require Homebrew but it's not installed!\n"
  printf >&2 "Installing Homebrew with this command: \n"
  printf >&2 "  ruby -e \$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\n\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || exit 1
  printf >&2 "Installing Brew Cask: \n"
  brew tap caskroom/cask || exit 1
}

printf "\nUpdating Homebrew... "
# brew update --all || exit 1
# brew upgrade || exit 1

# Node
command -v npm >/dev/null 2>&1 || {
  printf >&2 "${WARNING_STYLE}Warning${RESET}: I require Node but it's not installed!\n"
  printf >&2 "Installing Node with this command: \n"
  printf >&2 "  brew install node\n\n"
  brew install node || exit 1
}
printf "\nUpdating Node... "
# npm update -g >/dev/null 2>&1

printf "\n"

# Install everything
IFS=$'\r\n'
CONFIGPATH="$(if [[ ! -z "${DOTFILE_SCRIPTS_DIR}" ]]; then printf '%s' "${DOTFILE_SCRIPTS_DIR}"; else printf '.'; fi)/install.d"



install_apps() {

  INSTALL_COMMAND="$1 install"
  APP="$2"

  # gem needs sudo and y flag
  if [ "$1" == "gem" ]; then
    INSTALL_COMMAND="sudo ${INSTALL_COMMAND}"
  fi

  # npm uses a special flag
  if [ "$1" == "npm" ]; then
    INSTALL_COMMAND="${INSTALL_COMMAND} -g"
  fi

  # mas only uses the first column of input
  if [[ $1 == "mas" ]]; then
    APP="$(printf "$APP" | cut -d' ' -f1)"
  fi


  INSTALL_COMMAND="${INSTALL_COMMAND} $APP"

  printf "\n${HIGHLIGHT_STYLE}${INSTALL_COMMAND}${RESET}\n"
  eval "${INSTALL_COMMAND}"
}

for type in $(ls -1 install.d); do
  printf -- 'installing: %s\n' "$type"
  APPSLIST=( $(cat "$CONFIGPATH/$type") )
  for app in ${APPSLIST[@]}; do
    # check if line is commented out
    if [[ "$app" =~ ^[[:space:]]*# ]]; then
      continue
    fi
    install_apps "${type}" ${app}
  done
done

printf "\nCleaning up...\n"
brew cleanup
