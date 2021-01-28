lua << EOF
----- Helpers -----
local api, cmd, fn, g, set = vim.api, vim.cmd, vim.fn, vim.g, vim.o

-- from: https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua --
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function is_dir(path)
  return os.execute('[[ -d "' .. path .. '" ]]')
end

-- Set main config directory as parent directory --
VIM_PATH = vim.call('fnamemodify', vim.call('resolve', vim.call('expand', '<sfile>:p')), ':h:h')
CACHE_PATH = vim.call('expand', os.getenv('XDG_CACHE_HOME') or '~/.cache')
DATA_PATH = vim.call('expand', os.getenv('XDG_DATA_HOME') or '~/.local/share') .. '/nvim'

-- Temporary handoff while we change over to lua --
cmd('let $VIM_PATH = "' .. VIM_PATH .. '"')
cmd('let $CACHE_PATH = "' .. CACHE_PATH .. '"')
cmd('let $DATA_PATH = "' .. DATA_PATH .. '"')

-- Disable vim distribution plugins --
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

-- Use space as leader and ; as secondary-leader --
g.mapleader = ' '
g.maplocalleader = ';'

if fn.has('vim_starting') == 1 then
  -- Release keymappings prefixes, evict entirely for use of plug-ins. --
  map('n', ' ', '<Nop>')
  map('x', ' ', '<Nop>')
  map('n', ',', '<Nop>')
  map('x', ',', '<Nop>')
  map('n', ';', '<Nop>')
  map('x', ';', '<Nop>')

  -- Ensure data directories
  for _, dir in ipairs({'undo', 'backup', 'session', 'spell'}) do
    local my_dir = DATA_PATH .. '/' .. dir
    if not is_dir(my_dir) then
      os.execute('mkdir ' .. my_dir)
    end
  end

  -- Search and use virtual environments specifically made for Neovim.
  -- Disable python 2
  g.loaded_python_provider = 0
  -- Add python 3 to path, and tell neovim to use it when possible
  local python_venv = CACHE_PATH .. '/pyenv/versions/neovim3/bin'
  if fn.has('nvim') == 1 and is_dir(python_venv) then
    g.python3_host_prog = python_venv .. '/python'
    cmd('let $PATH = "' .. python_venv .. ':" . $PATH')
  end

end

local files = {
  'load_plugins',
  'general',
  'filetype',
  'keymappings_plugins',
  'keymappings_general',
  'colorscheme'
}

for _, file in ipairs(files) do
  vim.cmd('source core/' .. file .. '.vim')
end

-- Just in case --
set.secure = true
EOF
