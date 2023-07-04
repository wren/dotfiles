return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "python",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyright",
        "ruff",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.ruff)
      table.insert(opts.sources, nls.builtins.diagnostics.ruff)
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },

  {
    -- TODO: Enable dap support for python
    -- "mfussenegger/nvim-dap",
    -- optional = true,
    -- dependencies = {
    --   "suketa/nvim-dap-ruby",
    --   config = function()
    --     require("dap-ruby").setup()
    --   end,
    -- },
  },
}
