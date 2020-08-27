"CoC configlet
let g:coc_snippet_next = '<UP>'
let g:coc_snippet_prev = '<DOWN>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-git',
  \ 'coc-yaml',
  \ 'coc-dictionary',
  \ ]

  "\'coc-html',
  "\'coc-css',
  "\'coc-snippets',
  "\'coc-prettier',
  "\'coc-eslint',
  "\'coc-emmet',
  "\'coc-tsserver',
  "\'coc-pairs',
  "\'coc-json',
  "\'coc-python',
  "\'coc-imselect',
  "\'coc-highlight',
  "\'coc-emoji',
  "\'coc-lists',
  "\'coc-post',
  "\'coc-stylelint',
  "\'coc-yaml',
  "\'coc-template',
  "\'coc-tabnine',
  "\'coc-marketplace',
  "\ 'coc-git'
  "\'coc-gitignore',
  "\'coc-yank'


" augroup MyAutoCmd
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

"Use tab for trigger completion with characters ahead and navigate
use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <expr> <CR> pumvisible() ? "\<End>\<CR>" : "\<CR>"

" inoremap <silent><expr> <Tab> pumvisible() ? "\<CR>" : "\<TAB>"

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"

" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


