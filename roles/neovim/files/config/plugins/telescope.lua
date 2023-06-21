return {
  -- change some telescope options
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        "^.git/",
        "/Alfred.alfredpreferences/",
      },
    },
    pickers = {
      find_files = { theme = "ivy" },
      buffers = { theme = "ivy" },
      commands = { theme = "ivy" },
    },
  },

  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
