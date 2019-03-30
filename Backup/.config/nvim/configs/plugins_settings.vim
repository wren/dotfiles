" --- PLUGINS --- "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline already shows us the mode, we don't need it twice
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" 		let g:lightline.tabline = {
" 		    \ 'left': [ [ 'tabs' ] ],
" 		    \ 'right': [[]] }

"     let g:lightline.tab = {
"             \ 'active': [ 'tabnum', 'filename', 'modified' ],
"             \ 'inactive': [ 'tabnum', 'filename', 'modified' ] 
"             \ }

let g:lightline.component_expand = {
  \ 'neomake_infos': 'lightline#neomake#infos',
  \ 'neomake_warnings': 'lightline#neomake#warnings',
  \ 'neomake_errors': 'lightline#neomake#errors',
  \ 'neomake_ok': 'lightline#neomake#ok',
  \}

let g:lightline.component_type = {
  \ 'neomake_infos': 'left',
  \ 'neomake_warnings': 'warning',
  \ 'neomake_errors': 'error',
  \ 'neomake_ok': 'middle',
  \}

let g:lightline.active = { 
  \ 'left': [ ['mode', 'paste'],
  \             ['fugitive'], ['readonly', 'filename', 'modified' ] ],
  \ 'right': [
  \   [ 'lineinfo' ], ['percent'],
  \   ['neomake_warnings', 'neomake_errors', 'neomake_infos', 'neomake_ok'], 
  \   [ 'fileformat' ], [ 'fileencoding' ], 
  \ ],
  \}

" let g:lightline.inactive = { 
"   \ 'left': [['filename', 'modified'] ],
"   \}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
map <leader>b :NERDTreeToggle<cr>
map <leader>bb :NERDTreeFromBookmark<Space>
nnoremap <silent> <leader>v :NERDTreeFind<cr>
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>
" Automatically close a tab if the only window is NERDTree
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuzzy File Finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
nnoremap <C-P> :FZF<CR>
inoremap <C-R> <ESC>:FZF<CR>i
nnoremap <M-C-P> :Buffers<CR>

" => Signify
let g:signify_vcs_list = [ 'git' ]

" => Deoplete
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

"=> Flow
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$(cd src/frontend && npm bin):$PATH && which flow'))
let g:eslint_path = StrTrim(system('PATH=$(npm bin):$(cd src/frontend && npm bin):$PATH && which eslint'))

" == Shougo/deoplete.nvim ==
" == carlitux/deoplete-ternjs ==
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deoplete#sources#flow#flow_bin = g:flow_path
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
set completeopt-=preview

" == neomake/neomake ==
let g:neomake_warning_sign = {
\ 'text': '⚠',
\ 'texthl': 'WarningMsg',
\ }
let g:neomake_error_sign = {
\ 'text': '✘',
\ 'texthl': 'ErrorMsg',
\ }

let g:neomake_javascript_enabled_makers = ['flow']
let g:neomake_jsx_enabled_makers = ['flow']
" let g:neomake_javascript_eslint_exe = StrTrim(system('PATH="$(npm bin)":"$(cd src/frontend && npm bin)":"$PATH" && which eslint'))
let g:neomake_javascript_eslint_exe = $PWD .'/src/frontend/node_modules/.bin/eslint'

let g:neomake_javascript_flkow_exe = g:flow_path
let g:neomake_jsx_flow_exe = g:flow_path

let g:lightline#neomake#prefix_infos = "\uf05a  "
let g:lightline#neomake#prefix_warnings = "\uf071  "
let g:lightline#neomake#prefix_errors = "\uf05e  "
let g:lightline#neomake#prefix_ok = "\uf058"


" call neomake#configure#automake('nw', 1000) 
" call neomake#configure#automake('nrwi', 500)
autocmd BufWritePost,BufEnter * Neomake
" autocmd InsertChange,TextChanged * update | Neomake " lint as you type (THIS WILL SAVE EVERY CHANGE

  " == mxw/vim-jsx ==
let g:jsx_ext_required = 0

" => Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.graphql Prettier

