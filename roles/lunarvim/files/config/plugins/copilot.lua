-- coding AI thing, I guess
local plugin = { 'zbirenbaum/copilot-cmp' }

plugin.event = 'InsertEnter'
plugin.dependencies = { "zbirenbaum/copilot.lua" }

plugin.config = function()
  vim.defer_fn(function()
    require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
    require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
  end, 100)
  require('hop').setup()
end

table.insert(lvim.plugins, plugin)
