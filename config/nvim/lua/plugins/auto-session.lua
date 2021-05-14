require('auto-session').setup{
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  -- auto_save_enabled = true, -- enable just save
  -- auto_restore_enabled = true, -- enable just restore
  -- auto_session_suppress_dirs = nil, -- directories to ignore

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
    "tabdo NERDTreeClose",
    "tabdo SymbolsOutlineClose",
  }
}

-- Keymap
map('n', '<leader>ss', ':SaveSession<CR>', silent)
map('n', '<leader>sr', ':RestoreSession<CR>', silent)
map('n', '<leader>sd', ':DeleteSession<CR>', silent)
