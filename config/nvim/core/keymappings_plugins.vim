
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


" --- fzf.vim --- "
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>
nnoremap <silent> <M-C-p> :Buffers<CR>
nnoremap <silent> <C-p> :call Fzf_dev()<CR>
nnoremap <leader>fp :call Fzf_dev()<CR>
nnoremap <leader>ff :Find<Space>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>fhf :History<CR>
nnoremap <leader>fhc :History:<CR>
nnoremap <leader>fhs :History/<CR>
nnoremap <silent> <leader>fs :Colors<CR>

nnoremap <silent> <leader>fw :Find <C-R><C-W><CR>
nnoremap <silent> z= :call FzfSpell()<CR>


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


" --- vim-choosewin --- "
nmap -         <Plug>(choosewin)
nmap <Leader>_ :<C-u>ChooseWinSwap<CR>


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


" --- defx.nvim --- "
nnoremap <silent><C-\> :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <Leader>eo :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <Leader>ef :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>


" --- vim-startify --- "
nnoremap <silent> <leader>s :Startify<CR>


" --- simplenote.vim --- "
" nnoremap <silent> <leader>sl :SimplenoteList<CR>
" nnoremap <silent> <leader>sn :SimplenoteNew<CR>
" nnoremap <silent> <leader>sd :SimplenoteDelete<CR>
" nnoremap <silent> <leader>st :SimplenoteTag<CR>
" nnoremap <silent> <leader>su :SimplenoteUpdate<CR>
" nnoremap <silent> <leader>sp :SimplenotePin<CR>
" nnoremap <silent> <leader>sP :SimplenoteUnpin<CR>
" nnoremap <silent> <leader>sV :SimplenoteVersionInfo<CR>
" nnoremap <leader>sv :SimplenoteVersion<SPACE>


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


" --- splitjoin.vim --- "
let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
nmap sj :SplitjoinJoin<CR>
nmap sk :SplitjoinSplit<CR>


" --- vista.vim --- "
nnoremap <silent><localleader>v :Vista!!<CR>
nnoremap <silent><leader>fv     :Vista finder coc<CR>


" --- ale --- "
nmap [a <Plug>(ale_next_wrap)
nmap ]a <Plug>(ale_previous_wrap)


" --- obsession.vim --- "
nmap <leader>so :Obsession<cr>
nmap <leader>sc :Obsession!<cr>


" --- vim-easymotion --- "
map f <Plug>(easymotion-w)
map F <Plug>(easymotion-b)


" --- vim-which-key --- "
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
nnoremap <silent>[              :<c-u>WhichKey  '['<CR>
nnoremap <silent>]              :<c-u>WhichKey  ']'<CR>


" --- vim-niceblock --- "
xmap I  <Plug>(niceblock-I)
xmap A  <Plug>(niceblock-A)


" --- vim-sandwich --- "
nmap <silent> sa <Plug>(operator-sandwich-add)
xmap <silent> sa <Plug>(operator-sandwich-add)
omap <silent> sa <Plug>(operator-sandwich-g@)
nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> sd <Plug>(operator-sandwich-delete)
nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> sr <Plug>(operator-sandwich-replace)
nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap is <Plug>(textobj-sandwich-query-i)
xmap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
xmap as <Plug>(textobj-sandwich-query-a)


" --- actionmenu.nvim --- "
nmap <silent> <LocalLeader>s :call ActionMenuCodeActions()<CR>
let s:code_actions = []

func! ActionMenuCodeActions() abort
  let s:code_actions = CocAction('codeActions')
  let l:menu_items = map(copy(s:code_actions), { index, item -> item['title'] })
  call actionmenu#open(l:menu_items, 'ActionMenuCodeActionsCallback')
endfunc

func! ActionMenuCodeActionsCallback(index, item) abort
  if a:index >= 0
    let l:selected_code_action = s:code_actions[a:index]
    let l:response = CocAction('doCodeAction', l:selected_code_action)
  endif
endfunc


" --- vim-operator-replace --- "
xmap p <Plug>(operator-replace)


" --- vim-textobj-multiblock --- "
omap <silent> ab <Plug>(textobj-multiblock-a)
omap <silent> ib <Plug>(textobj-multiblock-i)
xmap <silent> ab <Plug>(textobj-multiblock-a)
xmap <silent> ib <Plug>(textobj-multiblock-i)

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

" --- vim-wordmotion --- "
" nmap w          <Plug>WordMotion_w
" nmap b          <Plug>WordMotion_b
" nmap gE         <Plug>WordMotion_gE
" omap aW         <Plug>WordMotion_aW
" cmap <C-R><C-W> <Plug>WordMotion_<C-R><C-W>

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
