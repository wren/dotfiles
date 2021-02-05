require 'plugins.packer'
require 'plugins.events'
require 'plugins.install'
require 'plugins.colorscheme'


-- Old files below here --
local vim_files = {
  'keymappings_plugins',
}

for _, file in ipairs(vim_files) do
  vim.cmd(string.format('source %s/core/%s.vim', fn.stdpath('config'), file))
end

