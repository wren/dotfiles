
require 'core.helpers'
require 'core.defaults'
require 'core.general'
require 'core.events'
require 'core.filetype'
require 'core.keymap'
-- require 'core.colorscheme'

-- Old files below here --
-- require 'core.load_plugins'
local vim_files = {
  'keymappings_plugins',
}

for _, file in ipairs(vim_files) do
  vim.cmd(string.format('source %s/core/%s.vim', fn.stdpath('config'), file))
end

-- Just in case --
set.secure = true
