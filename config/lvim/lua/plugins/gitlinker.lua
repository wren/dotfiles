-- generate links to code on github, bitbucket, etc
local plugin = { 'ruifm/gitlinker.nvim' }

plugin.keys = { '<leader>gy' }

plugin.config = function()
  require('gitlinker').setup {
    opts = {
      mappings = '<leader>gy',
    },
  }
end

table.insert(lvim.plugins, plugin)
