-- Better repeating with period command
local plugin = { 'mrjones2014/smart-splits.nvim' }

plugin.keys = {
  '<a-h>',
  '<a-j>',
  '<a-k>',
  '<a-l>',
}

plugin.config = function()
  require('smart-splits').setup({
    -- the default number of lines/columns to resize by at a time
    default_amount = 3,
    ignored_filetypes = {
      'nofile',
      'quickfix',
      'prompt',
    },
    ignored_buftypes = {
      'NvimTree',
    },
    tmux_integration = false,
  })

  -- Keymap --
  local split = require('smart-splits')
  vim.keymap.set('n', '<a-h>', split.resize_left)
  vim.keymap.set('n', '<a-j>', split.resize_down)
  vim.keymap.set('n', '<a-k>', split.resize_up)
  vim.keymap.set('n', '<a-l>', split.resize_right)
end

table.insert(lvim.plugins, plugin)
