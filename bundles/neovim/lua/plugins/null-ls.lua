local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black" },
  { command = "prettier" },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "actionlint" },
  { command = "flake8", },
  { command = "shellcheck", },
  { command = "gitlint" },
  {
    command = "alex",
    extra_filetypes = { "jrnl" },
  },
}

-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {}
