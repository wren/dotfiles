
-- Misc functions (like maybe for autocommands or whatever)
function cd_if_open_directory()
  local full_path = fn.expand('%:p')
  if fn.isdirectory(full_path) == 1 then
    cmd(string.format('cd %s', fn.fnameescape(full_path)))
  end
end

-- delete an unnamed, unmodified, empty buffer (including directory buffers)
function delete_unused_buffer(my_bufnr)
  if (fn.bufname() == "" or vim.bo[0].buftype == "")
    and not vim.bo.modified
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
function highlight_group()
  ids = fn.synstack(fn.line('.'), fn.col('.'))
  for i, id in ipairs(ids) do
    current = fn.synIDattr(id, 'name')
    linked = fn.synIDattr(fn.synIDtrans(id), 'name')
    icon = ''
    if i == #ids then
      icon = ''
    end
    result = string.format('%s %s', icon, current)
    if current ~= linked then
      result = string.format('%s  %s', result, linked)
    end
    print(result)
  end
end
