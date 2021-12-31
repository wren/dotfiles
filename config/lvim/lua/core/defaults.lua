
-- Use space as leader and ; as secondary-leader --
g.mapleader = ' '
g.maplocalleader = '\\'

-- Set main config directory as parent directory --
CACHE_PATH = fn.fnamemodify(fn.stdpath('cache'), ':h')
DATA_PATH = fn.stdpath('data')

-- Search for and use virtual environments specifically made for Neovim.
-- Disable python 2
g.loaded_python_provider = 0

-- Add python 3 to path, and tell neovim to use it by default
PYTHON_VENV = CACHE_PATH .. '/python-virtual-envs/neovim/bin'
if fn.isdirectory(PYTHON_VENV) then
  g.python3_host_prog = PYTHON_VENV .. '/python'
  cmd(string.format('let $PATH = "%s:" . $PATH', PYTHON_VENV))
end
