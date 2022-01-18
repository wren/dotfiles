local plugin = { 'lukas-reineke/indent-blankline.nvim' }
plugin.ft = {
  'lua',            'python', 'javascript',
  'javscriptreact', 'sh',     'zsh',
  'bash',           'toml',   'yaml',
  'gitconfig',      'git',    'html',
  'css',            'scss',   'sass',
}

plugin.setup = function()

  g.indentLine_enabled = 1
  g.indentLine_char_list = {}
  g.indentLine_char = '│'
  g.indentLine_first_char = '│'
  g.indentLine_fileTypeExclude = { 'defx', 'help', 'term', 'jrnl', 'dashboard' }
  -- g.indentLine_concealcursor = '-n'
  g.indentLine_color_term = 96
  g.indentLine_color_gui = '#5A6872'
  g.indentLine_showFirstIndentLevel = 1

  -- g.indent_blankline_char_highlight_list = {'IndentlineOne', 'IndentlineTwo'}
  g.indent_blankline_space_char_highlight_list = {'IndentlineOne', 'IndentlineTwo'}

  g.indent_blankline_use_treesitter = true
  g.indent_blankline_show_current_context = true

  g.indent_blankline_show_trailing_blankline_indent = false
-- g.indent_blankline_char = " "

end


table.insert(lvim.plugins, plugin)
