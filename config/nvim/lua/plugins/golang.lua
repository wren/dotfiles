-- Settings --
g.go_fmt_command = "goimports"
g.go_highlight_types = 1
g.go_highlight_fields = 1
g.go_highlight_functions = 1
g.go_highlight_function_calls = 1
g.go_highlight_methods = 1
g.go_highlight_structs = 1
g.go_highlight_operators = 1
g.go_highlight_extra_types = 1
g.go_highlight_build_constraints = 1
g.go_highlight_generate_tags = 1

-- disable use K to run godoc
g.go_doc_keywordprg_enabled = 0
g.go_def_mapping_enabled = 0

-- Keymap --
opts = { silent = true }
map('n', '<LocalLeader>gi', ':GoImpl<CR>', opts)
map('n', '<LocalLeader>gd', ':GoDescribe<CR>', opts)
-- map('n', '<LocalLeader>gc', ':GoCallees<CR>', opts)
map('n', '<LocalLeader>gC', ':GoCallers<CR>', opts)
map('n', '<LocalLeader>gs', ':GoCallstack<CR>', opts)
