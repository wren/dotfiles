----- Helpers -----
api, cmd, fn, g, call = vim.api, vim.cmd, vim.fn, vim.g, vim.call

-- from: https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua
function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  if options.buffer then
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

function is_empty(s)
  return s == nil or s == ''
end

-- from: https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    cmd('augroup '..group_name)
    cmd('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      cmd(command)
    end
    cmd('augroup END')
  end
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
function t(str)
    -- Example: t'<tab>' or t'<cr>'
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end


-- from: https://www.reddit.com/r/neovim/comments/l6a8z8/is_it_just_me_or_some_options_dont_work_in_lua_yet/
-- @todo: Remove when https://github.com/neovim/neovim/pull/13479 lands
local opts_info = vim.api.nvim_get_all_options_info()
set = setmetatable({}, {
  __index = vim.o,
  __newindex = function(_, key, value)
    vim.o[key] = value
    if opts_info[key] == nil then
      print(string.format('set.%s is not a valid option.', key))
      return
    end
    local scope = opts_info[key]['scope']
    if scope == "win" then
      vim.wo[key] = value
    elseif scope == "buf" then
      vim.bo[key] = value
    end
  end,
})

