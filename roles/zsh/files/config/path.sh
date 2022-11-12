# dissallow dupes on the path
typeset -U path
typeset -U fpath

path=(
  # our local shenanigans get priority
  $HOME/.local/bin

  # Version/package manager(s) near the front of the line
  $HOME/.local/opt/asdf-vm/bin

  # Homebrew because ugh
  /home/linuxbrew/.linuxbrew/bin

  # default path
  $path
)

fpath=(
  $ZDOTDIR/functions

  ${ASDF_DIR}/completions

  #default fpath
  $fpath
)
