-- Eviline-ish config for lualine
-- Based on work by: glepnir and shadmansaleh
-- See: https://gist.github.com/hoob3rt/b200435a765ca18f09f83580a606b878

local lualine = require 'lualine'

-- @todo make this more generic
local colors = require('nightfox.colors').load()

local conditions = {
  buffer_is_modified = function()
    return vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')
  end,
  buffer_is_not_modified = function()
    return not vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')
  end,
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
  lsp_status = function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return false end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return true
      end
    end
    return false
  end,
}

-- Config
local config = {
  options = {
    theme = 'onedark',
    component_separators = '',
    -- component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  disabled_filetypes = {
    'help',
  },
  extensions = {
    'quickfix',
    'nvim-tree',
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local function ins_right_color(component)
  table.insert(config.sections.lualine_z, component)
end


-- filename with modified status display (color change, bold, pencil icon)
ins_left {
  function ()
    if vim.bo.filetype == 'help' then
      return 'HELP - ' .. fn.expand('%:t:r')
    end

    local is_modified = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')
    local pwd = vim.api.nvim_exec('pwd', true)
    local filename = fn.expand('%')
    local fg = colors.fg
    local bg = '#2e323c'
    local gui = 'NONE'

    filename = './' .. filename:gsub(pwd, '')
    if is_modified then
      fg = colors.yellow
      filename = filename .. ' '
      gui = 'bold'
    end

    cmd(string.format('hi LualineFilename guifg=%s guibg=%s gui=%s', fg, bg, gui))

    return filename
  end,
  color = 'LualineFilename'
}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan,
  color_hint = colors.magenta,
  sections = {'error', 'warn', 'info', 'hint'},
  symbols = {error = ' ', warn = ' ', info = ' ', hint = 'H'},
}

-- margin to make middle section
-- ins_left {function() return '%=' end}

ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = { fg = colors.orange }
}

ins_right {
  'diff',
  symbols = {added = ' ', modified = ' ', removed = ' '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width
}

ins_right {
  -- Lsp server name .
  function()
    if conditions.lsp_status() then
      return ''
    end
    return ''
  end,
  color = { fg = colors.white },
  -- don't know why this condition doesn't work, but the above does
  -- condition = conditions.lsp_status
}

-- Add components to right sections
ins_right {
  'bo:filetype',
  upper = true,
}

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  upper = true,
  condition = conditions.hide_in_width,
  color = { fg = colors.green }
}

-- display character code under cursor
-- @todo make this look nice, and maybe add unicode support
-- ins_right_color {
--   function()
--     local v = vim.api
--     local win = v.nvim_get_current_win()
--     local col = vim.api.nvim_win_get_cursor(win)[2]
--     local char = vim.api.nvim_get_current_line():sub(col+1,col+1)
--     return '['..(string.byte(char, 1, 2) or 'n/a')..']'
--   end,
-- }


ins_right_color { 'progress' }
ins_right_color { 'location' }

-- Now don't forget to initialize lualine
lualine.setup(config)
