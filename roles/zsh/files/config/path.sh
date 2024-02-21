# dissallow dupes on the path
typeset -U path
typeset -U fpath

path=(
  # our local shenanigans get priority
  $HOME/.local/bin

  # apt installs some stuff here for some reason
  /usr/games

  # Homebrew because ugh
  /home/linuxbrew/.linuxbrew/bin
  /opt/homebrew/bin

  # default path
  $path
)

fpath=(
  $ZDOTDIR/functions

  #default fpath
  $fpath
)
