require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = { enable = true },
  indent = { enable = true },
}
cmd [[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]]
