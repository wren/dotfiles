local plugin = lvim.builtin.treesitter

plugin.ensure_installed = "all"

plugin.ignore_install = {
  "haskell",
}

plugin.highlight.enabled = true
plugin.indent.enabled = true
plugin.indent.disable = {}

set('foldmethod', 'expr')
set('foldexpr', 'nvim_treesitter#foldexpr()')
