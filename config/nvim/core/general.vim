set mouse=a
set nobackup
set noswapfile
set autoread
set autowrite
set confirm
set splitbelow
set splitright
set bsdir=buffer
if has('vim_starting')
    set encoding=UTF-8
    scriptencoding UTF-8
endif
set laststatus=2
set showtabline=2
set noshowmode
set statusline=-        " hide file name in statusline
set fillchars+=vert:\|  " add a bar for vertical splits
if get(g:,'gruvbox_transp_bg',1)
 set fcs=eob:\           " hide ~
endif
if has('mac')
  let g:clipboard = {
    \   'name': 'macOS-clipboard',
    \   'copy': {
    \      '+': 'pbcopy',
    \      '*': 'pbcopy',
    \    },
    \   'paste': {
    \      '+': 'pbpaste',
    \      '*': 'pbpaste',
    \   },
    \   'cache_enabled': 0,
    \ }
endif

" Default to bash for files with syntax sh
let g:is_bash = 1

if has('clipboard')
    set clipboard& clipboard+=unnamedplus
endif
set history=9999
set number
set timeout ttimeout
set colorcolumn=+1  " Set guide relative to textwidth
set timeoutlen=500
set ttimeoutlen=10
set updatetime=750
set undofile
set undodir=~/.cache/vim/undo
set relativenumber
set backspace=2
set backspace=indent,eol,start

" Tabs and Indents
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set shiftround

set hidden
set shortmess=aFc
set signcolumn=yes
set completefunc=emoji#complete
set completeopt =longest,menu
" set completeopt-=preview
set complete+=k        " add dictionary entries to completion
set list
set listchars=nbsp:+,trail:·,extends:→,precedes:←,eol:\ ,tab:├─,trail:·

set ignorecase         " Search ignoring case
set smartcase          " Keep case when searching with *
set infercase          " Adjust case in insert completion mode
set incsearch          " Incremental search
set hlsearch           " Highlight search results
set wrapscan           " Searches wrap around the end of the file
set whichwrap+=<,>,h,l " Wraps left and right to the next/previous line
set nowrap             " Do not wrap any lines
set showmatch          " Jump to matching bracket
set matchpairs+=<:>    " Add HTML brackets to pair matching
set matchtime=1        " Tenths of a second to show the matching paren
set cpoptions-=m       " showmatch will wait 0.5s or until a char is typed
set viewoptions=cursor,folds,slash,unix "what
set grepprg=rg\ --vimgrep\ $*
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
set wildmenu

" Set 7 lines to the cursor - when moving vertically using j/k
set so=6

set conceallevel=3 concealcursor=n

" Vim Directories {{{
" ---------------
set undofile noswapfile nobackup
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/

let $CUSTOM_DICT = expand($DATA_PATH.'/spell/custom.en.utf-8.add')
let $WORDS_DICT = expand($DATA_PATH.'/spell/words.en.utf-8.add')
set nospell spellfile=$CUSTOM_DICT
set spelllang=en,es
set dictionary+=$WORDS_DICT
set dictionary+=$CUSTOM_DICT

" History saving
set history=10000
if has('nvim')
    set shada='300,<50,@100,s10,h
else
    set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
        \ && $HOME !=# expand('~'.$USER)
        \ && $HOME ==# expand('~'.$SUDO_USER)

    set noswapfile
    set nobackup
    set nowritebackup
    set noundofile
    if has('nvim')
        set shada="NONE"
    else
        set viminfo="NONE"
    endif
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
    set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup MyAutoCmd
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

set nofoldenable
set foldlevelstart=99

" Generate spell files if any updates have happened
for d in glob($DATA_PATH . '/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        silent exec 'mkspell! ' . fnameescape(d)
    endif
endfor

" better autocomplete for commands
set ignorecase smartcase
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

augroup cd_if_directory
  autocmd!
  autocmd BufEnter * call s:cd_if_open_directory()
augroup END

function! s:cd_if_open_directory()
  let l:full_path = expand(expand('%:p'))
  if isdirectory(l:full_path)
    execute 'cd' fnameescape(l:full_path)
  endif
endfunction

" Markdown fenced syntax highlighting
let g:markdown_fenced_languages = [ 'html', 'bash=sh', 'css', 'javascript', 'js=javascript', 'go', ]

