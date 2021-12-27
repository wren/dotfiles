-- Status markers in gutter, and some other git stuff
local plugin = lvim.builtin.gitsigns.opts

plugin.watch_gitdir.follow_files = true
plugin.current_line_blame = true -- Toggle with `:Gitsigns toggle_current_line_blame`
plugin.current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
  delay = 250,
}
plugin.current_line_blame_formatter_opts = {
  relative_time = false
}

-- @todo what does this do?
-- preview_config = {
--   -- Options passed to nvim_open_win
--   border = 'single',
--   style = 'minimal',
--   relative = 'cursor',
--   row = 0,
--   col = 1
-- },
