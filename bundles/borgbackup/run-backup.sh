#!/usr/bin/env zsh
# License: MIT (https://opensource.org/licenses/MIT)
# Copyright © 2021 Jonathan Wren <jonathan@nowandwren.com>
# https://gist.github.com/wren/cad91379c42f02bbcaff5e5f6a74255a
#
# Runs backups using Borg, and notifies on success/failure using
# healthchecks.io. Very configurable, and supports debug mode.
#
# See bottom of file for configurable variables.
#
# Requirements:
# - curl
# - borg
# - sed
# - yq (go version)

set -Eeo pipefail

if [[ -n $DEBUG ]] && [[ $DEBUG == 'x' ]]; then
  set -x
fi

function ping_healthcheck() {
  local cmd_output
  local error
  local exit_code
  local healthcheck_id
  local line
  local msg
  cmd_output=''
  error=0
  exit_code="${2:-0}"
  healthcheck_id="$1"
  line="${3:-0}"
  msg=''

  if [[ -r "$TEMP_DIR/$healthcheck_id" ]]; then
    cmd_output="$(sed 's/\x1b\[[0-9;]*[mGKH]//g' "$TEMP_DIR/$healthcheck_id")"
  fi

  if [[ $exit_code != "start" ]] && [[ $exit_code != 0 ]]; then
    error=1
    msg="$(printf 'Error on line %s\n\n%s' "$line" "$cmd_output")"
  else
    msg="$cmd_output"
  fi

  # Ping the web service (in the background so script can continue and not wait
  # for a network connection). Don't run this in debug (lots of noise).
  /usr/bin/curl \
    --fail \
    --silent \
    --retry 3 \
    --show-error \
    --max-time 3 \
    --data-raw "$msg" \
    --output /dev/null \
    "https://hc-ping.com/${healthcheck_id}/${exit_code}" &

  if [[ $error == 1 ]]; then
    exit "$exit_code"
  fi
}

function is_debug() {
  if [[ -n $DEBUG ]]; then
    printf -- '--dry-run'
  fi
}

function take_snapshot() {
  borg create $(is_debug)   \
      --verbose             \
      --stat                \
      --list                \
      --filter AME          \
      --show-rc             \
      --compression zstd    \
      --exclude-caches      \
      --paths-from-command  \
      ::'{hostname}-{now}'  \
      -- fd -Ht f           \
      --ignore-file "$CONFIG_HOME/ignore"

  borg prune $(is_debug) \
    --keep-within 48H    \
    --keep-hourly 24     \
    --keep-daily 14      \
    --keep-weekly 6      \
    --keep-monthly 12    \
    --keep-yearly 10
}

function sync_to_server() {
  local rsync_server
  local repo
  repo="$1"
  rsync_server="$2"

  rsync $(is_debug) \
    --delete \
    --stats    \
    --archive \
    --compress \
    --timeout 10 \
    --human-readable \
    "$repo/" "$rsync_server/"
}

function analytics_wrapper() {
  local healthcheck_id
  local cmd
  healthcheck_id="$1"
  cmd=( "${@:2}" )

  trap 'ping_healthcheck "$healthcheck_id" "$?" "$LINENO"' ERR INT
  if [[ -z $DEBUG ]]; then
    exec &> "$TEMP_DIR/$healthcheck_id"
  fi

  ping_healthcheck "$healthcheck_id" start
  "${cmd[@]}"
  ping_healthcheck "$healthcheck_id" 0
}

function get_config_val() {
  local val
  val="$(yq e "$1" "$CONFIG_HOME/config.yaml")" || exit 1
  printf -- '%s' "$val"
}

TEMP_DIR="$(mktemp -d)"

# Edit below this point as needed
# Note: Don't forget to `chmod 400` your sensitive files (e.g. config.yaml)
CONFIG_HOME="$HOME/.config/backups"
BORG_REPO="${BORG_REPO:-$(get_config_val .borg.repo)}"
export BORG_REPO=${BORG_REPO/#\~/$HOME} # expand tilde, if it exists
export BORG_PASSPHRASE="${BORG_PASSPHRASE:-$(get_config_val .borg.passphrase)}"
SYNC_SERVER="$(get_config_val .borg.sync-server)"

cd $HOME

analytics_wrapper "$(get_config_val .analytics_ids.snapshot)" \
  take_snapshot

analytics_wrapper "$(get_config_val .analytics_ids.sync)" \
  sync_to_server "$BORG_REPO" "$SYNC_SERVER"
