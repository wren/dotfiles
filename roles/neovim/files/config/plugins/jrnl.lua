return {
  {
    -- Syntax highlighting for jrnl files
    "wren/jrnl.vim",
    branch = "rework-structure-5",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "jrnl" },
    opts = {
      file_types = { "jrnl" },
      bullet = {
        icons = { "" },
      },
      heading = {
        sign = false,
        icons = {
          "█▐ ",
          "█▐▐ ",
          "█▐▐▐ ",
          "█▐▐▐▐ ",
          "█▐▐▐▐▐ ",
          "█▐▐▐▐▐▐ ",
        },
        -- border = true,
        -- border_prefix = true,
        -- border_virtual = false,
        -- above = "▁",
        -- below = "▔",
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
    -- easier and nicer (ass opposed to writing code)
    "preservim/vim-pencil",
    ft = { "jrnl" },
    config = function()
      -- options
      -- 0=disable, 1=one char, 2=hide char, 3=hide all (default)
      vim.g["pencil#conceallevel"] = 2
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        options = {
          laststatus = 0, -- turn off the statusline
        },
      },
    },
  },
}
