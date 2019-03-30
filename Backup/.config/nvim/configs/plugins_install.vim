" " == General editor plugins ==
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin' " too noisy in the tree view. maybe there's a way to change the icons to colors?
Plug 'tpope/vim-repeat' " don't know what this does
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive' " git integration
Plug 'itchyny/lightline.vim'
Plug 'NovaDev94/lightline-onedark'
" Plug 'w0rp/ale'
" Plug 'maximbaz/lightline-ale'
Plug 'yuttie/comfortable-motion.vim'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-expand-region'
Plug 'nvie/vim-flake8'
Plug 'michaeljsmith/vim-indent-object'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'vim-syntastic/syntastic'

" These three go together
Plug 'amix/vim-zenroom2'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'vim-scripts/CursorLineCurrentWindow'
" === Colors === "
Plug 'kaicataldo/material.vim'


" " == Autocomplete plugins ==
Plug 'ervandew/supertab'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'steelsojka/deoplete-flow'
 
" " == JavaScript syntax highlighting ==
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
 
" == SCSS and CSS syntax highlighting ==
Plug 'cakebaker/scss-syntax.vim'
 
" == JavaScript tools integration ==
Plug 'neomake/neomake'
Plug 'sinetoami/lightline-neomake'

