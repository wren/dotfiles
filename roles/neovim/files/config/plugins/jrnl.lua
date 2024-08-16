return {
  {
    -- Syntax highlighting for jrnl files
    "wren/jrnl.vim",
    branch = "rework-structure-5",
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
