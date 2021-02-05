-- @todo This one needs a lot of work to migrate to lua (worth it, but will do later)
cmd(string.format('source %s/legacy/fzf.vim', fn.stdpath('config')))

-- Keymap --
silent = { silent = true }

map('n', '<leader>fb', ':Buffers<CR>', silent)
map('n', '<leader>ft', ':Filetypes<CR>', silent)
map('n', '<M-C-p>', ':Buffers<CR>', silent)
map('n', '<C-p>', ':call Fzf_dev()<CR>', silent)
map('n', '<leader>fp', ':call Fzf_dev()<CR>')
map('n', '<leader>ff', ':Find<Space>')
map('n', '<leader>fm', ':Maps<CR>')
map('n', '<leader>fc', ':Commands<CR>')
map('n', '<leader>fhf', ':History<CR>')
map('n', '<leader>fhc', ':History:<CR>')
map('n', '<leader>fhs', ':History/<CR>')
map('n', '<leader>fs', ':Colors<CR>', silent)
map('n',  '<leader>fw', ':Find <C-R><C-W><CR>', silent)
map('n',  'z=', ':call FzfSpell()<CR>', silent)
