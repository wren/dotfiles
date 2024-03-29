# XDG Shim
# Author:  Jonathan Wren <jonathan@nowandwren.com>
# See: https://github.com/wren/xdg-shim
# License: MIT (https://choosealicense.com/licenses/mit/)

# --- Defaults --- #
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"

# --- age --- #
# https://github.com/FiloSottile/age
export AGE_KEY_FILE="$XDG_CONFIG_HOME/age/keys.txt"

# --- ASDF --- #
# Default ~/.asdfrc
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=".tool-versions"

# --- asdf-direnv --- #
export ASDF_DIRENV_BIN="/bin/direnv"

# --- AWS CLI --- #
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
# Caveats:
# - ~/.aws/cli/cache/*.json (used for shared credentials)
export AWS_CLI_HISTORY_FILE="$XDG_DATA_HOME/aws/history"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/credentials"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/shared_credentials"

# --- Bat --- #
# https://github.com/sharkdp/bat#configuration-file
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.config"

# Direnv
export DIRENV_CONFIG="$XDG_CONFIG_HOME/direnv"

# Docker (https://docs.docker.com/engine/reference/commandline/cli/)
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# GPG (https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration-Options.html)
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# hub (github cli)
export HUB_CONFIG="$XDG_CONFIG_HOME/hub/config.yaml"

# Pyenv (https://github.com/pyenv/pyenv/issues/139)
export PYENV_ROOT="$XDG_CACHE_HOME/pyenv"

# IPython (https://ipython.readthedocs.io/en/stable/config/intro.html#the-ipython-directory)
export IPYTHONDIR="$XDG_DATA_HOME/ipython"

# Python
export PYTHONHISTORY="$XDG_DATA_HOME/python/history"

# Pylint (http://pylint.pycqa.org/en/latest/faq.html#where-is-the-persistent-data-stored-to-compare-between-successive-runs)
export PYLINTHOME="$XDG_DATA_HOME/pylint"

# less (https://linux.die.net/man/1/less)
export LESSKEYIN="$XDG_CONFIG_HOME/less/lesskey.conf"

# npm manager
export N_PREFIX="$XDG_DATA_HOME/n"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"

# gnu parallel
# https://git.savannah.gnu.org/cgit/parallel.git/commit/?id=685018f532f4e2d24b84eb28d5de3d759f0d1af1
export PARALLEL_HOME="${XDG_CONFIG_HOME}/parallel"

# Poetry
# https://python-poetry.org/docs/configuration/
export POETRY_CACHE_DIR="$XDG_CACHE_HOME/poetry"
export POETRY_VIRTUALENVS_PATH="${XDG_CACHE_HOME}/python-virtual-envs"

# Ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgrep.config"
export RIPGREP_CONFIG_DIR="$XDG_CONFIG_HOME/ripgrep/"

# secrethub
export SECRETHUB_CONFIG_DIR="$XDG_CONFIG_HOME/secrethub"

# sheldon
export SHELDON_CACHE="$XDG_CACHE_HOME/sheldon"

# sops
export SOPS_AGE_KEY_FILE="${SOPS_AGE_KEY_FILE:-$AGE_KEY_FILE}"

# starship
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"

# tmux
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"

# zplug
export ZPLUG_HOME="$XDG_DATA_HOME/zplug"
export ZPLUG_CACHE_DIR="$XDG_CACHE_HOME/zplug"
export ZPLUG_LOADFILE="$ZDOTDIR/plugins"

# ZSH
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

#ZSH-Z
export ZSHZ_DATA="$XDG_DATA_HOME/z"

# zinit
declare -A ZINIT
export ZINIT=(
  [BIN_DIR]="$XDG_BIN_HOME"
  [HOME_DIR]="$XDG_DATA_HOME/zinit"
  [PLUGINS_DIR]="$XDG_DATA_HOME/zinit/plugins"
  [COMPLETIONS_DIR]="$XDG_DATA_HOME/zinit/completions"
  [SNIPPETS_DIR]="$XDG_DATA_HOME/zinit/snippets"
  [MUTE_WARNINGS]=1
)

# TEMP
export LUNARVIM_CONFIG_DIR="$XDG_CONFIG_HOME/lvim"
export LUNARVIM_RUNTIME_DIR="$XDG_DATA_HOME/lunarvim"
