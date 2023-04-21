-- Bufferline with animations
local plugin = lvim.builtin.bufferline

lvim.keys.normal_mode = {
  -- Navigation shortcuts
  ['<c-,>'] = false,
  ['<c-.>'] = false,
}

plugin.on_config_done = function()
  -- Keymap --
  -- These commands will navigate through buffers in order regardless of which mode you are using
  -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
  local opts = { silent = true }

  -- Move to previous/next
  map({'n', 'v'}, '<c-,>', ':BufferLineCyclePrev<CR>')
  map({'n', 'v'}, '<c-.>', ':BufferLineCycleNext<CR>')

  -- Re-order to previous/next
  map('n', '<c-<>', ':BufferLineMovePrev<CR>', opts)
  map('n', '<c->>', ':BufferLineMoveNext<CR>', opts)

  -- Magic buffer-picking mode
  map('n', '<leader>bp', ':BufferLinePick<CR>', opts)

  -- Sort automatically by...
  map('n', '<leader>bo', ':BufferLineSortByDirectory<CR>', opts)
  map('n', '<leader>bl', ':BufferLineSortByExtension<CR>', opts)
end
