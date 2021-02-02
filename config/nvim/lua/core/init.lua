
require 'core.helpers'
require 'core.defaults'
require 'core.general'
require 'core.events'
require 'core.plugin_manager'
-- require 'core.load_plugins'
require 'core.filetype'
require 'core.keymap'
require 'core.colorscheme'

local vim_files = {
  'keymappings_plugins',
}

for _, file in ipairs(vim_files) do
  vim.cmd(string.format('source %s/core/%s.vim', fn.stdpath('config'), file))
end

-- Just in case --
set.secure = true
