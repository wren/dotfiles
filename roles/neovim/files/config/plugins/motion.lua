return {
  "chaoren/vim-wordmotion",
  config = function()
    vim.g.wordmotion_spaces = {
      '-', '_', '/',
      '.', ':', "'",
      '"', '=', '#',
      ',', '.', ';',
      '<', '>',
      '(', ')',
      '{', '}'
    }
    vim.g.wordmotion_uppercase_spaces = {
      ' ', ',', ';',
      '(', ')',
      '{', '}',
      '>', '<'
    }
  end
}
