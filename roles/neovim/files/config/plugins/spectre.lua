-- find and replace
local plugin = { 'windwp/nvim-spectre' }

plugin.event = 'BufRead'
plugin.config = function()
  require('spectre').setup()
  cmd [[nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>]]
end

table.insert(lvim.plugins, plugin)
