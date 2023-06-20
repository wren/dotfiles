-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local modifiable_only = function(cmd)
	return function()
		return cmd
	end
	-- return function()
	-- 	if vim.opt.modifiable:get() then
	-- 		print("cmd")
	-- 		return cmd
	-- 	else
	-- 		print("keys")
	-- 		return keys
	-- 	end
	-- end
end

-- Insert newlines without leaving normal mode
-- map("n", "<cr>", modifiable_only("<cr>", "m`o<Esc>``"))
-- map("n", "<s-cr>", modifiable_only("<s-cr>", "m`O<Esc>``"))
-- map("n", "<cr>", "m`o<Esc>``")
-- map("n", "<s-cr>", "m`O<Esc>``")
map("n", "<cr>", modifiable_only("m`o<Esc>``"))
map("n", "<s-cr>", modifiable_only("m`O<Esc>``"))

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
map({ "n", "x" }, "<leader>w", "<cmd>silent! w<cr>", { desc = "Save file" })
map({ "n", "x" }, "<leader>W", "<cmd>silent! w!<cr>", { desc = "Save file (force)" })
map("n", "<leader>q", "<c-w>c", { desc = "Close window" })
map("n", "<leader>Q", ":qa<cr>", { desc = "Quit all" })
