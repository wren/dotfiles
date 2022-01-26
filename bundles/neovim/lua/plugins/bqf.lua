-- better quickfix window
local plugin = { 'kevinhwang91/nvim-bqf' }

plugin.event = { 'BufRead', 'BufNew' }
plugin.config = function()
  require('bqf').setup({
    auto_enable = true,
    preview = {
      win_height = 12,
      win_vheight = 12,
      delay_syntax = 80,
      border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
    },
    func_map = {
      vsplit = '',
      ptogglemode = 'z,',
      stoggleup = '',
    },
    filter = {
      fzf = {
        action_for = { ['ctrl-s'] = 'split' },
        extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' },
      },
    },
  })
end

table.insert(lvim.plugins, plugin)
