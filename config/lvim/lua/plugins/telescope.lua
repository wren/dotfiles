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

plugin.on_config_done = function()
  -- Keymap --
  local silent = { silent = true }
  map('n', '<leader>fb', ':Telescope buffers<CR>', silent)
  map('n', '<leader>ft', ':Telescope filetypes<CR>', silent)
  map('n', '<M-C-p>', ':Telescope buffers<CR>', silent)
  map('n', '<C-p>', ':Telescope find_files<CR>', silent)
  map('n', '<leader>fp', ':Telescope find_files<CR>')
  map('n', '<leader>ff', ':Telescope live_grep<CR>')
  map('n', '<leader>fm', ':Telescope keymaps<CR>')
  map('n', '<leader>fk', ':Telescope help_tags<CR>')
  map('n', '<leader>fc', ':Telescope commands<CR>')
  map('n', '<leader>hc', ':Telescope cocmmand_history<CR>')
  map('n', '<leader>hs', ':Telescope search_history<CR>')
  map('n', '<leader>hf', ':Telescope oldfiles<CR>')
  map('n', '<leader>fs', ':Telescope colorscheme<CR>', silent)
  map('n',  '<leader>fw', ':Telescope grep_string<CR>', silent)
  map('n',  'z=', ':Telescope spell_suggest theme=cursor<CR>', silent)
end
