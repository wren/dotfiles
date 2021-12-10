local saga = require 'lspsaga'

saga.init_lsp_saga {
  -- default values
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = ' ',
  dianostic_header_icon = '   ',
  code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = '<cr>',
    vsplit = 'v',
    split = 's',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>', -- quit can be a table,
    exec = '<CR>',
  },
  definition_preview_icon = '  ',
  border_style = "single", -- "single" "double" "round" "plus"
  rename_prompt_prefix = '➤',
}

-- Keymap --
local silent = { silent = true }
map('n', '<localleader>dl', ':Lspsaga show_line_diagnostics<CR>', silent)

