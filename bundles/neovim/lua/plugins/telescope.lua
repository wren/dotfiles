local plugin = lvim.builtin.telescope
local wk = lvim.builtin.which_key

plugin.defaults.path_display.absolute = true
plugin.defaults.path_display.shorten = nil
-- plugin.pickers.wrap_results = true


plugin.pickers.commands = {}
plugin.pickers.help_tags = {}
plugin.pickers.keymaps = {}
plugin.pickers.vim_options = {}
plugin.pickers.colorscheme = {}
plugin.pickers.oldfiles = {}
plugin.pickers.command_history = {}
plugin.pickers.search_history = {}
plugin.pickers.filetypes = {}

for _, val in pairs(plugin.pickers) do
  val.theme = "ivy"
  val.previewer = plugin.file_previewer
  val.initial_mode = "insert"
  -- val.wrap_results = true
end
-- plugin.pickers.find_files.previewer = plugin.file_previewer
-- plugin.pickers.live_grep.previewer = plugin.grep_previewer


plugin.defaults.file_ignore_patterns = {
  "node_modules",
  "^.git/",
  "/Alfred.alfredpreferences/",
}

-- Config --

-- Keymap --
local t = require('telescope.builtin')

wk.mappings["f"] = {
  name = "Find",
  b = {t.buffers, 'Buffers'},
  c = {t.commands, 'Commands'},
  f = {function() t.grep_string{ search="" } end, 'Find'},
  g = {t.live_grep, 'Live grep'},
  k = {t.help_tags, 'Help'},
  K = {function() t.help_tags{ default_text=fn.expand("<cword>") } end, 'Help <word>'},
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

map('v', '<leader>fw', function() t.grep_string({ search = get_visual_selection() }) end)

which_key_register_if_loaded({
  -- doesn't work for some reason
  -- ['z='] = { function() t.spell_suggest({theme='cursor'}) end, 'Spelling suggestions' },
  ['z='] = { ':Telescope spell_suggest theme=cursor<cr>', 'Spelling suggestions' },
  ['<c-p>'] = { t.find_files, 'Find files in Project' },
})
