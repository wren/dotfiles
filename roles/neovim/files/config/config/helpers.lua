----- Helpers -----

-- global vars for ease of use
_G.opt = vim.opt
_G.api = vim.api
_G.cmd = vim.cmd
_G.fn = vim.fn
_G.g = vim.g
_G.call = vim.call
_G.lsp = vim.lsp
_G.set = api.nvim_set_option_value
_G.get = api.nvim_get_option_value
_G.map = vim.keymap.set
_G.unmap = vim.keymap.del
_G.create_autocmd = api.nvim_create_autocmd

-- folding
function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = string.format("%s lines", vim.v.foldend - vim.v.foldstart + 1)
  local divider = string.rep(" ", fn.winwidth(0) - #line - #line_count - 2)
  return string.format("%s%s %s", line, divider, line_count)
end

-- For mapping alternate keycodes when pop-up menu is visible
function _G.pumvisible_keycodes(key1, key2)
  return function()
    return vim.fn.pumvisible() == 1 and key1 or key2
  end
end

-- for navigating split windows (integration with wezterm)
function _G.nav_wezterm_split(key)
  -- get pane info
  local current = fn.winnr()
  local next = fn.winnr(key)

  if current ~= next then
    -- keep in nvim
    cmd("wincmd " .. key)
  else
    -- forward to wezterm
    local key_directions = {
      h = "Left",
      j = "Down",
      k = "Up",
      l = "Right",
    }
    local cmd = "wezterm cli activate-pane-direction " .. key_directions[key]
    local handle = io.popen(cmd)
    if handle then
      handle:close()
    end
  end
end

function _G.wezterm_split_by_key(key)
  return function()
    nav_wezterm_split(key)
  end
end
