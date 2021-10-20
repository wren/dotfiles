-- command line alias
map('c', 'w!!', 'w !sudo tee % >/dev/null')

-- Insert newlines without leaving normal mode
function keymap_modifiable_only()
  cmd 'nnoremap <buffer><cr> :set paste<CR>m`o<Esc>``:set nopaste<CR>'
  cmd 'nnoremap <buffer><s-cr> :set paste<CR>m`O<Esc>``:set nopaste<CR>'
end

-- Comment/uncomment a line
map('n', '<A-/>', 'gcc', {noremap = false})
map('v', '<A-/>', 'gcc', {noremap = false})
map('i', '<A-/>', '<esc>gcca', {noremap = false})

-- Indent/deindent lines, then reselect
map('v', '<tab>', '>gv')
map('v', '<s-tab>', '<gv')

-- Clear search highlights
map('n', '<c-l>', ':nohlsearch<CR>', {silent = true})
map('v', '<c-l>', ':nohlsearch<CR>', {silent = true})

-- Write buffer (save)
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', '<c-w>c')
map('n', 'QQ', ':qa<CR>')

map('n', '<c-s>', ':w<CR>')
map('i', '<C-s>', '<esc>:w<CR>a', {noremap = false})
map('i', '<C-q>', '<esc>:wq<CR>', {noremap = false})

-- make delete make sense
map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('x', 'd', '"_d')
map('x', 'D', '"_D')
map('v', 'p', '"_dp')
map('v', 'P', '"_dP')

-- smart move
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('v', 'j', 'gj')
map('v', 'k', 'gk')

-- shortcuts for start/end of line
map('n', 'H', '^')
map('v', 'H', '^')
map('o', 'H', '^')

map('n', 'L', '$')
map('v', 'L', '$')
map('o', 'L', '$')

-- redo
map('n', 'U', '<c-r>')

--tab operation
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>te', ':tabedit')
map('n', '<leader>tc', ':tabclose<cr>')
map('n', '<leader>td', ':tcd %:p:h<cr>')
map('n', '[t', ':tabprevious<CR>')
map('n', ']t', ':tabnext<CR>')

--yank to end
map('n', 'Y', 'y$')

-- settings for resize splitted window
map('n', '<leader>H', ':vertical resize -3<CR>', { noremap = false })
map('n', '<leader>L', ':vertical resize +3<CR>', { noremap = false })

-- splitting windows (these match the tmux shortcuts)
map('n', '<leader>\\', ':vsplit<CR>', { noremap = false })
map('n', '<leader>-', ':split<CR>', { noremap = false })

-- Escape from terminal windows even if suspended
map('t', '<C-c>', '<C-\\><C-n>:q!<CR>')

-- Remove spaces at the end of lines
map('n', '<localleader><Space>', [[:<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>]], {silent = true})

-- Get syntax info at cursor
map('n', '<LocalLeader>s', '<cmd>lua highlight_group()<CR>')

-- Disable some keymappings that don't do anything useful, and get in the way
map('n', 'q:', '')
map('n', 'q/', '')
map('n', 'q?', '')
map('n', 'Q', '')
