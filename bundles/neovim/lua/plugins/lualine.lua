local components = require "lvim.core.lualine.components"
local colors = require "lvim.core.lualine.colors"

local custom_components = {
  mode_inactive = {
    function() return 'INACTIVE' end,
    color = 'LualineFilenameInactive'
  },

  filename_default = {
    'filename',
    path = 0,
    symbols = {
      modified = ' ',      -- Text to show when the file is modified.
      readonly = '',      -- Text to show when the file is non-modifiable or readonly.
      unnamed = '[No Name]', -- Text to show for unnamed buffers.
    },
  },

  filename = {
    'filename',
    cond = function() return not api.nvim_buf_get_option(api.nvim_get_current_buf(), 'modified') end
  },

  filename_modified = {
    'filename',
    color = { fg = '#E5C07B', gui = 'bold' },
    cond = function() return api.nvim_buf_get_option(api.nvim_get_current_buf(), 'modified') end
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
    theme = 'onedark',
    -- component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {
      'mode',
    },
    lualine_b = {
      vim.tbl_extend('force', custom_components.filename_default, custom_components.filename),
      vim.tbl_extend('force', custom_components.filename_default, custom_components.filename_modified),
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
      -- 'progress',
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
      vim.tbl_extend('force', custom_components.filename_default, custom_components.filename),
      vim.tbl_extend('force', custom_components.filename_default, custom_components.filename_modified),
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
