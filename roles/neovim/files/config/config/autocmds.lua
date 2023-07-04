-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local create_autocmd = vim.api.nvim_create_autocmd

-- get out of command mode by pressing <esc> in normal mode
create_autocmd("CmdwinEnter", {
  pattern = "*",
  command = "map <buffer> <esc> <c-c><c-c>",
})
