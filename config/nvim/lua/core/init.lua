
require 'core.helpers'
require 'core.defaults'
require 'core.events'
require 'core.load_plugins'
require 'core.general'
require 'core.filetype'
-- require 'core.keymap'

local vim_files = {
  'keymappings_general',
  'keymappings_plugins',
  'colorscheme'
}

for _, file in ipairs(vim_files) do
  vim.cmd(string.format('source %s/core/%s.vim', fn.stdpath('config'), file))
end

-- Just in case --
set.secure = true
