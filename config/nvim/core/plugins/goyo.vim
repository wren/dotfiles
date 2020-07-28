" Goyo

let g:goyo_width = 121
" s:goyo_enter() "{{{
" Disable visual candy in Goyo mode
function! s:goyo_enter()
  if has('gui_running')
    " Gui fullscreen
    set fullscreen
  elseif exists('$TMUX')
    " Hide tmux status
    silent !tmux set status off
  endif

    set linespace=7
    set textwidth=90

    set noshowmode
    set noshowcmd
    set nocursorline
    set scrolloff=999
    set ft=markdown
    hi InactiveWindow guibg=NONE
  Limelight
endfunction

" }}}
" s:goyo_leave() "{{{
" Enable visuals when leaving Goyo mode
function! s:goyo_leave()
  if has('gui_running')
    " Gui exit fullscreen
    set nofullscreen
    set linespace=0
    set scrolloff=5
  elseif exists('$TMUX')
    " Show tmux status
    silent !tmux set status on
  endif

  " De-activate Limelight
  Limelight!
endfunction
" }}}

" Goyo Commands {{{
autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()
" }}}

" vim: set foldmethod=marker sw=2 tw=80 noet :
