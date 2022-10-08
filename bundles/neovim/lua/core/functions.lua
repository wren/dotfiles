
-- Misc functions (like maybe for autocommands or whatever)
function _G.cd_if_open_directory()
  local full_path = fn.expand('%:p')
  if fn.isdirectory(full_path) == 1 then
    cmd(string.format('cd %s', fn.fnameescape(full_path)))
  end
end

-- delete an unnamed, unmodified, empty buffer (including directory buffers)
function _G.delete_unused_buffer()
  if (fn.bufname() == "" and opt.buftype:get() == "")
    and not opt.modified:get()
    and fn.line('$') == 1
    and fn.getline(1) == ''
  then
    local my_bufnr = fn.bufnr()
    -- this needs to have a slight delay or we'll get
    -- an error about the buffer still being in use
    vim.defer_fn(function()
      if api.nvim_buf_is_loaded(my_bufnr) then
        cmd(string.format('bdelete %s', my_bufnr))
      end
    end, 10)
  end
end

-- show some useful info about highlight groups (for debugging color schemes)
function _G.highlight_group()
  local ids = fn.synstack(fn.line('.'), fn.col('.'))
  local result = 'no group found'
  for i, id in ipairs(ids) do
    local current = fn.synIDattr(id, 'name')
    local linked = fn.synIDattr(fn.synIDtrans(id), 'name')
    local icon = ''
    if i == #ids then
      icon = ''
    end
    result = string.format('%s %s', icon, current)
    if current ~= linked then
      result = string.format('%s  %s', result, linked)
    end
  end
  print(result)
end

function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = string.format("%s lines", vim.v.foldend - vim.v.foldstart + 1)
  local divider = string.rep(' ', fn.winwidth(0) - #line - #line_count - 2)
  return string.format("%s%s %s", line, divider, line_count)
end

function _G.nav_wezterm_split(key)
  -- get pane info
  local current = fn.winnr()
  local next = fn.winnr(key)

  if current ~= next then
    -- keep in nvim
    cmd('wincmd '..key)
  else
    -- forward to wezterm
    local key_directions = {
      h = 'left',
      j = 'down',
      k = 'up',
      l = 'right',
    }
    local cmd = "wezterm cli activate-pane-direction " .. key_directions[key]
    local handle = io.popen(cmd)
    if handle then
      handle:close()
    end
  end
end
