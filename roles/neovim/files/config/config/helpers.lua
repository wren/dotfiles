----- Helpers -----

-- global vars for ease of use
_G.opt = vim.opt
_G.api = vim.api
_G.cmd = vim.cmd
_G.fn = vim.fn
_G.g = vim.g
_G.call = vim.call
_G.lsp = vim.lsp
_G.set = api.nvim_set_option
_G.get = api.nvim_get_option
_G.unmap = vim.keymap.del
_G.create_autocmd = api.nvim_create_autocmd

-- folding
function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = string.format("%s lines", vim.v.foldend - vim.v.foldstart + 1)
  local divider = string.rep(" ", fn.winwidth(0) - #line - #line_count - 2)
  return string.format("%s%s %s", line, divider, line_count)
end
