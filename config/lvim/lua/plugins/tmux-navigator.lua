-- Integration between buffers and tmux panes
local plugin = { 'christoomey/vim-tmux-navigator' }

plugin.event = 'CursorMoved'
plugin.config = function()
  g.tmux_navigator_no_mappings = 1
  -- Keymap --
  local opts = { silent = true }
  map('n', '<M-h>', ':TmuxNavigateLeft<cr>', opts)
  map('n', '<M-j>', ':TmuxNavigateDown<cr>', opts)
  map('n', '<M-k>', ':TmuxNavigateUp<cr>', opts)
  map('n', '<M-l>', ':TmuxNavigateRight<cr>', opts)
  map('n', '<M-o>', ':TmuxNavigatePrevious<cr>', opts)
end

table.insert(lvim.plugins, plugin)
