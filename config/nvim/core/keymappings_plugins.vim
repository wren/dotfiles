
" " --- coc.nvim --- "
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
" " Use `[c` and `]c` for navigate diagnostics
" nmap <silent> ]c <Plug>(coc-diagnostic-prev)
" nmap <silent> [c <Plug>(coc-diagnostic-next)
" " Remap for rename current word
" nmap <leader>cn <Plug>(coc-rename)
" " Remap for format selected region
" vmap <leader>cf  <Plug>(coc-format-selected)
" nmap <leader>cf  <Plug>(coc-format-selected)
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>ca  <Plug>(coc-codeaction-selected)
" nmap <leader>ca  <Plug>(coc-codeaction-selected)
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" " use <c-space> for trigger completion.
" inoremap <silent><expr> <C-space> coc#refresh()
" inoremap <silent><expr> <C-Space> pumvisible() ? "\<End>" : coc#refresh()
" nmap [g <Plug>(coc-git-prevchunk)
" nmap ]g <Plug>(coc-git-nextchunk)
" " show chunk diff at current position
" nmap gs <Plug>(coc-git-chunkinfo)
" " show commit contains current position
" nmap gm <Plug>(coc-git-commit)
" nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
" " float window scroll
" nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
" nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" " multiple cursors session
" nmap <silent> <C-S-M> <Plug>(coc-cursors-position)
" nmap <silent> <C-m> <Plug>(coc-cursors-word)
" xmap <silent> <C-m> <Plug>(coc-cursors-range)
" nnoremap <silent> <leader>cm ::CocSearch -w<Space>
" " use normal command like `<leader>xi(`
" nmap <leader>x  <Plug>(coc-cursors-operator)


" Use K for show documentation in preview window
nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    " call CocAction('doHover')
  endif
endfunction


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


" --- magit.vim --- "
nnoremap <silent> mg :Magit<CR>

" --- gina.vim --- "
nnoremap <silent><Leader>gp :Gina push<CR>


" --- vim-mundo --- "
nnoremap <silent> <leader>m :MundoToggle<CR>


" --- vim-choosewin --- "
nmap -         <Plug>(choosewin)
nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>


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


" --- defx.nvim --- "
nnoremap <silent><C-\> :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <Leader>eo :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <Leader>ef :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>


" --- vim-startify --- "
nnoremap <silent> <leader>s :Startify<CR>


" --- simplenote.vim --- "
nnoremap <silent> <leader>sl :SimplenoteList<CR>
nnoremap <silent> <leader>sn :SimplenoteNew<CR>
nnoremap <silent> <leader>sd :SimplenoteDelete<CR>
nnoremap <silent> <leader>st :SimplenoteTag<CR>
nnoremap <silent> <leader>su :SimplenoteUpdate<CR>
nnoremap <silent> <leader>sp :SimplenotePin<CR>
nnoremap <silent> <leader>sP :SimplenoteUnpin<CR>
nnoremap <silent> <leader>sV :SimplenoteVersionInfo<CR>
nnoremap <leader>sv :SimplenoteVersion<SPACE>


" --- dash.vim --- "
nnoremap <silent><leader>d :Dash<CR>


" --- vim-expand-region --- "
xmap v <Plug>(expand_region_expand)
xmap V <Plug>(expand_region_shrink)


" --- splitjoin.vim --- "
let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
nmap sj :SplitjoinJoin<CR>
nmap sk :SplitjoinSplit<CR>


" --- vista.vim --- "
nnoremap <silent><localleader>v :Vista!!<CR>
nnoremap <silent><leader>fv     :Vista finder coc<CR>


" --- tagbar --- "
nnoremap <silent><localleader>t :TagbarToggle<CR>


" --- ale --- "
nmap [a <Plug>(ale_next_wrap)
nmap ]a <Plug>(ale_previous_wrap)


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

