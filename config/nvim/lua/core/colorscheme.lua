-- Theme

-- Enable 256 color terminal
set.t_Co = '256'
-- let &t_ut=''

-- Enable true color
if fn.has('termguicolors') == 1 then
  set.termguicolors = true
end


-- Colorscheme settings
-- ---------------------------------------------------------
-- cmd 'colorscheme one'
-- g.one_allow_italics = 1
-- set.background = 'dark'

cmd 'colorscheme onedark'

-- Color overrides
-- one#highlight(group, fg, bg, attribute)
-- onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
-- ---------------------------------------------------------

-- default functionality
fn['onedark#extend_highlight']("Normal", { bg = { gui = "#1a1a1a" } })
-- fn['one#highlight']('Normal', '', '212122', 'none')
-- fn['one#highlight']('NormalNC', '', '262627', 'none')
-- fn['one#highlight']('Search', 'NONE', '353644', '')

-- barbar (tabs)
-- call one#highlight('BufferCurrent', 'ff0000', '00ff00', '')
-- BufferCurrent
-- BufferCurrentIndex
-- BufferCurrentMod
-- BufferCurrentSign
-- BufferCurrentTarget
-- BufferVisible
-- BufferVisibleIndex
-- BufferVisibleMod
-- BufferVisibleSign
-- BufferVisibleTarget
-- BufferInactive
-- BufferInactiveIndex
-- BufferInactiveMod
-- BufferInactiveSign
-- BufferInactiveTarget

-- Doesn't work with one color scheme
-- cmd 'highlight SignColumn guibg=#212122'

-- hi Whitespace guifg=#725972 guibg=NONE
-- hi VertSplit guifg=#222222
--hi Normal guibg=NONE ctermbg=NONE
-- hi LineNr guibg=NONE
-- hi CursorColumn guibg=#69737D
-- hi CursorLineNr guibg=#2e2e2e guifg=#69737D
-- hi SignColumn guifg=#ebdbb2 guibg=NONE guisp=NONE gui=NONE
-- hi! link pythonSpaceError  NONE
-- hi! link pythonIndentError NONE
-- hi NormalFloat gui=NONE guifg=#93a1a1 guibg=#002931
-- hi SpellBad guifg=none guibg=#ff0000 gui=bold
-- hi SpellBad guifg=#C69F9F guibg=none gui=underline

-- Change background color on inactive windows
-- hi InactiveWindow guibg=#474E5C

-- set winhighlight=Normal:Normal,NormalNC:InactiveWindow
-- hi CursorLine guibg=#2e2e2e

-- Folds
-- hi FoldColumn guifg=#00ff00
-- hi def link Folded Comment
-- hi Folded guifg=#6d8d8c guibg=NONE gui=NONE

-- diff
-- ---------------------------------------------------------
-- highlight DiffAdd    gui=none guifg=none guibg=#1c2e1c
-- highlight DiffDelete gui=none guifg=#2e1c1c guibg=#2e1c1c
-- highlight DiffChange cterm=none gui=none guibg=#313225
-- highlight DiffText   gui=none guibg=#313225
-- highlight DiffText   gui=none guifg=bg guibg=Red

-- GetColorSynatxGroup
-- ---------------------------------------------------------
-- map <LocalLeader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
-- \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
-- \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
