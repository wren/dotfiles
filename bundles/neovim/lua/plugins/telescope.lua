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
local t = require('telescope.builtin')

wk.mappings["f"] = {
  name = "Find",
  b = {t.buffers, 'Buffers'},
  c = {t.commands, 'Commands'},
  f = {t.live_grep, 'Find'},
  k = {t.help_tags, 'Help'},
  K = {function() t.help_tags({default_text=fn.expand("<cword>")}) end, 'Help <word>'},
  m = {t.keymaps, 'Key mappings'},
  o = {t.vim_options, 'Neovim Options'},
  p = {t.find_files, 'Files in Project'},
  r = {t.resume, 'Resume previous finder'},
  s = {t.colorscheme, 'Color schemes'},
  t = {t.filetypes, 'Filetype'},
  w = {t.grep_string, 'Find <word>'},
}

wk.mappings["h"] = {
  name = "History",
  [':'] = {t.command_history, 'Command history'},
  ['/'] = {t.search_history, 'Search history'},
  f = {t.oldfiles, 'File history'},
}

which_key_register_if_loaded({
  -- doesn't work for some reason
  -- ['z='] = { function() t.spell_suggest({theme='cursor'}) end, 'Spelling suggestions' },
  ['z='] = { ':Telescope spell_suggest theme=cursor<cr>', 'Spelling suggestions' },
  ['<c-p>'] = { t.find_files, 'Find files in Project' },
})
