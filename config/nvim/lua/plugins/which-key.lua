
-- @todo migrate this to lua
cmd(string.format('source %s/legacy/whichkey.vim', fn.stdpath('config')))

-- Keymap --
opts = { silent = true }
map('n', '<leader>',      [[:<c-u>WhichKey '<Space>'<cr>]], opts)
map('n', '<localleader>', [[:<c-u>WhichKey  ';'<cr>]], opts)
map('n', '[',             [[:<c-u>WhichKey  '['<cr>]], opts)
map('n', ']',             [[:<c-u>WhichKey  ']'<cr>]], opts)
