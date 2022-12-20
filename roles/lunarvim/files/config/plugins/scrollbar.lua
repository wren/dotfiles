-- scrollbar with markers for various functions
local plugin = { 'petertriho/nvim-scrollbar' }

plugin.event = 'BufRead'

plugin.config = function()
    -- Handlers --
  require("scrollbar.handlers.gitsigns").setup()

  -- Config --
  require("scrollbar").setup({
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    hide_if_all_visible = false, -- Hides everything if all lines are visible
    throttle_ms = 100,
    handle = {
      text = " ",
      color = nil,
      cterm = nil,
      highlight = "CursorColumn",
      hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    excluded_buftypes = {
      "terminal",
    },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
    },
    autocmd = {
      render = {
        "BufWinEnter",
        "TabEnter",
        "TermEnter",
        "WinEnter",
        "CmdwinLeave",
        "TextChanged",
        "VimResized",
        "WinScrolled",
      },
      clear = {
        "BufWinLeave",
        "TabLeave",
        "TermLeave",
        "WinLeave",
      },
    },
    handlers = {
      cursor = false,
      diagnostic = true,
      gitsigns = true, -- Requires gitsigns
      handle = true,
      search = true, -- Requires hlslens
    },
  })
end

table.insert(lvim.plugins, plugin)
