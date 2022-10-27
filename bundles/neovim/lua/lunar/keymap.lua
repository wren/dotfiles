-- Key mappings not specific to a plugin --
lvim.leader = "space"

merge(lvim.keys.visual_mode, {
  -- Navigation shortcuts
  ['<C-,>'] = ':BufferPrevious<cr>',
  ['<C-.>'] = ':BufferNext<cr>',

  -- shortcuts for start/end of line
  ['<S-h>'] = false,
  ['<S-l>'] = false,
})

-- Write buffer (save)
lvim.builtin.which_key.mappings["q"] = { "<c-w>c", "Quit window" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>qa<cr>", "Quit all" }

-- command line alias
map('c', 'w!!', 'w !sudo tee % >/dev/null')

map({'n', 'v', 'o'}, 'H', '^')

map('n', 'L', '$')
map('v', 'L', '$')
map('o', 'L', '$')

-- Insert newlines without leaving normal mode
map('n', '<cr>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', {modifiable_only = true})
map('n', '<s-cr>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', {modifiable_only = true})

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
map('v', '<tab>', '>gv')
map('v', '<s-tab>', '<gv')
map('v', '>', '>gv')
map('v', '<', '<gv')


-- Yank, then reselect
map('v', 'y', 'ygv')

-- Oldies but goodies
map('n', '<c-s>', ':w<CR>')
map('i', '<C-s>', '<esc>:w<CR>a', {remap = true})
map('i', '<C-q>', '<esc>:wq<CR>', {remap = true})

-- Clear search highlights
map('n', '<c-l>', ':nohlsearch<CR>', {silent = true})

-- make delete make sense
map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('x', 'd', '"_d')
map('x', 'D', '"_D')
map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('x', 'c', '"_c')
map('x', 'C', '"_C')
map('v', 'p', '"_dp')
map('v', 'P', '"_dP')

-- smart move
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('v', 'j', 'gj')
map('v', 'k', 'gk')

-- redo
map('n', 'U', '<c-r>')

--tab operation
which_key_register_if_loaded({
  name = 'Tab',
  ['<leader>tn'] = {':tabnew<cr>', 'New tab'},
  ['<leader>te'] = {':tabedit ', 'Edit in new tab'},
  ['<leader>tc'] = {':tabclose<cr>', 'Close tab'},
  ['<leader>td'] = {':tcd %:p:h<cr>', 'Change Dir in Tab'},
})

map('n', '[t', ':silent tabprevious<CR>')
map('n', ']t', ':silent tabnext<CR>')

--yank to end
map('n', 'Y', 'y$')

-- splitting windows (these match the tmux shortcuts)
which_key_register_if_loaded({
  ['<leader>\\'] = { ':vsplit<CR>', 'Split vertical' },
  ['<leader>-'] = { ':split<CR>', 'Split horizontal' },
}, { remap = true })

-- navigating split windows
local opts = {silent = true}
map('n', '<C-A-h>', wezterm_split_by_key('h'), opts)
map('n', '<C-A-j>', wezterm_split_by_key("j"), opts)
map('n', '<C-A-k>', wezterm_split_by_key("k"), opts)
map('n', '<C-A-l>', wezterm_split_by_key("l"), opts)

-- Escape from terminal windows even if suspended
map('t', '<C-c>', '<C-\\><C-n>:q!<CR>')

-- Get syntax info at cursor
which_key_register_if_loaded({
  ['<localleader>h'] = { highlight_group, 'Show highlight group' },
})

-- Quit all with ZZ
map('n', 'ZZ', '<cmd>w<cr><cmd>qa<cr>')
