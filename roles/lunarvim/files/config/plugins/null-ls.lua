local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black" },
  { command = "prettier" },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "actionlint",
    runtime_condition = function(params)
      return string.find(params.bufname, "/.github/")
    end,
  },
  { command = "shellcheck", },
  { command = "gitlint" },
}


-- local null_ls = require("null-ls")
-- null_ls.register {
--   null_ls.builtins.diagnostics.flake8.with({
--     name = "flakeheaven",
--     command = "flake8heavened",
--     meta = {
--         url = "https://github.com/flakeheaven/flakeheaven",
--         description = "Flake8 wrapper to make it nice, legacy-friendly, configurable.",
--     },
--   }),
-- }
