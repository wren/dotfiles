g.tmux_navigator_no_mappings = 1
-- Keymap --
opts = { silent = true }
map('n', '<a-h>', ':TmuxNavigateLeft<cr>', opts)
map('n', '<a-j>', ':TmuxNavigateDown<cr>', opts)
map('n', '<a-k>', ':TmuxNavigateUp<cr>', opts)
map('n', '<a-l>', ':TmuxNavigateRight<cr>', opts)
map('n', '<a-\\>', ':TmuxNavigatePrevious<cr>', opts)
