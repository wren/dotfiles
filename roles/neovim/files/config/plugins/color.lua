-- Color scheme
return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      options = {
        highlight_inactive_windows = true,
        cursorline = true,
      },
      colors = {
        dark = {
          bg = "#202328",
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
