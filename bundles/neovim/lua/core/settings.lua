
-- General settings --
opt.mouse = 'a'
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.autowrite = true
opt.confirm = true
opt.splitbelow = true
opt.splitright = true
opt.fixendofline = false  -- don't secretly add newlines to every file at eof
opt.encoding = 'UTF-8'
opt.laststatus = 2
opt.showtabline = 2
opt.showmode = false
opt.fillchars:append({
  vert = ' ', -- add a bar for vertical splits
  eob = ' ',  -- hide ~ at the end of files
})

-- History saving
opt.history = 9999
opt.shada = "'300,<50,@100,s10,h"
opt.number = true
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 250
opt.undofile = true
opt.undodir = '~/.cache/vim/undo'
opt.relativenumber = true
opt.backspace = '2'
opt.backspace = 'indent,eol,start'

opt.colorcolumn = '+1'  -- Set guide relative to textwidth

-- Tabs and Indents --
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 2
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true

opt.hidden = true
opt.shortmess='aFc'
opt.signcolumn = 'yes'
opt.completefunc = 'emoji#complete'
opt.completeopt = 'longest,menu'
opt.complete:append('k')  -- add dictionary entries to completion
opt.list = true
opt.listchars:append({
  nbsp = '+',
  trail = '·',
  extends = '→',
  precedes = '←',
  eol = ' ',
  tab = '├─',
  trail = '·',
})

opt.ignorecase = true           -- Search ignoring case
opt.smartcase = true            -- Keep case when searching with *
opt.infercase = true            -- Adjust case in insert completion mode
opt.incsearch = true            -- Incremental search
opt.hlsearch = true             -- Highlight search results
opt.wrapscan = true             -- Searches wrap around the end of the file
opt.whichwrap:append('<,>,h,l') -- showmatch will wait 0.5s or until a char is typed
opt.wrap = false                -- Do not wrap any lines
opt.showmatch = true            -- Jump to matching bracket
opt.matchpairs:append( '<:>' )  -- showmatch will wait 0.5s or until a char is typed
opt.matchtime = 1               -- Tenths of a second to show the matching paren
opt.cpoptions:remove('m')       -- showmatch will wait 0.5s or until a char is typed
opt.viewoptions='cursor,folds,slash,unix' -- what
opt.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,globals'

opt.foldenable = false
opt.foldlevelstart = 99
opt.foldtext = 'v:lua.custom_fold_text()'

opt.grepprg=[[rg\ --vimgrep\ $*]]
opt.wildignore:append({
  '*.so',
  '*~',
  '*/.git/*',
  '*/.svn/*',
  '*/.DS_Store',
  '*/tmp/*',
  '*/node_modules/*',
})
opt.wildmenu = true

-- Changes style for inactive windows (can be updated in color scheme)
-- opt.winhighlight = 'Normal:Normal,NormalNC:InactiveWindow'

-- Set 3 lines to the cursor - when moving vertically using j/k
opt.scrolloff = 2
opt.sidescrolloff = 10

opt.conceallevel = 2
opt.concealcursor = 'c'

-- Vim Directories --
---------------------
opt.undofile = true
opt.swapfile = false
opt.backup = false
local DATA_PATH = fn.stdpath('data')
local my_str = DATA_PATH .. '/%s//,' .. DATA_PATH .. ',~/tmp/var/tmp,/tmp'
opt.directory = my_str:format('swap')
opt.undodir = my_str:format('undo')
opt.backupdir = my_str:format('backup')
opt.viewdir = my_str:format('view')

-- Spelling & Lang --
opt.spell = false
-- opt.spelllang = {'en_us', 'es_mx'}
opt.spelllang = {'en_us'}

-- Copy/pasting stuff
if fn.has('clipboard') == 1 then
  opt.clipboard:append('unnamedplus')
end

-- If sudo, disable vim swap/backup/undo/shada/viminfo writing
local sudo_user = os.getenv('SUDO_USER')
local user = os.getenv('USER')
if not is_empty(sudo_user) and user ~= sudo_user then
  opt.swapfile = false
  opt.backup = false
  opt.writebackup = false
  opt.undofile = false
  opt.shada = 'NONE'
  opt.viminfo = 'NONE'
end

-- Secure sensitive information, disable backup files in temp directories
opt.secure = true
if fn.exists('&backupskip') ~= 0 then
  opt.backupskip:append({
    '/tmp/*',
    '$TMPDIR/*',
    '$TMP/*',
    '$TEMP/*',
    '*/shm/*',
    '/private/var/*',
    '*.nobackup/*',
    '*.noindex/*',
  })
end

-- Markdown fenced syntax highlighting
g.markdown_fenced_languages = { 'html', 'bash=sh', 'css', 'javascript', 'js=javascript', 'go' }

if fn.has('termguicolors') == 1 then
  opt.termguicolors = true
end
