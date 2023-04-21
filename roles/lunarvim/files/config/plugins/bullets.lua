
-- Takes any command and puts the output into a buffer
local plugin = { 'dkarter/bullets.vim' }

plugin.ft ={ 'jrnl', 'markdown' }
g.bullets_enabled_file_types = {
  'markdown',
  'text',
  'gitcommit',
  'scratch',
  'jrnl',
}

plugin.init = function()
  g.bullets_checkbox_markers = ' .x'
  g.bullets_enable_in_empty_buffers = 1
  g.bullets_mapping_leader = ''
  g.bullets_delete_last_bullet_if_empty = 1
  g.bullets_line_spacing = 1
  g.bullets_auto_indent_after_colon = 1
  g.bullets_max_alpha_characters = 1
  g.bullets_renumber_on_change = 1
  g.bullets_checkbox_partials_toggle = 0

  g.bullets_outline_levels = {'ROM', 'ABC', 'num', 'abc', 'rom', 'std-'}

  -- keymap --
  g.bullets_set_mappings = 0

  which_key_register_if_loaded({
    ['<localleader>b'] = {
      t = {'<Plug>(bullets-toggle-checkbox)', 'Toggle checkbox'},
      r = {'<Plug>(bullets-renumber)', 'Renumber list'},
    }
  })

  g.bullets_custom_mappings = {
    {'imap', '<cr>', '<Plug>(bullets-newline)'},
    {'inoremap', '<C-cr>', '<cr>'},
    {'nmap', 'o', '<Plug>(bullets-newline)'},
    {'vmap', 'gN', '<Plug>(bullets-renumber)'},
    {'nmap', 'gN', '<Plug>(bullets-renumber)'},
    {'imap', '<tab>', '<Plug>(bullets-demote)'},
    {'nmap', '>>', '<Plug>(bullets-demote)'},
    {'vmap', '>', '<Plug>(bullets-demote)'},
    {'imap', '<s-tab>', '<Plug>(bullets-promote)'},
    {'nmap', '<<', '<Plug>(bullets-promote)'},
    {'vmap', '<', '<Plug>(bullets-promote)'},
  }
end

table.insert(lvim.plugins, plugin)
