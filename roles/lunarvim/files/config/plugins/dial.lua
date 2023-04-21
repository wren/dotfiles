-- smarter increment/decrement
local plugin = { 'monaqa/dial.nvim' }

plugin.keys = {
  '<C-a>',
  '<C-x>',
}

plugin.config = function()
  -- Keymap --
  local d = require('dial.map')
  local opts = { noremap = true }
  map("n", "<C-a>", d.inc_normal(), opts)
  map("n", "<C-x>", d.dec_normal(), opts)
  map("v", "<C-a>", d.inc_visual(), opts)
  map("v", "<C-x>", d.dec_visual(), opts)
  map("v", "g<C-a>", d.inc_gvisual(), opts)
  map("v", "g<C-x>", d.dec_gvisual(), opts)
end

table.insert(lvim.plugins, plugin)
