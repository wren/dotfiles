
nvim_create_augroups({

  -- Disable swap/undo/viminfo/shada files in temp directories or shm
  disable_temp_meta = {
    {
      'BufNewFile,BufReadPre',
      '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*',
      'setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada='
    }
  },

  -- better autocomplete for commands
  dynamic_smartcase = {
    'CmdLineEnter : set nosmartcase',
    'CmdLineLeave : set smartcase'
  },

  -- change directory when a dir (not a file) is opened
  cd_if_directory = { 'BufEnter * lua cd_if_open_directory()' },

  -- turn off cursorline when window isn't active
  cursorline_on_active = {
    'WinEnter,InsertLeave * set cursorline',
    'WinLeave,InsertEnter * set nocursorline'
  },

  -- put the cursor back on the last know position when opening a file
  last_known_cursor_position = {
    [[ BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif ]]
  },

  -- set keymap for bindings that don't work on unmodifiable buffers (e.g. help)
  modifiable_only_keymap = {
    'BufReadPost,BufModifiedSet * lua if vim.bo.modifiable then keymap_modifiable_only() end'
  },

  -- better syntax highlight performance with large files
  -- syntax_many_lines = {
  --   [[Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif]]
  -- },

  delete_empty_buffers = {
    'BufWinLeave * silent lua delete_unused_buffer()'
  },
})
