return {
  -- disable some defaults
  { "folke/flash.nvim", enabled = false },

  -- enable some extras
  { import = "lazyvim.plugins.extras.ai.copilot" },
  { import = "lazyvim.plugins.extras.ai.copilot-chat" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  { import = "lazyvim.plugins.extras.ui.mini-animate" },
  { import = "lazyvim.plugins.extras.coding.mini-comment" },
  { import = "lazyvim.plugins.extras.coding.mini-snippets" },
  { import = "lazyvim.plugins.extras.coding.neogen" },
  { import = "lazyvim.plugins.extras.coding.yanky" },

  -- update some default configs
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
    "snacks.nvim",
    keys = {
      -- override some keys to prefer cwd instead of repo root
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer (cwd)",
      },
      {
        "<leader>E",
        function()
          Snacks.explorer({ cwd = LazyVim.root() })
        end,
        desc = "Explorer (root dir)",
      },

      -- grep: lowercase = cwd; keep <leader>sg for root, or pick another key
      { "<leader>/", LazyVim.pick("grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sg", LazyVim.pick("grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sG", LazyVim.pick("grep"), desc = "Grep (root dir)" },

      -- find files: lowercase = cwd
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (root dir)" },
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
