-- Color scheme
local plugin = { 'navarasu/onedark.nvim' }

plugin.config = function()
  local od = require('onedark')
  od.setup {
    style = 'darker',
    ending_tildes = true,
    colors = {
      -- dim_grey = '#2d3035',
    },
    highlights = {
      -- ExampleNC = {fg = '#0000ff', bg = '#00ff00', sp = '$cyan', fmt = 'underline,italic'},
      -- NormalNC = { bg = '#2d3035' },
      -- SignColumnNC = { bg = '#2d3035' },
    }
  }
  od.load()
end

table.insert(lvim.plugins, plugin)
