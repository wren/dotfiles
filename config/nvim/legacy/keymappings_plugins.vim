
" --- caw.vim --- "
function! InitCaw() abort
  if !&l:modifiable
    silent! nunmap <buffer> gc
    silent! xunmap <buffer> gc
    silent! nunmap <buffer> gcc
    silent! xunmap <buffer> gcc
  else
    nmap <buffer> gc <Plug>(caw:prefix)
    xmap <buffer> gc <Plug>(caw:prefix)
    nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
    xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
  endif
endfunction
autocmd FileType * call InitCaw()
call InitCaw()


" -- Markdown -- "
nnoremap <silent><localleader>t :call checkbox#ToggleCB()<CR>

" --- Neoformat --- "
nnoremap <localleader>f :Neoformat<CR>

" --- vim-easy-align --- "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" --- vim-go --- "
nnoremap <silent> <LocalLeader>gi :GoImpl<CR>
nnoremap <silent> <LocalLeader>gd :GoDescribe<CR>
" nnoremap <silent> <LocalLeader>gc :GoCallees<CR>
nnoremap <silent> <LocalLeader>gC :GoCallers<CR>
nnoremap <silent> <LocalLeader>gs :GoCallstack<CR>


" --- vim-easygit --- "
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gB :Gbrowse<CR>
nnoremap <silent> <Leader>gS :Gstatus<CR>
" nnoremap <silent> <localleader>gp :Gpush<CR>

" --- vim-mundo --- "
nnoremap <silent> <leader>m :MundoToggle<CR>

" --- accelerated-jk --- "
nmap <silent>j <Plug>(accelerated_jk_gj)
nmap <silent>k <Plug>(accelerated_jk_gk)


" --- comfortable-motion.vim --- "
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
nnoremap <silent><C-A-J> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent><C-A-K> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>

" --- python_match.vim --- "
nmap <buffer> {{ [%
nmap <buffer> }} ]%

" --- vim-tmux-navigator --- "
nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>
nnoremap <silent> <a-\> :TmuxNavigatePrevious<cr>

" --- dash.vim --- "
" Search given docset for words
nnoremap <silent> <Leader>K :call Dasht(dasht#cursor_search_terms())<Return>
vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>
" Search all the docsets (not sure if this is ever useful)
" nnoremap <silent> <Leader><Leader>K :call Dasht(dasht#cursor_search_terms(), '!')<Return>
" vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>
" Use K for show documentation in preview window
nnoremap <silent><space>K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call Dasht(dasht#cursor_search_terms())
  endif
endfunction


" --- vim-which-key --- "
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
nnoremap <silent>[              :<c-u>WhichKey  '['<CR>
nnoremap <silent>]              :<c-u>WhichKey  ']'<CR>


" --- vim-wintab --- "
nmap <leader>bn <Plug>(wintabs_next)
nmap <leader>bp <Plug>(wintabs_previous)
nmap <leader>bc <Plug>(wintabs_close)
nmap <leader>bu <Plug>(wintabs_undo)
nmap <leader>bo <Plug>(wintabs_only)
nmap <leader>bq <Plug>(wintabs_close_window)
nmap <leader>bwo <Plug>(wintabs_only_window)
nmap <leader>btc <Plug>(wintabs_close_vimtab)
nmap <leader>bto <Plug>(wintabs_only_vimtab)
nmap <leader>ba :WintabsAllBuffers<cr>
nmap  [b <Plug>(wintabs_previous)
nmap  ]b <Plug>(wintabs_next)

" --- Tabular --- "
inoremap <localleader><Bar> <Bar><Esc>:call <SID>align()<CR>a
" Calls tabularize whenever a pipe char (|) is typed in normal mode
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" from: https://gist.github.com/tpope/287147
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
