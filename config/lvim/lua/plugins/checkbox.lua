-- Toggle markdown checkboxes
local plugin = { 'jkramer/vim-checkbox' }

plugin.ft = { 'jrnl', 'markdown' }
plugin.config = function()
  -- Keymap --
  map('n', '<localleader>t', '<cmd>call checkbox#ToggleCB()<cr>', { silent = true })
end

table.insert(lvim.plugins, plugin)


