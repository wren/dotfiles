-- emacs-like emacs
map('n', '<C-w>', '<esc>diwa')
map('i', '<C-h>', '<BS>')
map('i', '<C-d>', '<Del>')
map('i', '<C-k>', '<ESC>d$a')
map('i', '<C-u>', '<C-G>u<C-U>')
map('i', '<C-b>', '<Left>')
map('i', '<C-f>', '<Right>')
map('i', '<C-a>', '<Home>')

-- command line alias
map('c', 'w!!', 'w !sudo tee % >/dev/null')
map('c', '<C-p>', '<Up>')
map('c', '<C-b>', '<Left>')
map('c', '<C-f>', '<Right>')
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')
map('c', '<C-d>', '<Del>')
map('c', '<C-h>', '<BS>')
map('c', '<C-t>', '<C-R>=expand("%:p:h") . "/" <CR>')

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
map('n', '<leader>Q', ':BufferClose<CR>')
map('n', 'QQ', ':qa<CR>')

map('i', '<C-S>', '<esc>:w<CR>a', {noremap = false})
map('i', '<C-Q>', '<esc>:wq<CR>', {noremap = false})
map('n', '<C-x><C-x>', ':Bdelete!<CR>')

-- make delete management delete management
map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('x', 'd', '"_d')
map('x', 'D', '"_D')
map('v', 'p', '"_dp')
map('v', 'P', '"_dP')

--navigate window
map('n', '<m-L>', 'zL')
map('n', '<m-H>', 'zH')

--smart move
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('v', 'j', 'gj')
map('v', 'k', 'gk')
map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', '$')

--tabline operation
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>te', ':tabedit')
map('n', '<leader>tc', ':tabclose<cr>')
map('n', '<leader>td', ':tcd %:p:h<cr>')
map('n', '[t', ':tabprevious<CR>')
map('n', ']t', ':tabnext<CR>')

--yank to end
map('n', 'Y', 'y$')

-- settings for resize splitted window
map('n', '<leader>[', ':vertical resize -3<CR>', {noremap = false})
map('n', '<C-w>]', ':vertical resize +3<CR>', {noremap = false})

-- Escape from terminal windows even if suspended
map('t', '<C-c>', '<C-\\><C-n>:q!<CR>')

-- Remove spaces at the end of lines
map('n', '<localleader><Space>', [[:<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>]], {silent = true})

-- Improve scroll, credits: https://github.com/Shougo
-- n <expr> zz (winline() == (winheight(0)+1) / 2) ?
-- 	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
--  <expr> <C-f> max([winheight(0) - 2, 1])
-- 	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
--  <expr> <C-b> max([winheight(0) - 2, 1])
-- 	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
--  <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
--  <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

-- @todo translate to lua
-- cmd [[
-- map <LocalLeader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
-- \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
-- \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
-- ]]

-- Disable some keymappings that don't do anything useful, and get in the way
map('n', 'q:', '')
map('n', 'Q', '')
