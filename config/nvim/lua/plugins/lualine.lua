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


local plugins = {
  mode_inactive = {
    function() return 'INACTIVE' end,
    color = 'LualineFilenameInactive'
  },
  filename = {
    function ()
      if vim.bo.filetype == 'help' then
        return 'HELP - ' .. fn.expand('%:t:r')
      end

      local is_modified = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')
      local pwd = vim.api.nvim_exec('pwd', true)
      local filename = fn.expand('%')
      local fg = colors.fg
      local bg = colors.bg_statusline
      local gui = 'NONE'

      if not pwd == '' and not pwd == nil then
        print('pwd: ', pwd)
        filename = string.gsub(filename, pwd, './')
      end

      if is_modified then
        fg = colors.yellow
        filename = filename .. ' '
        gui = 'bold'
      end

      cmd(string.format('hi LualineFilename guifg=%s guibg=%s gui=%s', fg, bg, gui))

      return filename
    end,
    color = 'LualineFilename'
  },

  diagnostics = {
    'diagnostics',
    sources = {'nvim_lsp'},
    color_error = colors.red,
    color_warn = colors.yellow,
    color_info = colors.cyan,
    color_hint = colors.magenta,
    sections = {'error', 'warn', 'info', 'hint'},
    symbols = {error = ' ', warn = ' ', info = ' ', hint = 'H'},
  },

  branch = {
    'branch',
    icon = '',
    condition = conditions.check_git_workspace,
    color = { fg = colors.orange },
  },

  diff = {
    'diff',
    symbols = {added = ' ', modified = ' ', removed = ' '},
    color_added = colors.green,
    color_modified = colors.orange,
    color_removed = colors.red,
    condition = conditions.hide_in_width
  },

  lsp_server = {
    function()
      if conditions.lsp_status() then
        return ''
      end
      return ''
    end,
    color = { fg = colors.white },
    -- don't know why this condition doesn't work, but the above does
    -- condition = conditions.lsp_status
  },

  -- Add components to right sections
  filetype = {
    'bo:filetype',
    upper = true,
  },

  encoding = {
    'o:encoding', -- option component same as &encoding in viml
    upper = true,
    condition = conditions.hide_in_width,
    color = { fg = colors.green }
  },

}

-- Config
local config = {
  options = {
    theme = 'nightfox',
    component_separators = '',
    -- component_separators = {left = '', right = ''},
    -- section_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {
      'mode',
    },
    lualine_b = {},
    lualine_c = {
      plugins.filename,
    },
    lualine_x = {
      plugins.branch,
      plugins.diff,
      plugins.lsp_server,
      plugins.filetype,
      plugins.encoding,
    },
    lualine_y = {},
    lualine_z = {
      'progress',
      'location',
    },
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {
      plugins.mode_inactive
    },
    lualine_b = {},
    lualine_c = {
      plugins.filename,
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  disabled_filetypes = {
    'HELP',
  },
  extensions = {
    'quickfix',
    'nvim-tree',
  }
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

-- Now don't forget to initialize lualine
lualine.setup(config)
