g.tmux_navigator_no_mappings = 1
-- Keymap --
opts = { silent = true }
map('n', '<M-h>', ':TmuxNavigateLeft<cr>', opts)
map('n', '<M-j>', ':TmuxNavigateDown<cr>', opts)
map('n', '<M-k>', ':TmuxNavigateUp<cr>', opts)
map('n', '<M-l>', ':TmuxNavigateRight<cr>', opts)
map('n', '<M-o>', ':TmuxNavigatePrevious<cr>', opts)
