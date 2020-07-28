" https://github.com/simplenote-vim/simplenote.vim
let $CONFIG_HOME = expand(($XDG_CONFIG_HOME ? $XDG_CONFIG_HOME : '~/.config'))

if has('nvim') && filereadable($CONFIG_HOME . '/simplenote')
  execute printf('source %s', fnameescape($CONFIG_HOME . '/simplenote'))
endif

let g:SimplenoteSingleWindow = 1
" let g:SimplenoteVertical = 1
let g:SimplenoteListSize = 20
