" Theme

" Enable 256 color terminal
set t_Co=256
" let &t_ut=''

" Enable true color
if has('termguicolors')
    set termguicolors
endif


" Colorscheme settings
" ---------------------------------------------------------
colorscheme one
let g:one_allow_italics = 1
set background=dark

" Color overrides
" ---------------------------------------------------------
" hi Whitespace guifg=#725972 guibg=NONE
" hi VertSplit guifg=#222222
"hi Normal guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE
" hi CursorColumn guibg=#69737D
" hi CursorLineNr guibg=#2e2e2e guifg=#69737D
" hi SignColumn guifg=#ebdbb2 guibg=NONE guisp=NONE gui=NONE
" hi! link pythonSpaceError  NONE
" hi! link pythonIndentError NONE
" hi NormalFloat gui=NONE guifg=#93a1a1 guibg=#002931
" hi SpellBad guifg=none guibg=#ff0000 gui=bold
" hi SpellBad guifg=#C69F9F guibg=none gui=underline

" Change background color on inactive windows
" hi InactiveWindow guibg=#474E5C
" call one#highlight('Normal', '', '212122', 'none')
call one#highlight('NormalNC', '', '262627', 'none')
" set winhighlight=Normal:Normal,NormalNC:InactiveWindow
" hi CursorLine guibg=#2e2e2e

" Highlight trailing whitespaces
" hi ErrorMsg guibg=#ff5370 guifg=#212121

" Plug
" hi plugDeleted guifg=#545454


" Folds
" hi FoldColumn guifg=#00ff00
" hi def link Folded Comment
" hi Folded guifg=#6d8d8c guibg=NONE gui=NONE


" Defx Highlight
" ---------------------------------------------------------
" highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
" highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
" highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
" highlight def link Defx_filename_3_Untracked Comment
" highlight def link Defx_filename_3_Unknown Comment
" highlight def link Defx_filename_3_Renamed Title
" highlight def link Defx_filename_3_Unmerged Label
" highlight Defx_git_Deleted ctermfg=13 guifg=#b294bb

" highlight Defx_git_Untracked guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
" highlight Defx_git_Ignored guibg=#ff0000 guifg=NONE ctermbg=NONE ctermfg=NONE
" highlight Defx_git_Unknown guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
" highlight Defx_git_Renamed ctermfg=214 guifg=#fabd2f
" highlight Defx_git_Modified ctermfg=214 guifg=#fabd2f
" highlight Defx_git_Unmerged ctermfg=167 guifg=#fb4934
" highlight Defx_git_Deleted ctermfg=167 guifg=#fb4934
" highlight Defx_git_Staged ctermfg=142 guifg=#b8bb26

" buftabline highlight
" ---------------------------------------------------------
" highlight BufTabLineCurrent ctermbg=96 guibg=#5d4d7a

" buftabline highlight
" ---------------------------------------------------------
" highlight  gitInfoRepotitle    guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitInfoHeadtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitInfoUpstreamtitle  guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitInfoPushtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitCommitModetitle  guibg=NONE guisp=NONE gui=bold cterm=bold

" highlight  gitSectionsStaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitSectionsUnstaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitSectionsCommitMsg guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitSectionsCommitStash  guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
" highlight  gitSectionsRecentCommit guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold

" diff
" ---------------------------------------------------------
" highlight DiffAdd    gui=none guifg=none guibg=#1c2e1c
" highlight DiffDelete gui=none guifg=#2e1c1c guibg=#2e1c1c
" highlight DiffChange cterm=none gui=none guibg=#313225
" highlight DiffText   gui=none guibg=#313225
" highlight DiffText   gui=none guifg=bg guibg=Red

" GetColorSynatxGroup
" ---------------------------------------------------------
map <LocalLeader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
