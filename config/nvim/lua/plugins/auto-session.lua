require('auto-session').setup{
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,

  -- only save automatically
  auto_save_enabled = true,
  auto_restore_enabled = false,

  -- dirs to ignore
  -- auto_session_suppress_dirs = nil,

  -- Hooks
  -- Can be added to config as: {hook_name}_cmds
  -- Available hooks:
  -- {pre_save}: executes before a session is saved
  -- {post_save}: executes after a session is saved
  -- {pre_restore}: executes before a session is restored
  -- {post_restore}: executes after a session is restored
  -- {pre_delete}: executes before a session is deleted
  -- {post_delete}: executes after a session is deleted
  --pre_save_cmds = {
    --"tabdo SymbolsOutlineClose",
  --}
}

-- Keymap
map('n', '<leader>ss', ':SaveSession<CR>', silent)
map('n', '<leader>sr', ':RestoreSession<CR>', silent)
map('n', '<leader>sd', ':DeleteSession<CR>', silent)
