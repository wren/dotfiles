# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Micro is here as the default, because it's user more
# user-friendly for non-vim users (y'know, normal
# people that don't hate themselves).
export VISUAL=${VISUAL:-micro}
export EDITOR="$VISUAL"

# Color options for ls
export CLICOLOR=true
# @see `man ls`
export LSCOLORS='gxfxcxdxbxegedabagacad'

# @see https://the.exa.website/docs/colour-themes
export LS_COLORS="$(vivid generate jellybeans)"
export EXA_COLORS=$LS_COLORS

export MANPAGER='sh -c "col -bx | bat -p -lman --theme=default"'
export LESSOPEN="|batpipe %s"
export BATPIPE="color"

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

BACKUPS_CONFIG="$XDG_CONFIG_HOME/backups/config.yaml"
export RESTIC_PASSWORD_COMMAND="yq e .restic.passphrase '$BACKUPS_CONFIG'"

# This is slow (10ms), so hardcode for now
# export RESTIC_REPOSITORY="$(yq e .restic.repo "${BACKUPS_CONFIG/#\~/$HOME}")"
export RESTIC_REPOSITORY="$HOME/Backups"

# direnv & asdf
export DIRENV_LOG_FORMAT=""
export ASDF_DIR="$HOME/.local/opt/asdf-vm"
. ~/.local/opt/asdf/asdf.sh
if command -v direnv >/dev/null; then
  export ASDF_DIRENV_BIN="$(which direnv)"
  eval "$($ASDF_DIRENV_BIN hook zsh)"
fi

# Python virtual envs
export PYTHON_VENVS_DIR="$XDG_CACHE_HOME/python-virtual-envs"
export WORKON_HOME="$PYTHON_VENVS_DIR"

# Dedupe becuase being in Tmux confuses some things that manipulate the path
if [[ -n $TMUX ]]; then
  typeset -aU path
fi

# SOPS
export SOPS_AGE_RECIPIENTS='age1p637gyvk0c0adn9jl3m6u3j2tlym395jkvj0hlpnyxd0pgq7wf3q0xepfw'
