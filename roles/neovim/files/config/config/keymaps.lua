-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Insert newlines without leaving normal mode
-- map("n", "<cr>", modifiable_only("<cr>", "m`o<Esc>``"))
-- map("n", "<s-cr>", modifiable_only("<s-cr>", "m`O<Esc>``"))
map("n", "<cr>", "m`o<Esc>``")
map("n", "<s-cr>", "m`O<Esc>``")

-- Comment/uncomment a line
map("n", "<A-/>", "gcc", { remap = true })
map("v", "<A-/>", "gc", { remap = true })
map("i", "<A-/>", "<esc>gcca", { remap = true })

--tab operation
map({ "n", "v" }, "<c-,>", "<cmd>silent! bprevious<CR>", { desc = "Previous buffer" })
map({ "n", "v" }, "<c-.>", "<cmd>silent! bnext<CR>", { desc = "Next buffer" })
map({ "n", "v" }, "<a-,>", "<cmd>silent! tabprevious<cr>", { desc = "Previous buffer" })
map({ "n", "v" }, "<a-.>", "<cmd>silent! tabnext<cr>", { desc = "Next buffer" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
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

-- Write and quit all with ZZ
map("n", "ZZ", "<cmd>w<cr><cmd>qa<cr>", { desc = "Write and quit all" })

-- navigation
map({ "n", "v", "o" }, "H", "^", { desc = "Go to start of line" })
map({ "n", "v", "o" }, "L", "$", { desc = "Go to end of line" })
