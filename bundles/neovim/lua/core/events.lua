lvim.autocommands.custom_groups = {

  -- Disable swap/undo/viminfo/shada files in temp directories or shm
  {
    'BufNewFile,BufReadPre',
    '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,*.noindex/*',
    'setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada='
  },

  -- better autocomplete for commands
  { 'CmdLineEnter', ':', 'set nosmartcase' },
  { 'CmdLineLeave', ':', 'set smartcase' },

  -- change directory when a dir (not a file) is opened
  { 'BufEnter', '*', 'lua cd_if_open_directory()' },

  -- turn off cursorline when window isn't active
  -- see: https://vim.fandom.com/wiki/Highlight_current_line
  { 'VimEnter,WinEnter,BufWinEnter', '*', 'setlocal cursorline'},
  { 'WinLeave', '*', 'setlocal nocursorline'  },

  -- put the cursor back on the last know position when opening a file
  {
    'BufReadPost',
    '*',
    [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif ]]
  },

  -- Delete empty buffers when tabbing away from them
  { 'BufWinLeave', '*', 'silent lua delete_unused_buffer()' },

  -- set keymap for bindings that don't work on unmodifiable buffers (e.g. help)
  {
    'BufReadPost,BufModifiedSet',
    '*',
    'lua if opt.modifiable:get() then map_buffer_group(_G.MODIFIABLE_ONLY_BINDINGS) end'
  },

  -- get out of command mode by pressing <esc> in normal mode
  { 'CmdwinEnter', '*', 'map <buffer> <esc> <c-c><c-c>' },
}
