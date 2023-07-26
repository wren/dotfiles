-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Insert newlines without leaving normal mode
-- map("n", "<cr>", modifiable_only("<cr>", "m`o<Esc>``"))
-- map("n", "<s-cr>", modifiable_only("<s-cr>", "m`O<Esc>``"))
map("n", "<cr>", "m`o<Esc>``")
map("n", "<s-cr>", "m`O<Esc>``")

-- Comment/uncomment a line
map("n", "<a-/>", "gcc", { remap = true })
map("v", "<a-/>", "gc", { remap = true })
map("i", "<a-/>", "<esc>gcca", { remap = true })

-- Clear search highlights
-- https://github.com/mhinz/vim-galore#saner-ctrl-l
map("n", "<c-l>", ":nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>", {
  silent = true,
  remap = false,
  desc = "Clear & redraw screen",
})

--tab operation
map({ "n", "v" }, "<c-,>", "<cmd>silent! bprevious<CR>", { desc = "Previous buffer" })
map({ "n", "v" }, "<c-.>", "<cmd>silent! bnext<CR>", { desc = "Next buffer" })
map({ "n", "v" }, "<a-,>", "<cmd>silent! tabprevious<cr>", { desc = "Previous buffer" })
map({ "n", "v" }, "<a-.>", "<cmd>silent! tabnext<cr>", { desc = "Next buffer" })

-- save file
map({ "i", "v", "n", "s" }, "<c-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- map({ "n", "x" }, "<leader>w", "<cmd>silent! w<cr>", { desc = "Save file" })
-- map({ "n", "x" }, "<leader>W", "<cmd>silent! w!<cr>", { desc = "Save file (force)" })
map("n", "<leader>q", "<c-w>c", { desc = "Close window" })
map("n", "<leader>Q", ":qa<cr>", { desc = "Quit all" })

-- make delete make sense
map({ "n", "x" }, "d", '"_d', { desc = "Delete" })
map({ "n", "x" }, "D", '"_D', { desc = "Delete" })
map({ "n", "x" }, "C", '"_C', { desc = "Delete" })
map("v", "p", '"_dp', { desc = "Paste (after)" })
map("v", "P", '"_dP', { desc = "Paste (before)" })

-- redo
map("n", "U", "<c-r>", { desc = "Redo" })

-- Write and quit all with ZZ
map("n", "ZZ", "<cmd>w<cr><cmd>qa<cr>", { desc = "Write and quit all" })

-- navigation
map({ "n", "v", "o" }, "H", "^", { desc = "Go to start of line" })
map({ "n", "v", "o" }, "L", "$", { desc = "Go to end of line" })

-- splitting windows
map({ "n", "x" }, "<leader>-", "<c-w>s", { desc = "Split window (horizontal)" })
map({ "n", "x" }, "<leader>\\", "<c-w>v", { desc = "Split window (vertical)" })
map({ "n", "x" }, "<leader>w-", "<c-w>s", { desc = "Split window below", remap = true })
map({ "n", "x" }, "<leader>w\\", "<c-w>v", { desc = "Split window right", remap = true })

-- Navigation in command mode
local function pumvisible_keycodes(key1, key2)
  return function()
    return vim.fn.pumvisible() == 1 and key1 or key2
  end
end

map("c", "<down>", pumvisible_keycodes("<c-n>", "<down>"), { expr = true })
map("c", "<up>", pumvisible_keycodes("<c-p>", "<up>"), { expr = true })
map("c", "<cr>", pumvisible_keycodes("<c-y>", "<cr>"), { expr = true })
map("c", "<esc>", pumvisible_keycodes("<c-e>", "<esc>"), { expr = true })

-- Get rid of some defaults that I don't like
unmap("n", "<leader>|")
unmap("n", "<leader>w|")
unmap("n", "<leader><tab>l")
unmap("n", "<leader><tab>f")
unmap("n", "<leader><tab><tab>")
unmap("n", "<leader><tab>]")
unmap("n", "<leader><tab>d")
unmap("n", "<leader><tab>[")
unmap({ "n", "i", "v" }, "<a-j>")
unmap({ "n", "i", "v" }, "<a-k>")
