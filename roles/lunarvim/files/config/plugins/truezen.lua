-- nice formatting when writing (removes a lot of noise)
local plugin = { 'Pocco81/TrueZen.nvim' }

plugin.cmd = {
  'TZAtaraxis',
  'TZFocus',
  'TZMinimalist',
}

plugin.config = function()
  require("true-zen").setup {
    modes = {
      ataraxis = {
        shade = "dark",
        backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
        minimum_writing_area = { -- minimum size of main window
          width = 88,
          height = 999,
        },
        options = { -- options to be disabled when entering Minimalist mode
          number = false,
          relativenumber = false,
          showtabline = 0,
          signcolumn = "no",
          statusline = "",
          cmdheight = 1,
          laststatus = 0,
          showcmd = false,
          showmode = false,
          ruler = false,
          numberwidth = 1
        },
        quit_untoggles = false,
        padding = {
          left = 52,
          right = 52,
          top = 10,
          bottom = 10,
        },
        callbacks = {
          open_pre = function()
            local normal = vim.api.nvim_get_hl_by_name("Normal", true)
            vim.api.nvim_set_hl(0, "NormalNC", { bg = normal.background })
          end,
          open_pos = nil,
          close_pre = nil,
          close_pos = nil
        },
      },
    },
    integrations = {
      lualine = true,
    },
  }
end

table.insert(lvim.plugins, plugin)
