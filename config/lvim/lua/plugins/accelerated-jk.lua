-- Speeds up if you hold j or k to scroll
local plugin = { 'rhysd/accelerated-jk' }

plugin.keys = { 'j', 'k' }
plugin.config = function()
  -- Keymap --
  local opts = { silent = true, noremap = false }
  map('n', 'j', '<Plug>(accelerated_jk_gj)', opts)
  map('n', 'k', '<Plug>(accelerated_jk_gk)', opts)
end

table.insert(lvim.plugins, plugin)
