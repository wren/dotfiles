-- smarter motions (e.g. recognize CamelCaseWords)
local plugin = { 'chaoren/vim-wordmotion' }

plugin.config = function()
  g.wordmotion_spaces = {
    '-', '_', '/',
    '.', ':', "'",
    '"', '=', '#',
    ',', '.', ';',
    '<', '>',
    '(', ')',
    '{', '}'
  }
  g.wordmotion_uppercase_spaces = {
    ' ', ',', ';',
    '(', ')',
    '{', '}',
    '>', '<'
  }
end

table.insert(lvim.plugins, plugin)
