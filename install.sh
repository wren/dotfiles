#!/usr/bin/env zsh
set -e
# Sets up and runs dotbot + plugins

# Config Options
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dotfiles}"
DOTBOT_REPO="https://github.com/wren/dotfiles-dotbot.git"
DOTBOT_CONFIG="$DOTFILES_DIR/install.conf.yaml"
DOTBOT_DEFAULTS="$DOTFILES_DIR/defaults.conf.yaml"
DOTBOT_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/dotbot"

# Check dotbot directory
mkdir -p $DOTBOT_DIR
cd $DOTBOT_DIR
if ! git -C $DOTBOT_DIR rev-parse; then
  git clone $DOTBOT_REPO $DOTBOT_DIR
fi
git pull --force origin main
git submodule update --init --recursive

# Prep env vars
export DOTFILES_DIR
export DOTBOT_CONFIG
export DOTBOT_DEFAULTS

# Load all plugins, and run dotbot
CMD=$DOTBOT_DIR/dotbot/bin/dotbot
for dir in $DOTBOT_DIR/plugins/*; do
  CMD+=" --plugin-dir=$dir"
done
# CMD+=' --verbose'

export DOTBOT_CMD=$CMD

# Run dotbot
print -P "%F{006}───── Dotbot ─────%f"
${=CMD} -d $DOTFILES_DIR -c <(cat $DOTBOT_DEFAULTS $DOTBOT_CONFIG) "$@" || true
