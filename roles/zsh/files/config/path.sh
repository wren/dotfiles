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
  /usr/local/opt/util-linux/bin
  /usr/local/opt/util-linux/sbin
  # not sure if we want this
  # /usr/local/opt/coreutils/libexec/gnubin

  # default path
  $path
)

fpath=(
  $ZDOTDIR/functions

  #default fpath
  $fpath
)
