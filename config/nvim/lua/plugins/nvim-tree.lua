
-- Config --
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  }
}

-- Keymap --
map('n', '<leader>eo', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>')
map('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>')
