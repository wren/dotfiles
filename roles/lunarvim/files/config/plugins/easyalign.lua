-- Aligns a bunch of stuff (like markdown tables)
local plugin = { 'junegunn/vim-easy-align' }

plugin.ft = {
  'markdown',
  'jrnl',
}
plugin.keys = {
  '<leader>ga',
}
plugin.config = function()
  -- Keymap --
  -- Start interactive EasyAlign in visual mode (e.g. vipga)
  map('x', 'ga', '<Plug>(EasyAlign)', { noremap = false })
  -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
  map('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })
end

table.insert(lvim.plugins, plugin)
