local plugin = lvim.builtin.which_key

plugin.setup.plugins.spelling.enabled = false -- disable spelling add-on
plugin.setup.plugins.marks = true -- shows a list of your marks on ' and `
plugin.setup.plugins.registers = true -- shows your registers on " in NORMAL or <C-r> in INSERT mode
plugin.setup.plugins.presets.windows = true -- default bindings on <c-w>

plugin.setup.icons = {
  breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
  separator = "➜", -- symbol used between a key and it's label
  group = " ", -- symbol prepended to a group
}

-- Adjust default keymaps --
plugin.mappings.s = {}
