#!/usr/bin/env zsh
# License: MIT (https://opensource.org/licenses/MIT)
# Copyright © 2022 Jonathan Wren <jonathan@nowandwren.com>
# https://gist.github.com/wren/e6e2fb695ce4b1b745405efbbbb93b93
#
# Wraps borg (borgbackup), and uses yq to get config variables
# to pass to borg for easier use
#
# See bottom of file for configurable variables.
#
# Requirements:
# - yq (go version)

set -Eeo pipefail

if [[ -n $DEBUG ]] && [[ $DEBUG == 'x' ]]; then
  set -x
fi

function get_config_val() {
  local val
  val="$(yq e "$1" "$CONFIG_HOME/config.yaml")" || exit 1
  printf -- '%s' "$val"
}

if ! command -v borg >/dev/null; then
  echo "$(tput setaf 1)Error: borg is missing $(tput sgr0)"
  exit 1
fi

CONFIG_HOME="$HOME/.config/backups"
BORG_REPO="${BORG_REPO:-$(get_config_val .borg.repo)}"
export BORG_REPO=${BORG_REPO/#\~/$HOME} # expand tilde, if it exists
export BORG_PASSPHRASE="${BORG_PASSPHRASE:-$(get_config_val .borg.passphrase)}"

borg "$@"
