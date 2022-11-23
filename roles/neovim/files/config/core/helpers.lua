----- Helpers -----
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


-- from: https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua
_G.MODIFIABLE_ONLY_BINDINGS = {}
function _G.map(mode, lhs, rhs, opts)
  local options = { remap = false }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  if options.modifiable_only then
    options['modifiable_only'] = nil
    local keymap = {
      mode = mode,
      lhs = lhs,
      rhs = rhs,
      opts = options,
    }
    table.insert(_G.MODIFIABLE_ONLY_BINDINGS, keymap)
  else
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

function _G.map_buffer_group(bindings)
  for _, b in ipairs(bindings) do
    b.opts["buffer"] = true
    map(b.mode, b.lhs, b.rhs, b.opts)
  end
end

function _G.is_empty(s)
  return s == nil or s == ''
end

function _G.nvim_create_augroup(group_name, definitions)
  cmd('augroup '..group_name)
  cmd('autocmd!')
  for _, def in ipairs(definitions) do
    local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
    cmd(command)
  end
  cmd('augroup END')
end

-- from: https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function _G.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    nvim_create_augroup(group_name, definition)
  end
end

function _G.nvim_define_filetypes(definitions)
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
function _G.t(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

-- Helper function for other plugins to register which-key maps,
-- but fails gracefully if which-key is not loaded
function _G.which_key_register_if_loaded(maps, opts)
  local my_opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  if not opts then opts = {} end
  merge(my_opts, opts)
  local ok, wk = pcall(require, 'which-key')
  if(ok) then wk.register(maps, my_opts) end
end

function _G.merge(dst, src, start, finish)
  if not start then start = 1 end
  if not finish then finish = #src end
  return vim.list_extend(dst, src, start, finish)
end
