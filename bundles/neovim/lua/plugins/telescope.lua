local plugin = lvim.builtin.telescope
local wk = lvim.builtin.which_key

plugin.defaults.path_display.absolute = true
plugin.defaults.path_display.shorten = nil

plugin.pickers.buffers.initial_mode = "insert"
plugin.pickers.find_files = {
  hidden = true,
  shorten_path = false,
}

plugin.defaults.file_ignore_patterns = {
  "node_modules",
  "^.git/",
  "/Alfred.alfredpreferences/",
}

-- Config --
plugin.defaults.layout_strategy = 'flex'
plugin.defaults.layout_config.vertical.mirror = true

-- Keymap --
wk.mappings["f"] = {
  name = "Find",
  b = {':Telescope buffers<cr>', 'Buffers'},
  t = {':Telescope filetypes<cr>', 'Filetype'},
  p = {':Telescope find_files<cr>', 'Files in Project'},
  f = {':Telescope live_grep<cr>', 'Find'},
  m = {':Telescope keymaps<cr>', 'Key mappings'},
  k = {':Telescope help_tags<cr>', 'Help'},
  c = {':Telescope commands<cr>', 'Commands'},
  s = {':Telescope colorscheme<cr>', 'Color schemes'},
  w = {':Telescope grep_string<cr>', 'Find <word>'},
  r = {':Telescope resume<cr>', 'Resume finder'},
}

wk.mappings["h"] = {
  name = "History",
  [':'] = {':Telescope command_history<cr>', 'Command history'},
  ['/'] = {':Telescope search_history<cr>', 'Search history'},
  f = {':Telescope oldfiles<cr>', 'File history'},
}

which_key_register_if_loaded({
  ['z='] = { ':Telescope spell_suggest theme=cursor<cr>', 'Spelling suggestions' },
  ['<c-p>'] = { ':Telescope find_files<cr>', 'Find files in Project' },
})

which_key_register_if_loaded({
  ['<c-p>'] = { ':Telescope find_files<cr>', 'Find files in Project' },
}, { mode = 'v' })
