local plugin = lvim.builtin.nvimtree

plugin.setup.open_on_setup = true
plugin.setup.renderer.icons.show.git = false
plugin.setup.filters.custom = {
  "node_modules",
  "\\.cache",
  "__pycache__",
  ".pytest_cache",
  ".tox",
}

-- Keymap --
-- map('n', '<leader>eo', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>')
-- map('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>')
