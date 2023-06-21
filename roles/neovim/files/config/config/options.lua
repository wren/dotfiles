-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- folding
function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = string.format("%s lines", vim.v.foldend - vim.v.foldstart + 1)
  local divider = string.rep(" ", fn.winwidth(0) - #line - #line_count - 2)
  return string.format("%s%s %s", line, divider, line_count)
end

opt.foldenable = false
opt.foldlevelstart = 99
opt.foldtext = "v:lua.custom_fold_text()"

opt.listchars:append({
  nbsp = "␠",
  extends = "→",
  precedes = "←",
  tab = "├─",
  trail = "·",
})
