
augroup MyAutoCmd

  " Reload vim config automatically
  " autocmd BufWritePost $VIM_PATH/core/* nested source $MYVIMRC | redraw

  autocmd WinEnter,InsertLeave * set cursorline
  autocmd WinLeave,InsertEnter * set nocursorline

  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

  autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

  autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true

  " autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html Neoformat

  autocmd FileType json syntax match Comment +\/\/.\+$+

  autocmd FileType json syntax match Comment +\/\/.\+$+

  " HTML (.gohtml and .tpl for server side)
  autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html
augroup END
