-- Key mappings not specific to a plugin --
g.mapleader = ' '
g.maplocalleader = '\\'

-- save file
map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
map({ 'n', 'x' }, '<leader>w', ':w<cr>', { desc = 'Save file' })
map({ 'n', 'x' }, '<leader>W', ':w!<cr>', { desc = 'Save file (force)' })
map('n', '<leader>q', '<c-w>c', { desc = 'Close window' })
map('n', '<leader>Q', ':qa<cr>', { desc = 'Quit all' })

map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Go to start of line' })
map({ 'n', 'v', 'o' }, 'L', '$', { desc = 'Go to end of line' })

-- Insert newlines without leaving normal mode
map('n', '<cr>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', { modifiable_only = true })
map('n', '<s-cr>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', { modifiable_only = true })

-- Navigation in command mode
local function pumvisible_keycodes(key1, key2)
  return function() return fn.pumvisible() == 1 and key1 or key2 end
end

map('c', '<down>', pumvisible_keycodes('<c-n>', '<down>'), { expr = true })
map('c', '<up>', pumvisible_keycodes('<c-p>', '<up>'), { expr = true })

-- Comment/uncomment a line
map('n', '<A-/>', 'gcc', { remap = true })
map('v', '<A-/>', 'gc', { remap = true })
map('i', '<A-/>', '<esc>gcca', { remap = true })

-- Indent/deindent lines, then reselect
map('v', '>', '>gv', { desc = '' })
map('v', '<', '<gv', { desc = '' })

-- Yank, then reselect
map('v', 'y', 'ygv', { desc = 'Yank' })

-- Clear search highlights
-- https://github.com/mhinz/vim-galore#saner-ctrl-l
map(
  'n',
  '<c-l>' ,
  ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>',
  {
    silent = true,
    remap = false,
    desc = 'Redraw / clear hlsearch / diff update',
  }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- make delete make sense
map({'n', 'x'}, 'd', '"_d', { desc = 'Delete' })
map({'n', 'x'}, 'D', '"_D', { desc = 'Delete' })
map({'n', 'x'}, 'c', '"_c', { desc = 'Delete' })
map({'n', 'x'}, 'C', '"_C', { desc = 'Delete' })
map('v', 'p', '"_dp', { desc = 'Paste (after)' })
map('v', 'P', '"_dP', { desc = 'Paste (before)' })

-- smart move
map({'n', 'v'}, 'j', 'gj', { desc = 'Move down line' })
map({'n', 'v'}, 'k', 'gk', { desc = 'Move up line' })

-- redo
map('n', 'U', '<c-r>', { desc = 'Redo' })

--tab operation
map({'n', 'v'}, '<c-,>', ':bprevious<CR>', { desc = 'Previous buffer' })
map({'n', 'v'}, '<c-.>', ':bnext<CR>', { desc = 'Next buffer' })
map({'n', 'v'}, '<a-,>', ':silent! tabprevious<cr>', { desc = 'Previous buffer' })
map({'n', 'v'}, '<a-.>', ':silent! tabnext<cr>', { desc = 'Next buffer' })

--yank to end
map('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- splitting windows (these match the tmux shortcuts)
map({'n', 'x'}, '<leader>\\', ':vsplit<CR>', { desc = 'Split window (vertical)' })
map({'n', 'x'}, '<leader>-', ':split<CR>', { desc = 'Split window (horizontal)' })

-- navigating split windows
local opts = { silent = true }
map('n', '<C-A-h>', wezterm_split_by_key('h'), opts)
map('n', '<C-A-j>', wezterm_split_by_key('j'), opts)
map('n', '<C-A-k>', wezterm_split_by_key('k'), opts)
map('n', '<C-A-l>', wezterm_split_by_key('l'), opts)

-- Escape from terminal windows even if suspended
map('t', '<C-c>', '<C-\\><C-n>:q!<CR>')

-- Write and quit all with ZZ
map('n', 'ZZ', '<cmd>w<cr><cmd>qa<cr>', { desc = 'Write and quite all' })
