return {
  -- disable some defaults
  { "folke/flash.nvim", enabled = false },

  -- { import = "lazyvim.plugins.extras.coding.copilot" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  { import = "lazyvim.plugins.extras.ui.mini-animate" },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {
          "filetype",
        },
      },
    },
  },

  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        layout = "horizontal",
        backdrop = 60,
        width = 1.0,
        height = 0.8,
        row = 1.0,
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[


    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
      },
    },
  },
}
