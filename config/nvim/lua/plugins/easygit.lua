-- Keymap --
opts = { silent = true }
map('n', '<Leader>gd', '<cmd>Gdiff<cr>', opts)
map('n', '<Leader>gc', '<cmd>Gcommit<cr>', opts)
map('n', '<Leader>gb', '<cmd>Gblame<cr>', opts)
map('n', '<Leader>gB', '<cmd>Gbrowse<cr>', opts)
map('n', '<Leader>gS', '<cmd>Gstatus<cr>', opts)
-- map('n', '<localleader>gp', '<cmd>Gpush<cr>', opts)
