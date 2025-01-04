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

map("n", "<c-l>", function()
  cmd("nohlsearch")
  cmd("diffupdate")
  cmd("syntax sync fromstart")
  Snacks.notifier.hide()
end, {
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
map({ "n", "x" }, "<leader>w-", "<c-w>s", { desc = "Split window below", remap = true })
map({ "n", "x" }, "<leader>w\\", "<c-w>v", { desc = "Split window right", remap = true })

-- Move to window using the hjkl keys
map("n", "<C-A-h>", wezterm_split_by_key("h"), { desc = "Go to Left Window", remap = true, silent = true })
map("n", "<C-A-j>", wezterm_split_by_key("j"), { desc = "Go to Lower Window", remap = true, silent = true })
map("n", "<C-A-k>", wezterm_split_by_key("k"), { desc = "Go to Upper Window", remap = true, silent = true })
map("n", "<C-A-l>", wezterm_split_by_key("l"), { desc = "Go to Right Window", remap = true, silent = true })

-- Navigation in command mode
map("c", "<down>", _G.pumvisible_keycodes("<c-n>", "<down>"), { expr = true })
map("c", "<up>", _G.pumvisible_keycodes("<c-p>", "<up>"), { expr = true })
map("c", "<cr>", _G.pumvisible_keycodes("<c-y>", "<cr>"), { expr = true })
map("c", "<esc>", _G.pumvisible_keycodes("<c-e>", "<esc>"), { expr = true })

-- Get rid of some defaults that I don't use and have conflicts
unmap("n", "<leader>|") -- already have it mapped to <leader>\ (don't have to press shift)
