# Message of the day

clear

# if [[ $TERM =~ ^xterm- ]] && command -v viu &>/dev/null; then
  viu -h $(( $LINES / 2 )) -t ~/.config/zsh/motd.png
  return
# fi

# probably in tmux
local cmd='cat'
if command -v lolcat &>/dev/null; then
  cmd='lolcat'
fi

$cmd <<'EOM'
                      __,---,
        .---.        /__|o\  )       .-"-.      .----.""".
        /   6_6        `-\ / /       / 4 4 \    /____/ (0 )\
        \_  (__\         ,) (,       \_ v _/      `--\_    /
        //   \\         //   \\      //   \\         //   \\
      ((     ))       {(     )}    ((     ))       {{     }}
=======""===""=========""===""======""===""=========""===""=======
          |||            |||||         |||             |||
          |              |||           |              '|'
                          |
EOM
