
-- Keymap --
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
opts = { silent = true }
-- map('n', '<a-,>', ':BufferLineCyclePrev<CR>', opts)
-- map('n', '<a-.>', ':BufferLineCycleNext<CR>', opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
-- map('n', '[b', ':BufferLineMovePrev<CR>', opts)
-- map('n', ']b', ':BufferLineMoveNext<CR>', opts)

-- Move to previous/next
map('n', '<a-,>', ':BufferPrevious<CR>', opts)
map('n', '<a-.>', ':BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<a-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<a->>', ':BufferMoveNext<CR>', opts)

-- Close/Wipeout buffer
map('n', '<leader>bd', ':BufferClose<CR>', opts)
map('n', '<leader>bw', ':BufferWipeout<CR>', opts)

-- Close commands
map('n', '<leader>ba', ':BufferCloseAllButCurrent<CR>', opts)
map('n', '<leader>bah', ':BufferCloseBuffersLeft<CR>', opts)
map('n', '<leader>bal', ':BufferCloseBuffersRight<CR>', opts)

-- Magic buffer-picking mode
map('n', '<leader>bap', ':BufferPick<CR>', opts)

-- Sort automatically by...
map('n', '<leader>bo', ':BufferOrderByDirectory<CR>', opts)
-- map('n', '<leader>bl', ':BufferOrderByLanguage<CR>', opts)
