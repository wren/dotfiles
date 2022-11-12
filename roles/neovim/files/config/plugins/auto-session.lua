-- Better session management
local plugin = { 'rmagatti/auto-session' }

plugin.keys = {
  '<leader>ss',
  '<leader>sr',
  '<leader>sd',
}
plugin.cmd = {
  'SaveSession',
  'RestoreSession',
  'DeleteSession',
}
-- plugin.event = 'CursorMoved'

plugin.config = function()
  require('auto-session').setup{
    log_level = "error",
    auto_session_root_dir = fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,

    -- auto-save, but not auto-restore
    auto_save_enabled = true,
    auto_restore_enabled = false,

    -- Dirs to ignore
    -- `auto_session_suppress_dirs` doesn't support wildcards
    -- very well, so we set below in events.lua instead:
    --    g.auto_session_enabled = false

    -- Hooks
    -- Can be added to config as: {hook_name}_cmds
    -- Available hooks:
    -- {pre_save}: executes before a session is saved
    -- {post_save}: executes after a session is saved
    -- {pre_restore}: executes before a session is restored
    -- {post_restore}: executes after a session is restored
    -- {pre_delete}: executes before a session is deleted
    -- {post_delete}: executes after a session is deleted
    pre_save_cmds = {
      "tabdo silent! SymbolsOutlineClose",
    }

  }

  -- Keymap
  -- local silent = { silent = true }
  -- map('n', '<leader>ss', ':SaveSession<CR>', silent)
  -- map('n', '<leader>sr', ':RestoreSession<CR>', silent)
  -- map('n', '<leader>sd', ':DeleteSession<CR>', silent)

  -- Which key --
  which_key_register_if_loaded({
    ['<leader>s'] = {
      name = 'Session',
      s = { ':SaveSession<cr>', 'Save Session'},
      r = { ':RestoreSession<cr>', 'Restore Session'},
      d = { ':DeleteSession<cr>', 'Delete Session'},
    }
  })
end

table.insert(lvim.plugins, plugin)
