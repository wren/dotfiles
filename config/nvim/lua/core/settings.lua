
-- General settings --
set.mouse = 'a'
set.backup = false
set.swapfile = false
set.autoread = true
set.autowrite = true
set.confirm = true
set.splitbelow = true
set.splitright = true
set.fixeol = false              -- don't secretly add newlines to every file at eof
set.encoding = 'UTF-8'
-- cmd [[scriptencoding UTF-8]]
set.laststatus = 2
set.showtabline = 2
set.showmode = false
set.statusline = '-'            -- hide file name in statusline
cmd [[set fillchars+=vert:\|]]  -- add a bar for vertical splits
cmd [[set fcs=eob:\ ]]          -- hide ~

-- History saving
set.history = 9999
set.shada = "'300,<50,@100,s10,h"
set.number = true
set.timeout = true
set.ttimeout = true
set.timeoutlen = 500
set.ttimeoutlen = 10
set.updatetime = 250
set.undofile = true
set.undodir = '~/.cache/vim/undo'
set.relativenumber = true
set.backspace = '2'
set.backspace = 'indent,eol,start'

set.colorcolumn = '+1'  -- Set guide relative to textwidth

-- Tabs and Indents --
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 2
set.smarttab = true
set.autoindent = true
set.smartindent = true
set.shiftround = true

set.hidden = true
set.shortmess='aFc'
set.signcolumn = 'yes'
set.completefunc = 'emoji#complete'
set.completeopt = 'longest,menu'
cmd [[set complete+=k]]        -- add dictionary entries to completion
set.list = true
cmd([[set listchars=nbsp:+,trail:·,extends:→,precedes:←,eol:\ ,tab:├─,trail:·]])

set.ignorecase = true           -- Search ignoring case
set.smartcase = true            -- Keep case when searching with *
set.infercase = true            -- Adjust case in insert completion mode
set.incsearch = true            -- Incremental search
set.hlsearch = true             -- Highlight search results
set.wrapscan = true             -- Searches wrap around the end of the file
cmd [[set whichwrap+=<,>,h,l]]  -- Wraps left and right to the next/previous line
set.wrap = false                -- Do not wrap any lines
set.showmatch = true            -- Jump to matching bracket
cmd [[set matchpairs+=<:>]]     -- Add HTML brackets to pair matching
set.matchtime = 1               -- Tenths of a second to show the matching paren
cmd [[set cpoptions-=m]]        -- showmatch will wait 0.5s or until a char is typed
set.viewoptions='cursor,folds,slash,unix' -- what
set.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,globals'

set.foldenable = false
set.foldlevelstart = 99

set.grepprg=[[rg\ --vimgrep\ $*]]
cmd [[set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*,*/node_modules/*]]
set.wildmenu = true

-- Changes style for inactive windows (can be updated in color scheme)
-- set.winhighlight = 'Normal:Normal,NormalNC:InactiveWindow'

-- Set 7 lines to the cursor - when moving vertically using j/k
set.so = 6

set.conceallevel = 3
set.concealcursor = 'n'

-- Vim Directories --
---------------------
set.undofile = true
set.swapfile = false
set.backup = false
local my_str = DATA_PATH .. '/%s//,' .. DATA_PATH .. ',~/tmp/var/tmp,/tmp'
set.directory = my_str:format('swap')
set.undodir = my_str:format('undo')
set.backupdir = my_str:format('backup')
set.viewdir = my_str:format('view')

local CUSTOM_DICT = DATA_PATH .. '/spell/custom.en.utf-8.add'
local WORDS_DICT = DATA_PATH .. '/spell/words.en.utf-8.add'
set.spell = false
set.spellfile = CUSTOM_DICT
set.spelllang = 'en'
-- set.spelllang='en,es' -- something keeps going wrong with this
cmd('set dictionary+=%s' .. WORDS_DICT)
cmd('set dictionary+=%s' .. CUSTOM_DICT)

-- Copy/pasting stuff
if fn.has('clipboard') == 1 then
  cmd 'set clipboard& clipboard+=unnamedplus'
end

-- If sudo, disable vim swap/backup/undo/shada/viminfo writing
local sudo_user = os.getenv('SUDO_USER')
local user = os.getenv('USER')
if not is_empty(sudo_user) and user ~= sudo_user then
  set.swapfile = false
  set.backup = false
  set.writebackup = false
  set.undofile = false
  set.shada = 'NONE'
  set.viminfo = 'NONE'
end

-- Secure sensitive information, disable backup files in temp directories
set.secure = true
if fn.exists('&backupskip') ~= 0 then
  cmd 'set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*'
end


-- Markdown fenced syntax highlighting
g.markdown_fenced_languages = { 'html', 'bash=sh', 'css', 'javascript', 'js=javascript', 'go' }
