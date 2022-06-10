local plugin = lvim.builtin.nvimtree

plugin.setup.renderer.icons.show.git = false

-- Keymap --
-- map('n', '<leader>eo', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>')
-- map('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>')
