
-- Use space as leader and ; as secondary-leader --
g.mapleader = ' '
g.maplocalleader = ';'

-- Set main config directory as parent directory --
CACHE_PATH = fn.fnamemodify(fn.stdpath('cache'), ':h')
DATA_PATH = fn.stdpath('data')

-- Disable default vim plugins --
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logiPat = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.netrw_nogx = 1 -- disable netrw's gx mapping.
g.loaded_netrwPlugin = 1
g.loaded_rrhelper = 1
g.loaded_shada_plugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_2html_plugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1

-- Get rid of some default mappings --
map('n', ' ', '')
map('x', ' ', '')
map('n', ',', '')
map('x', ',', '')
map('n', ';', '')
map('x', ';', '')


-- @todo still need this?
-- Ensure data directories
-- for _, dir in ipairs({'undo', 'backup', 'session', 'spell'}) do
--   local my_dir = DATA_PATH .. '/' .. dir
--   if not is_dir(my_dir) then
--     os.execute('mkdir ' .. my_dir)
--   end
-- end


-- Search and use virtual environments specifically made for Neovim.

-- Disable python 2
g.loaded_python_provider = 0

-- Add python 3 to path, and tell neovim to use it by default
local python_venv = CACHE_PATH .. '/pyenv/versions/neovim3/bin'
if is_dir(python_venv) then
  g.python3_host_prog = python_venv .. '/python'
  cmd(string.format('let $PATH = "%s:" . $PATH', python_venv))
end
