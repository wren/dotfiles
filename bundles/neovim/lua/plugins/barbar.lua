-- Bufferline with animations
local plugin = lvim.builtin.bufferline

lvim.keys.normal_mode = {
  -- Navigation shortcuts
  ['<C-,>'] = false,
  ['<C-.>'] = false,
  ['<A-e>'] = ':echo butt<cr>',
}

plugin.on_config_done = function()
  -- Keymap --
  -- These commands will navigate through buffers in order regardless of which mode you are using
  -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
  local opts = { silent = true }
  -- These commands will move the current buffer backwards or forwards in the bufferline
  -- map('n', '[b', ':BufferLineMovePrev<CR>', opts)
  -- map('n', ']b', ':BufferLineMoveNext<CR>', opts)

  -- Move to previous/next
  map('n', '<a-,>', ':BufferPrevious<CR>', opts)
  map('n', '<a-.>', ':BufferNext<CR>', opts)
  map('n', '<c-,>', ':BufferPrevious<CR>', opts)
  map('n', '<c-.>', ':BufferNext<CR>', opts)

  map('v', '<a-,>', ':BufferPrevious<CR>', opts)
  map('v', '<a-.>', ':BufferNext<CR>', opts)
  map('v', '<c-,>', ':BufferPrevious<CR>', opts)
  map('v', '<c-.>', ':BufferNext<CR>', opts)

  -- Re-order to previous/next
  map('n', '<a-<>', ':BufferMovePrevious<CR>', opts)
  map('n', '<a->>', ':BufferMoveNext<CR>', opts)
  map('n', '<c-<>', ':BufferMovePrevious<CR>', opts)
  map('n', '<c->>', ':BufferMoveNext<CR>', opts)

  -- Close/Wipeout buffer commands
  map('n', '<leader>bd', ':BufferClose<CR>', opts)
  map('n', '<leader>bw', ':BufferWipeout<CR>', opts)
  map('n', '<leader>bda', ':BufferCloseAllButCurrent<CR>', opts)
  map('n', '<leader>bdh', ':BufferCloseBuffersLeft<CR>', opts)
  map('n', '<leader>bdl', ':BufferCloseBuffersRight<CR>', opts)
  -- map('n', '<c-w>', ':BufferClose<CR>', opts)
  map('n', '<c-s-w>', ':bdelete<CR>', opts)

  -- Magic buffer-picking mode
  map('n', '<leader>bp', ':BufferPick<CR>', opts)

  -- Sort automatically by...
  map('n', '<leader>bo', ':BufferOrderByDirectory<CR>', opts)
  map('n', '<leader>bl', ':BufferOrderByLanguage<CR>', opts)
end

table.insert(lvim.plugins, plugin)
