return {
  {
    -- Syntax highlighting for jrnl files
    "wren/jrnl.vim",
    branch = "treesitter",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "jrnl", "markdown" },
    opts = {
      file_types = { "jrnl", "markdown" },
      bullet = {
        icons = { "" },
      },
      heading = {
        sign = false,
        icons = {
          -- full block: █
          "▉▊",
          "▉▊▋",
          "▉▊▋▌",
          "▉▊▋▌▍",
          "▉▊▋▌▍▎",
          "▉▊▋▌▍▎▏",
        },
      },
      code = {
        width = "block",
        left_pad = 0,
        right_pad = 1,
      },
      checkbox = {
        enabled = true,
        position = "inline",
        unchecked = {
          icon = "",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = "RenderMarkdownUncheckedText",
        },
        checked = {
          icon = "",
          highlight = "RenderMarkdownChecked",
          scope_highlight = "RenderMarkdownCheckedText",
        },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔", highlight = "RenderMarkdownTodo", scope_highlight = nil },
          info = {
            raw = "[i]",
            rendered = "",
            highlight = "RenderMarkdownTodoInfoIcon",
            scope_highlight = "RenderMarkdownTodoInfoText",
          },
          question = {
            raw = "[?]",
            rendered = "",
            highlight = "RenderMarkdownTodoQuestionIcon",
            scope_highlight = "RenderMarkdownTodoQuestionText",
          },
          active = {
            raw = "[.]",
            rendered = "",
            highlight = "RenderMarkdownTodoActiveIcon",
            scope_highlight = "RenderMarkdownTodoActiveText",
          },
          important = {
            raw = "[!]",
            rendered = " ",
            highlight = "RenderMarkdownTodoImportantIcon",
            scope_highlight = "RenderMarkdownTodoImportantText",
          },
          star = {
            raw = "[*]",
            rendered = "",
            highlight = "RenderMarkdownTodoStarIcon",
            scope_highlight = "RenderMarkdownTodoStarText",
          },
        },
      },
    },
  },
  {
    -- Changes some settings to make writing prose/notes
    -- easier and nicer (as opposed to writing code)
    "preservim/vim-pencil",
    ft = { "jrnl" },
    config = function()
      -- options
      -- 0=disable, 1=one char, 2=hide char, 3=hide all (default)
      vim.g["pencil#conceallevel"] = 2
    end,
  },
}
