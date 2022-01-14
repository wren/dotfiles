local plugin = lvim.builtin.telescope

plugin.defaults.path_display.absolute = true
plugin.defaults.path_display.shorten = nil

plugin.defaults.pickers = {
  find_files = {
    hidden = true,
    shorten_path = false,
  }
}

plugin.defaults.file_ignore_patterns = {
  "node_modules",
  "^.git/",
  "/Alfred.alfredpreferences/",
}

-- Config --
plugin.defaults.layout_strategy = 'flex'
plugin.defaults.layout_config = {
  flex = {
    flip_columns = 200,
  },
  horizontal = {
    -- prompt_position = 'top',
  }
}

-- add some mappings, but don't erase the defaults
plugin.defaults.mappings.i['<C-/>'] = 'which_key'

-- Keymap --
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = {':Telescope buffers<CR>', 'Buffers'},
  t = {':Telescope filetypes<CR>', 'Filetype'},
  p = {':Telescope find_files<CR>', 'Files in Project'},
  f = {':Telescope live_grep<CR>', 'Find'},
  m = {':Telescope keymaps<CR>', 'Key mappings'},
  k = {':Telescope help_tags<CR>', 'Help'},
  c = {':Telescope commands<CR>', 'Commands'},
  s = {':Telescope colorscheme<CR>', 'Color schemes'},
  w = {':Telescope grep_string<CR>', 'Find <word>'},
}

lvim.builtin.which_key.mappings["h"] = {
  name = "History",
  c = {':Telescope cocmmand_history<CR>'},
  s = {':Telescope search_history<CR>'},
  f = {':Telescope oldfiles<CR>'},
}

lvim.keys.normal_mode = {
  -- Navigation shortcuts
  ['<C-P>'] = ':Telescope find_files<CR>',
  ['<M-C-P>'] = ':Telescope buffers<CR>',
}

lvim.keys.visual_mode = {
  -- Navigation shortcuts
  ['<C-P>'] = ':Telescope find_files<CR>',
  ['<M-C-P>'] = ':Telescope buffers<CR>',
}

