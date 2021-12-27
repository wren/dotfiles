local plugin = { 'echasnovski/mini.nvim' }

plugin.event = 'BufEnter'
plugin.config = function()
  require('mini.trailspace').setup({})
end

-- Remove spaces at the end of lines
map('n', '<localleader><Space>', ':lua MiniTrailspace.trim()<CR>', {silent = true})

table.insert(lvim.plugins, plugin)
