return {
  -- change some telescope options
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>sK",
      function()
        require("telescope.builtin").help_tags({ default_text = vim.fn.expand("<cword>") })
      end,
      desc = "Help <word>",
    },
    {
      "<leader>sk",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Help",
    },
    {
      "<leader>sm",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Key mappings",
    },
  },
  opts = function(_, opts)
    opts.defaults = {
      file_ignore_patterns = {
        "node_modules",
        "^.git/",
        "/Alfred.alfredpreferences/",
      },
    }

    -- Set default opts for all pickers
    opts.pickers = {}
    for k, _ in pairs(require("telescope.builtin")) do
      opts.pickers[k] = { theme = "ivy" }
    end

    return opts
  end,

  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
