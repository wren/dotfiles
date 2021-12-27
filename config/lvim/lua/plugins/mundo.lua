-- Visualized and gives better navigation for the undo tree
local plugin = { 'simnalamburt/vim-mundo' }
plugin.cmd = {
  'MundoHide',
  'MundoShow',
  'MundoToggle',
}

g.mundo_inline_undo = '1'
plugin.config = function()
  map('n', '<leader>hu', '<cmd>MundoToggle<cr>', { silent = true })
end

table.insert(lvim.plugins, plugin)

-- Keymap --
