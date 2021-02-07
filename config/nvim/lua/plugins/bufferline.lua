-- Init --
require'bufferline'.setup{}
-- require'bufferline'.setup{
--   options = {
--     view = "multiwindow" | "default",
--     numbers = "none" | "ordinal" | "buffer_id",
--     number_style = "superscript" | "",
--     mappings = true | false,
--     buffer_close_icon= '',
--     modified_icon = '●',
--     close_icon = '',
--     left_trunc_marker = '',
--     right_trunc_marker = '',
--     max_name_length = 18,
--     max_prefix_length = 15, -- prefix used when a buffer is deduplicated
--     tab_size = 18,
--     diagnostics = false | "nvim_lsp"
--     diagnostics_indicator = function(count, level)
--       return "("..count..")"
--     end
--     show_buffer_close_icons = true | false,
--     persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--     -- can also be a table containing 2 custom separators
--     -- [focused and unfocused]. eg: { '|', '|' }
--     separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
--     enforce_regular_tabs = false | true,
--     always_show_bufferline = true | false,
--     sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
--       -- add custom logic
--       return buffer_a.modified > buffer_b.modified
--     end
--   }
-- }

-- Keymap --
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
opts = { silent = true }
map('n', '<a-,>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<a-.>', ':BufferLineCycleNext<CR>', opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '[b', ':BufferLineMovePrev<CR>', opts)
map('n', ']b', ':BufferLineMoveNext<CR>', opts)
