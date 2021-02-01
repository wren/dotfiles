
----- Helpers -----
api, cmd, fn, g, set = vim.api, vim.cmd, vim.fn, vim.g, vim.o

-- from: https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua --
function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function is_dir(path)
  return os.execute('[[ -d "' .. path .. '" ]]') == 0
end

function is_empty(s)
  return s == nil or s == ''
end

-- from: https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      -- if type(def) == 'table' and type(def[#def]) == 'function' then
      -- 	def[#def] = lua_callback(def[#def])
      -- end
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

function nvim_create_augroup(group_name, definitions)
  api.nvim_command('augroup '..group_name)
  api.nvim_command('autocmd!')
  for _, def in ipairs(definitions) do
    -- if type(def) == 'table' and type(def[#def]) == 'function' then
    -- 	def[#def] = lua_callback(def[#def])
    -- end
    local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
    api.nvim_command(command)
  end
  api.nvim_command('augroup END')
end


function nvim_define_filetypes(definitions)
  api.nvim_command('augroup filetypedetect')
  for _, def in ipairs(definitions) do
    -- autocmd BufNewFile,BufRead *.jrnl setfiletype jrnl
    local command = table.concat(vim.tbl_flatten{'autocmd BufNewFile,BufRead', def[0], 'setfiletype', def[1]}, ' ')
    api.nvim_command(command)
  end
  api.nvim_command('augroup END')
end

function cd_if_open_directory()
  local full_path = vim.call('expand', '%:p')
  if is_dir(full_path) then
    cmd('tcd ' .. full_path)
  end
end

-- Allows us to use vim's escape codes with much less verbosity
local function t(str)
    -- Example: t'<tab>' or t'<cr>'
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
