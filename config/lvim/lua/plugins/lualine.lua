local components = require "lvim.core.lualine.components"
local colors = require "lvim.core.lualine.colors"

local custom_components = {
  mode_inactive = {
    function() return 'INACTIVE' end,
    color = 'LualineFilenameInactive'
  },

  filename = {
    function ()
      if opt.bo.filetype == 'help' then
        return 'HELP - ' .. fn.expand('%:t:r')
      end

      local my_colors = require('nightfox.colors').load('nightfox')
      local is_modified = api.nvim_buf_get_option(api.nvim_get_current_buf(), 'modified')
      local filename = fn.fnamemodify(fn.expand("%"), ":~:.")
      local fg = my_colors.fg
      local bg = my_colors.bg_statusline
      local gui = 'NONE'

      if is_modified then
        fg = my_colors.yellow
        filename = filename .. ' '
        gui = 'bold'
      end

      cmd(string.format('hi LualineFilename guifg=%s guibg=%s gui=%s', fg, bg, gui))

      return filename
    end,
    color = 'LualineFilename'
  },
}

-- overrides for builtin components
components.treesitter.padding = { left = 0, right = 0 }
components.python_env.padding = { left = 0, right = 0 }
components.lsp.icon = " "
components.lsp.padding = { left = 0, right = 0 }
components.branch.color = { fg = colors.orange, gui = 'bold' }

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
    lualine_b = {
      custom_components.filename,
    },
    lualine_c = {
      components.diagnostics
    },
    lualine_x = {
      components.branch,
      components.diff,
      components.lsp,
      components.filetype,
      components.python_env,
      components.treesitter,
      components.encoding,
    },
    lualine_y = {
      -- components.spaces,
    },
    lualine_z = {
      'progress',
      'location',
      components.scrollbar,
    },
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {
      custom_components.mode_inactive
    },
    lualine_b = {
      custom_components.filename,
    },
    lualine_c = {
      components.diagnostics
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

-- Now don't forget to initialize lualine config
lvim.builtin.lualine = vim.tbl_extend('force', lvim.builtin.lualine, config)
