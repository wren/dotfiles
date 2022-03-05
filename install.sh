#!/usr/bin/env zsh
set -e
# Sets up and runs dotbot + plugins

# Config Options
DOTFILES_REPO="https://github.com/wren/dotfiles.git"
DOTBOT_REPO="https://github.com/wren/dotfiles-dotbot.git"

DOTFILES_DIR="${0:A:h}"
DOTBOT_CONFIG="$DOTFILES_DIR/install.conf.yaml"
DOTBOT_DEFAULTS="$DOTFILES_DIR/defaults.conf.yaml"
DOTBOT_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/dotbot"
DOTBOT_PLUGINS_DIR="$DOTBOT_DIR/plugins"
DOTBOT_BIN="$DOTBOT_DIR/dotbot/bin/dotbot"

mkdir -p $DOTBOT_DIR
cd $DOTBOT_DIR

# Check dotbot directory
if ! git -C $DOTBOT_DIR rev-parse; then
  git clone $DOTBOT_REPO $DOTBOT_DIR
fi

# Make sure dotbot is same version across machines
git pull --force origin main
git submodule update --init --recursive

# Prep dotfiles dir
export DOTFILES_DIR
export DOTBOT_CONFIG
export DOTBOT_DEFAULTS

# Check dotfiles directory
if ! git -C $DOTFILES_DIR rev-parse; then
  mkdir -p $DOTFILES_DIR
  git clone $DOTFILES_REPO $DOTFILES_DIR
fi

cd $DOTFILES_DIR

# Load all plugins, and run dotbot
CMD=$DOTBOT_BIN
for dir in $DOTBOT_PLUGINS_DIR/*; do
  CMD+=" --plugin-dir=$dir"
done
# CMD+=' --verbose'

export DOTBOT_CMD=$CMD

# Run dotbot
print -P "%F{006}───── Dotbot ─────%f"
${=CMD} -d $DOTFILES_DIR -c <(cat $DOTBOT_DEFAULTS $DOTBOT_CONFIG) "$@" || true
