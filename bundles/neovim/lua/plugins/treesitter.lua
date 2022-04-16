local plugin = lvim.builtin.treesitter

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "all"
  -- "bash",
  -- "c",
  -- "javascript",
  -- "json",
  -- "lua",
  -- "python",
  -- "typescript",
  -- "css",
  -- "yaml",

lvim.builtin.treesitter.ignore_install = {
  "haskell"
}
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enabled = true

cmd [[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]]
