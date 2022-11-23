-- Key mappings not specific to a plugin --
g.mapleader = " "
g.maplocalleader = "\\"

map({ 'n', 'x' }, "<leader>w", ":w<cr>")
map({ 'n', 'x' }, "<leader>W", ":w!<cr>")
map("n", "<leader>q", "<c-w>c")
map("n", "<leader>Q", ":qa<cr>")

map({ 'n', 'v', 'o' }, 'H', '^')
map({ 'n', 'v', 'o' }, 'L', '$')

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
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Yank, then reselect
map('v', 'y', 'ygv')

-- Clear search highlights
map('n', '<c-l>', ':nohlsearch<CR>', { silent = true })

-- make delete make sense
map({'n', 'x'}, 'd', '"_d')
map({'n', 'x'}, 'D', '"_D')
map({'n', 'x'}, 'c', '"_c')
map({'n', 'x'}, 'C', '"_C')
map('v', 'p', '"_dp')
map('v', 'P', '"_dP')

-- smart move
map({'n', 'v'}, 'j', 'gj')
map({'n', 'v'}, 'k', 'gk')

-- redo
map('n', 'U', '<c-r>')

--tab operation
map({'n', 'v'}, '<c-,>', ':bprevious<CR>')
map({'n', 'v'}, '<c-.>', ':bnext<CR>')
map({'n', 'v'}, '<a-,>', ':silent! tabprevious<cr>')
map({'n', 'v'}, '<a-.>', ':silent! tabnext<cr>')

--yank to end
map('n', 'Y', 'y$')

-- splitting windows (these match the tmux shortcuts)
map({'n', 'x'}, '<leader>\\', ':vsplit<CR>')
map({'n', 'x'}, '<leader>-', ':split<CR>')

-- navigating split windows
local opts = { silent = true }
map('n', '<C-A-h>', wezterm_split_by_key('h'), opts)
map('n', '<C-A-j>', wezterm_split_by_key("j"), opts)
map('n', '<C-A-k>', wezterm_split_by_key("k"), opts)
map('n', '<C-A-l>', wezterm_split_by_key("l"), opts)

-- Escape from terminal windows even if suspended
map('t', '<C-c>', '<C-\\><C-n>:q!<CR>')

-- Quit all with ZZ
map('n', 'ZZ', '<cmd>w<cr><cmd>qa<cr>')
