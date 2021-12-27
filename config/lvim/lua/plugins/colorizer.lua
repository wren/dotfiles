-- Highlights colors in buffers (e.g. #00ff00)
local plugin = { 'norcalli/nvim-colorizer.lua' }

plugin.config = function()
  require 'colorizer'.setup()
end

table.insert(lvim.plugins, plugin)
