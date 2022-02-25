-- peeks to line number while typing (e.g. :32)
local plugin = { 'nacro90/numb.nvim' }

plugin.event = 'BufRead'
plugin.config = function()
  require('numb').setup {
    show_numbers = true,    -- Enable 'number' for the window while peeking
    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  }
end

table.insert(lvim.plugins, plugin)
