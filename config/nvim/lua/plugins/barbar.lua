-- Config --
g.bufferline = {
  -- Enable animations
  animation = true,

  -- Enable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable close button
  closable = true,

  -- Enables mouse support
  --   left-click: go to buffer
  --   middle-click: delete buffer
  clickable = true,

  -- Enable icons (true|'numbers'|'both')
  icons = true,

  -- Sets the icon's highlight group (or false for devicons default color)
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',

  -- Sets the maximum padding width with which to surround each tab.
  maximum_padding = 5,

  -- Sets the maximum buffer name length.
  maximum_length = 32,
}

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

map('n', '<c-x>', ':BufferClose<CR>', opts)
map('n', '<c-s-x>', ':bdelete<CR>', opts)

-- Close commands
map('n', '<leader>ba', ':BufferCloseAllButCurrent<CR>', opts)
map('n', '<leader>bah', ':BufferCloseBuffersLeft<CR>', opts)
map('n', '<leader>bal', ':BufferCloseBuffersRight<CR>', opts)

-- Magic buffer-picking mode
map('n', '<leader>bap', ':BufferPick<CR>', opts)

-- Sort automatically by...
map('n', '<leader>bo', ':BufferOrderByDirectory<CR>', opts)
-- map('n', '<leader>bl', ':BufferOrderByLanguage<CR>', opts)
