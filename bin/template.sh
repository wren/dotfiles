#!/bin/bash
set -e

usage_small() {
  echo "title - description lorem ipsum dolor sit amet"
}

usage() {
  echo -e "filename.sh\\nTLorem ipsum dolor sit amet\\n"
  echo "Usage:"
  echo "  command_one                         - description of command_one"
  echo "  command_two                         - description of command_two"
  echo "  command_three                       - description of command_three"
}

# Choose a user account to use
get_user() {
  if [ -z "${TARGET_USER-}" ]; then
    while IFS= read val; do options+=($val); done < <(find /users/* -maxdepth 0 -type d -not -name 'Shared' -printf "%f\\n")

    # if there is only one option, just use that user
    if [ "${#options[@]}" -eq "1" ]; then
      readonly TARGET_USER="${options[0]}"
      echo "Using user account: ${TARGET_USER}"
      return
    fi

    # iterate through the user options and print them
    PS3='Which user account should be used? '

    select opt in "${options[@]}"; do
      readonly TARGET_USER=$opt
      break
    done
  fi
}

check_is_sudo() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit
  fi
}

do_the_thing() {
  echo 'Doing things!'
}

update() {
  echo 'Updating!'
}

main() {
  local cmd=$1

  if [[ -z "$cmd" ]]; then
    usage
    exit 1
  fi

  case "$cmd" in
    update )
      get_user
      update
      do_the_thing
      ;;

    something )
      check_is_sudo
      get_user
      do_the_thing
      ;;

    usage )
      usage
      ;;

    * )
      echo "$(basename $0): '$cmd' isn't a valid command"
      exit 1
      ;;
  esac
}

main "$@"
