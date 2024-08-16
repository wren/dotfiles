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
          bg_darker = "require('onedarkpro.helpers').darken('#202328', 2)",
          bg_darkest = "require('onedarkpro.helpers').darken('bg', 8, 'onedark')",
        },
      },
      highlights = {
        ["@markup.heading.1.markdown"] = { fg = "${orange}", bold = true },
        ["@markup.heading.2.markdown"] = { fg = "${purple}", bold = true },
        ["@markup.heading.3.markdown"] = { fg = "${green}", bold = false },
        ["@markup.heading.4.markdown"] = { fg = "${blue}", bold = false },
        ["@markup.heading.5.markdown"] = { fg = "${yellow}", bold = false },
        ["@markup.heading.6.markdown"] = { fg = "${gray}", bold = false },
        ["@markup.raw.block.markdown"] = { bg = "${bg_darker}" },
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
