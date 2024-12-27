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
        ["@markup.list.checked"] = { fg = "${gray}", bg = nil },
        RenderMarkdownTodo = { fg = "", bg = "" },
        RenderMarkdownTodoInfoIcon = { fg = "${blue}", bg = nil },
        RenderMarkdownTodoInfoText = { fg = "${blue}", bg = nil },
        RenderMarkdownTodoQuestionIcon = { fg = "${purple}", bg = nil },
        RenderMarkdownTodoQuestionText = { fg = "${purple}", bg = nil },
        RenderMarkdownTodoActiveIcon = { fg = "${green}", bg = nil },
        RenderMarkdownTodoActiveText = { fg = "${green}", bg = nil },
        RenderMarkdownTodoImportantIcon = { fg = "${red}", bg = "${black}" },
        RenderMarkdownTodoImportantText = { fg = "${black}", bg = "${red}" },
        RenderMarkdownTodoStarIcon = { fg = "${gray}", bg = nil },
        RenderMarkdownTodoStarText = { fg = "${gray}", bg = nil },
        RenderMarkdownChecked = { fg = "${gray}" },
        RenderMarkdownCheckedText = { fg = "${gray}", strikethrough = true },
        ["@markup.raw.block.markdown"] = { bg = "${bg_darker}" },
        RenderMarkdownCode = { bg = "${bg_darker}" },
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
