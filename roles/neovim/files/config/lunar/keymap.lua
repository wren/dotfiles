-- Key mappings not specific to a plugin --
lvim.leader = "space"

merge(lvim.keys.visual_mode, {
  -- Navigation shortcuts
  ['<C-,>'] = ':BufferPrevious<cr>',
  ['<C-.>'] = ':BufferNext<cr>',

  -- shortcuts for start/end of line
  ['<S-h>'] = false,
  ['<S-l>'] = false,
})

-- Write buffer (save)
lvim.builtin.which_key.mappings["q"] = { "<c-w>c", "Quit window" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>qa<cr>", "Quit all" }

--tab operation
which_key_register_if_loaded({
  name = 'Tab',
  ['<leader>tn'] = { ':tabnew<cr>', 'New tab' },
  ['<leader>te'] = { ':tabedit ', 'Edit in new tab' },
  ['<leader>tc'] = { ':tabclose<cr>', 'Close tab' },
  ['<leader>td'] = { ':tcd %:p:h<cr>', 'Change Dir in Tab' },
})

-- splitting windows (these match the tmux shortcuts)
which_key_register_if_loaded({
  ['<leader>\\'] = { ':vsplit<CR>', 'Split vertical' },
  ['<leader>-'] = { ':split<CR>', 'Split horizontal' },
}, { remap = true })

-- Get syntax info at cursor
which_key_register_if_loaded({
  ['<localleader>h'] = { highlight_group, 'Show highlight group' },
})
