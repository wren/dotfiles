#!/usr/bin/env zsh
set -e
# Sets up and runs dotbot + plugins

# Config Options
export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Dotfiles}"
export DOTBOT_CONFIG="$DOTFILES_DIR/install.conf.yaml"
export DOTBOT_DEFAULTS="$DOTFILES_DIR/defaults.conf.yaml"
export DOTBOT_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/dotbot"

# Check dotbot directory
mkdir -p $DOTBOT_DIR
cd $DOTBOT_DIR
if ! git -C $DOTBOT_DIR rev-parse; then
  git clone https://github.com/wren/dotfiles-dotbot.git $DOTBOT_DIR
fi
git pull --force origin main
git submodule update --init --recursive

# Load all plugins, and run dotbot
CMD=$DOTBOT_DIR/dotbot/bin/dotbot
for dir in $DOTBOT_DIR/plugins/*; do
  CMD+=" --plugin-dir=$dir"
done
CMD+=' --quiet'
# CMD+=' --verbose'

export DOTBOT_CMD=$CMD

# Run dotbot
print -P "%F{006}───── Dotbot ─────%f"
if [[ ! -d $DOTFILES_DIR ]]; then
  # Probably first run
  url='https://raw.githubusercontent.com/wren/dotfiles/main'
  ${=CMD} --only git -c <(curl -s "$url/defaults.conf.yaml" && curl -s "$url/install.conf.yaml") "$@" || true
fi

${=CMD} -d $DOTFILES_DIR -c <(cat $DOTBOT_DEFAULTS $DOTBOT_CONFIG) "$@" || true

