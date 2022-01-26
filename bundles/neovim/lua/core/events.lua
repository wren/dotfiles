lvim.autocommands.custom_groups = {

  -- Disable swap/undo/viminfo/shada files in temp directories or shm
  {
    'BufNewFile,BufReadPre',
    '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,*.noindex/*',
    'setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada='
  },

  -- better autocomplete for commands
  {
    'CmdLineEnter : set nosmartcase',
    'CmdLineLeave : set smartcase'
  },

  -- change directory when a dir (not a file) is opened
  { 'BufEnter * lua cd_if_open_directory()' },

  -- turn off cursorline when window isn't active
  {
    'WinEnter,InsertLeave * set cursorline',
    'WinLeave,InsertEnter * set nocursorline'
  },

  -- put the cursor back on the last know position when opening a file
  {
    [[ BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif ]]
  },

  -- set keymap for bindings that don't work on unmodifiable buffers (e.g. help)
  -- modifiable_only_keymap = {
  --   'BufReadPost,BufModifiedSet * lua if opt.modifiable:get() then keymap_modifiable_only() end'
  -- },

  {
    'BufWinLeave * silent lua delete_unused_buffer()'
  },
}
