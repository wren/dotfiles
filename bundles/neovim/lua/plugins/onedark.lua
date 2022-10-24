-- Color scheme
local plugin = { 'navarasu/onedark.nvim' }

plugin.config = function()
  local od = require('onedark')
  od.setup {
    style = 'darker',
    ending_tildes = false,
    colors = {
      dark_grey = '#282C34',
      dim_grey = '#606570',
      mid_grey = '#4C515D',
    },
    highlights = {
      -- ExampleNC = {fg = '#0000ff', bg = '#00ff00', sp = '$cyan', fmt = 'underline,italic'},
      NormalNC = { bg = '$dark_grey' },
      EndOfBuffer = { bg = 'NONE'},
      SignColumn = { bg = 'NONE' },
      VertSplit = { bg = '$dark_grey' },
      StatusLine = { bg = '$dark_grey' },
      IndentlineOne = { fg = '$mid_grey' },
      IndentlineTwo = { fg = '$dim_grey' },
    }
  }
  od.load()
end

table.insert(lvim.plugins, plugin)
