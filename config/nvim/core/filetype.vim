
augroup MyAutoCmd

  " Reload vim config automatically
  autocmd BufWritePost $VIM_PATH/core/* nested source $MYVIMRC | redraw

  autocmd WinEnter,InsertLeave * set cursorline
  autocmd WinLeave,InsertEnter * set nocursorline

  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

  autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

  autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true

  " autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html Neoformat

  autocmd FileType json syntax match Comment +\/\/.\+$+

  autocmd FileType json syntax match Comment +\/\/.\+$+

  " autocmd FileType markdown syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
  " autocmd FileType markdown syntax match NoSpellSeasonEp 's\d\+e\d\+' contains=@NoSpell
  " autocmd FileType markdown syntax match NoSpellSeasonEp '\'s' contains=@NoSpell

  " Go (Google)
  autocmd FileType go let b:coc_pairs_disabled = ['<']

  " HTML (.gohtml and .tpl for server side)
  autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html
augroup END
