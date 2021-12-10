----- Helpers -----
opt, api, cmd, fn, g, call, lsp = vim.opt, vim.api, vim.cmd, vim.fn, vim.g, vim.call, vim.lsp

-- from: https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua
function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  if options.buffer then
    api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
  else
    api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

function is_empty(s)
  return s == nil or s == ''
end

function nvim_create_augroup(group_name, definitions)
  cmd('augroup '..group_name)
  cmd('autocmd!')
  for _, def in ipairs(definitions) do
    local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
    cmd(command)
  end
  cmd('augroup END')
end

-- from: https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    nvim_create_augroup(group_name, definition)
  end
end

function nvim_define_filetypes(definitions)
  cmd('augroup filetypedetect')
  for _, def in ipairs(definitions) do
    -- Example: autocmd BufNewFile,BufRead *.jrnl setfiletype jrnl
    local command = table.concat(vim.tbl_flatten{'autocmd BufNewFile,BufRead', def[1], 'setfiletype', def[2]}, ' ')
    cmd(command)
  end
  cmd('augroup END')
end

-- Allows us to use vim's escape codes with much less verbosity
-- Example: t'<tab>' or t'<cr>'
function t(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

function dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end
