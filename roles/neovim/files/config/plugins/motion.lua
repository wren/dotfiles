return {
  "chaoren/vim-wordmotion",
  config = function()
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
}
