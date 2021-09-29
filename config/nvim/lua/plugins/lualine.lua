require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { '', '' },
    section_separators = { '', '' },
    disabled_filetypes = {
      'help',
    }
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'filetype', 'encoding' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},

  extensions = {}
}
