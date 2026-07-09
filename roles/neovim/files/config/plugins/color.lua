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
          dim_blue = "#27313C",
          dim_yellow = "#343330",
        },
      },
      highlights = {
        -- headings
        -- swap heading colors because they're too similar to adjacent ones
        RenderMarkdownH3 = { fg = "${blue}" },
        RenderMarkdownH3Bg = { bg = "${dim_blue}" },
        ["@markup.heading.3.markdown"] = { fg = "${blue}" },
        RenderMarkdownH5 = { fg = "${yellow}" },
        RenderMarkdownH5Bg = { bg = "${dim_yellow}" },
        ["@markup.heading.5.markdown"] = { fg = "${yellow}" },

        -- todo boxes
        RenderMarkdownTodo = { fg = "", bg = "" },
        RenderMarkdownTodoInfoIcon = { fg = "${blue}", bg = nil },
        RenderMarkdownTodoInfoText = { fg = "${blue}", bg = nil },
        RenderMarkdownTodoQuestionIcon = { fg = "${purple}", bg = nil },
        RenderMarkdownTodoQuestionText = { fg = "${purple}", bg = nil },
        RenderMarkdownTodoActiveIcon = { fg = "${orange}", bg = nil },
        RenderMarkdownTodoActiveText = { fg = "${green}", bg = nil },
        RenderMarkdownTodoImportantIcon = { fg = "${red}", bg = nil },
        RenderMarkdownTodoImportantText = { fg = "${black}", bg = "${red}", bold = true },
        RenderMarkdownTodoStarIcon = { fg = "${yellow}", bg = nil, underline = true },
        RenderMarkdownTodoStarText = { fg = "${yellow}", bg = nil, bold = true, underline = true },
        RenderMarkdownChecked = { fg = "${gray}" },
        RenderMarkdownCheckedText = { fg = "${gray}", strikethrough = true },
        ["@markup.list.checked"] = { fg = "${gray}", bg = nil },
        RenderMarkdownUnchecked = { fg = "${orange}" },
        RenderMarkdownUncheckedText = { fg = "${green}", strikethrough = false },

        -- code blocks
        RenderMarkdownCode = { bg = "${bg_darkest}" },
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
