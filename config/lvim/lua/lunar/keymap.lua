-- Key mappings --
lvim.leader = "space"

-- Overrides for lunar --
lvim.keys.normal_mode = {
  -- Navigation shortcuts
  ['<C-,>'] = ':BufferPrevious<cr>',
  ['<C-.>'] = ':BufferNext<cr>',
  ['<C-P>'] = ':Telescope find_files<CR>',
  ['<M-C-P>'] = ':Telescope buffers<CR>',

  -- shortcuts for start/end of line
  ['<S-h>'] = '^',
  ['<S-l>'] = '$',
}

-- lvim.keys.command_mode = {
--   ['<down>'] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
--   ['<up>'] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
-- }

lvim.keys.insert_mode = {
  ['jk'] = false,
  ['kj'] = false,
  ['jj'] = false,
  ['<A-h>'] = false,
  ['<A-j>'] = false,
  ['<A-k>'] = false,
  ['<A-l>'] = false,
}

lvim.keys.visual_mode = {
  -- Navigation shortcuts
  ['<C-,>'] = ':BufferPrevious<cr>',
  ['<C-.>'] = ':BufferNext<cr>',
  ['<C-P>'] = ':Telescope find_files<CR>',
  ['<M-C-P>'] = ':Telescope buffers<CR>',

  -- shortcuts for start/end of line
  ['<S-h>'] = '^',
  ['<S-l>'] = '$',
}

-- Which key --
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = {':Telescope buffers<CR>', 'Buffers'},
  t = {':Telescope filetypes<CR>', 'Filetype'},
  p = {':Telescope find_files<CR>', 'Files in Project'},
  f = {':Telescope live_grep<CR>', 'Find'},
  m = {':Telescope keymaps<CR>', 'Key mappings'},
  k = {':Telescope help_tags<CR>', 'Help'},
  c = {':Telescope commands<CR>', 'Commands'},
  s = {':Telescope colorscheme<CR>', 'Color schemes'},
  w = {':Telescope grep_string<CR>', 'Find <word>'},
}

lvim.builtin.which_key.mappings["h"] = {
  name = "History",
  c = {':Telescope cocmmand_history<CR>'},
  s = {':Telescope search_history<CR>'},
  f = {':Telescope oldfiles<CR>'},
}

-- command line alias
map('c', 'w!!', 'w !sudo tee % >/dev/null')
-- map('c', '<esc>', '<c-c><c-c>', {modifiable_only = true})

-- Insert newlines without leaving normal mode
map('n', '<cr>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', {modifiable_only = true})
map('n', '<s-cr>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', {modifiable_only = true})

-- Navigation in command mode
map('c', '<down>', 'pumvisible() ? "\\<C-n>" : "\\<down>"', { expr = true, noremap = true })
map('c', '<up>', 'pumvisible() ? "\\<C-p>" : "\\<up>"', { expr = true, noremap = true })

-- Comment/uncomment a line
map('n', '<A-/>', 'gcc', {noremap = false})
map('v', '<A-/>', 'gc', {noremap = false})
map('i', '<A-/>', '<esc>gcca', {noremap = false})

-- Indent/deindent lines, then reselect
map('v', '<tab>', '>gv')
map('v', '<s-tab>', '<gv')
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Yank, then reselect
map('v', 'y', 'ygv')

-- Write buffer (save)
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', '<c-w>c')
map('n', '<leader>Q', ':qa<CR>')

-- Oldies but goodies
map('n', '<c-s>', ':w<CR>')
map('i', '<C-s>', '<esc>:w<CR>a', {noremap = false})
map('i', '<C-q>', '<esc>:wq<CR>', {noremap = false})

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
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>te', ':tabedit ')
map('n', '<leader>tc', ':tabclose<cr>')
map('n', '<leader>td', ':tcd %:p:h<cr>')
map('n', '[t', ':tabprevious<CR>')
map('n', ']t', ':tabnext<CR>')

--yank to end
map('n', 'Y', 'y$')

-- splitting windows (these match the tmux shortcuts)
map('n', '<leader>\\', ':vsplit<CR>', { noremap = false })
map('n', '<leader>-', ':split<CR>', { noremap = false })

-- Escape from terminal windows even if suspended
map('t', '<C-c>', '<C-\\><C-n>:q!<CR>')

-- Remove spaces at the end of lines
map('n', '<localleader><Space>', [[:<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>]], {silent = true})

-- Get syntax info at cursor
map('n', '<Leader>cs', '<cmd>lua highlight_group()<CR>')

-- Disable some keymappings that don't do anything useful, and get in the way
-- map('n', 'q:', '')
map('n', 'q:', 'q:i', {noremap = true})
-- map('n', 'q/', '')
-- map('n', 'q?', '')
map('n', 'Q', '')

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  -- set keymap for bindings that don't work on unmodifiable buffers (e.g. help)
  {
    'BufReadPost,BufModifiedSet',
    '*',
    'lua if opt.modifiable:get() then map_buffer_group(_G.MODIFIABLE_ONLY_BINDINGS) end'
  },

  -- get out of command mode by pressing <esc> in normal mode
  {'CmdwinEnter', '*', 'map <buffer> <esc> <c-c><c-c>'},
}
