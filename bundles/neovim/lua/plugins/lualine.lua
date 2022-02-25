local components = require "lvim.core.lualine.components"
local colors = require "lvim.core.lualine.colors"

local function merge(one, two)
  return vim.tbl_extend('force', one, two)
end
local custom_components = {
  mode_inactive = {
    function() return ' ' end,
    color = { bg = '#2D3035' }
  },

  filename_default = {
    'filename',
    path = 1,
    shorting_target = 0,
    symbols = {
      modified = ' ',      -- Text to show when the file is modified.
      readonly = '',      -- Text to show when the file is non-modifiable or readonly.
      unnamed = '[No Name]', -- Text to show for unnamed buffers.
    },
  },

}

custom_components.filename = merge(custom_components.filename_default, {
  'filename',
  cond = function() return not api.nvim_buf_get_option(api.nvim_get_current_buf(), 'modified') end
})

custom_components.filename_modified = merge(custom_components.filename_default, {
  'filename',
  color = { fg = '#E5C07B', gui = 'bold' },
  cond = function() return api.nvim_buf_get_option(api.nvim_get_current_buf(), 'modified') end
})


-- overrides for builtin components
components.treesitter.padding = 1
components.python_env.padding = 0
components.lsp.icon = ""
components.lsp.separator = ""
components.lsp[1] = function() return '' end
components.lsp.padding = 0
components.branch.color = { fg = colors.orange, gui = 'bold' }
components.scrollbar.separator = { left = '', right= '' }
components.scrollbar.color = { bg = nil }
components.encoding.separator = { right = '' }
components.diff.separator = ''
components.diff.padding = 0

-- Style overrides
local custom_theme = require'lualine.themes.onedarker'
custom_theme.normal.c.bg = '#1F2329'
-- custom_theme.inactive.c.bg = '#2D3035'

local config = {
  options = {
    theme = custom_theme,
    -- component_separators = {left = '', right = ''},
    component_separators = '|',
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {
      { 'mode', separator = { left = '' }, padding = { left = 0, right = 1 } },
    },
    lualine_b = {
      custom_components.filename,
      custom_components.filename_modified,
    },
    lualine_c = {
      components.diagnostics,
    },
    lualine_x = {
      components.diff,
      components.branch,
    },
    lualine_y = {
      -- components.spaces,
      components.lsp,
      components.treesitter,
      components.filetype,
      -- components.python_env,
      components.encoding,
      components.scrollbar,
    },
    lualine_z = {
      -- 'progress',
      { 'location', separator = { right = '' }, right_padding = 2 },
    },
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {
    },
    lualine_b = {
      custom_components.filename_default
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
    'symbols-outline',
  }
}

-- Now don't forget to initialize lualine config
lvim.builtin.lualine = merge(lvim.builtin.lualine, config)
