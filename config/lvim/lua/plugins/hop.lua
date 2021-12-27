-- overlay for jumping to places in the buffer (e.g. press "f")
local plugin = { 'phaazon/hop.nvim' }

plugin.event = 'BufRead'
plugin.config = function()
  require('hop').setup()
  vim.api.nvim_set_keymap('n', 'f', ':HopWord<cr>', { silent = true })
  vim.api.nvim_set_keymap('n', 'F', ':HopChar1<cr>', { silent = true })
end

table.insert(lvim.plugins, plugin)
