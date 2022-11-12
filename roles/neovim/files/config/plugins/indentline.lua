local plugin = lvim.builtin.indentlines

plugin.options.char_list = {}
plugin.options.char = '│'

merge(plugin.options.filetype_exclude, { "jrnl" })

plugin.options.char_highlight_list = {'IndentlineOne', 'IndentlineTwo'}
