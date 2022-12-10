local plugin = { 'echasnovski/mini.nvim' }

plugin.event = 'BufEnter'
plugin.config = function()
  require('mini.trailspace').setup({})
end

-- Remove spaces at the end of lines
which_key_register_if_loaded({
  ['<localleader><Space>'] = { ':lua MiniTrailspace.trim()<CR>', 'Delete trailing spaces' }
})

table.insert(lvim.plugins, plugin)
