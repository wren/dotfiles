" Theme

" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
    set termguicolors
endif

set background=dark

" Colorscheme settings
" ---------------------------------------------------------
let g:material_theme_style = 'dark'
" let g:material_terminal_italics = 1

let g:material_style='oceanic'
colorscheme material

" Vim Colors
" ---------------------------------------------------------
hi Whitespace guifg=#725972 guibg=NONE
hi VertSplit guifg=#222222
"hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE
" hi CursorColumn guibg=#69737D
hi CursorLineNr guibg=#2e2e2e guifg=#69737D
hi SignColumn guifg=#ebdbb2 guibg=NONE guisp=NONE gui=NONE
" hi! link pythonSpaceError  NONE
" hi! link pythonIndentError NONE
hi NormalFloat gui=NONE guifg=#93a1a1 guibg=#002931


" Change background color on inactive windows
hi InactiveWindow guibg=#2E2E2E
set winhighlight=Normal:Normal,NormalNC:InactiveWindow
hi CursorLine guibg=#2e2e2e

" Highlight trailing whitespaces
hi ErrorMsg guibg=#ff5370 guifg=#212121

" Plug
hi plugDeleted guifg=#545454

"Pmenu Colors
" ---------------------------------------------------------
hi PMenuSel guifg=#d0d0d0 guibg=#65737E gui=NONE

"coc setting
" ---------------------------------------------------------
" hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
hi default CocHighlightText  guibg=#725972 ctermbg=96
" hi CocWarningSign  ctermfg=32 ctermbg=NONE guifg=#0087d7 guibg=NONE

" Folds
" hi FoldColumn guifg=#00ff00
hi def link Folded Comment
hi Folded guifg=#525151 guibg=NONE gui=NONE

"GitGutter Coc-git Highlight
" ---------------------------------------------------------
" highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
" highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
" highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
" highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

" Defx Highlight
" ---------------------------------------------------------
" highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
" highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
" highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
" highlight def link Defx_filename_3_Untracked Comment
" highlight def link Defx_filename_3_Unknown Comment
" highlight def link Defx_filename_3_Renamed Title
" highlight def link Defx_filename_3_Unmerged Label
" " highlight Defx_git_Deleted   ctermfg=13 guifg=#b294bb

" buftabline highlight
" ---------------------------------------------------------
highlight BufTabLineCurrent ctermbg=96 guibg=#5d4d7a

" buftabline highlight
" ---------------------------------------------------------
highlight  gitInfoRepotitle    guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoHeadtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoUpstreamtitle  guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoPushtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitCommitModetitle  guibg=NONE guisp=NONE gui=bold cterm=bold
" 
highlight  gitSectionsStaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsUnstaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitMsg guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitStash  guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsRecentCommit guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold

"GetColorSynatxGroup
" ---------------------------------------------------------
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
