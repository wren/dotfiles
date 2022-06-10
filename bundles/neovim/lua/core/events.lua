lvim.autocommands = {

  -- Disable swap/undo/viminfo/shada files in temp directories or shm
  {
    {'BufNewFile', 'BufReadPre'},
    {
      pattern = {
        '/tmp/*',
        '$TMPDIR/*',
        '$TMP/*',
        '$TEMP/*',
        '*/shm/*',
        '/private/var/*',
        '*.noindex/*'
      },
      command = 'setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada='
    }
  },

  -- better autocomplete for commands
  {
    'CmdLineEnter',
    {
      pattern = ':',
      command = 'set nosmartcase'
    }
  },
  {
    'CmdLineLeave',
    {
      pattern = ':',
      command = 'set smartcase'
    }
  },

  -- change directory when a dir (not a file) is opened
  -- { 'BufEnter', pattern = {'*'}, command = 'lua cd_if_open_directory()' },
  {
    'BufEnter',
    {
      pattern = '*',
      callback = _G.cd_if_open_directory
    }
  },

  -- turn off cursorline when window isn't active
  -- see: https://vim.fandom.com/wiki/Highlight_current_line
  {
    {'VimEnter', 'WinEnter', 'BufWinEnter'},
    {
      pattern = '*',
      command = 'setlocal cursorline'
    }
  },
  {
    'WinLeave',
    {
      pattern = '*',
      command = 'setlocal nocursorline'
    },
  },

  -- Delete empty buffers when tabbing away from them
  -- { 'BufWinLeave', {pattern = {'*'}, command = 'silent lua delete_unused_buffer()' }},
  {
    'BufWinLeave',
    {
      pattern = '*',
      callback = _G.delete_unused_buffer
    }
  },

  -- set keymap for bindings that don't work on unmodifiable buffers (e.g. help)
  {
    {'BufReadPost', 'BufModifiedSet'},
    {
      pattern = '*',
      callback = function()
        if opt.modifiable:get() then
          map_buffer_group(_G.MODIFIABLE_ONLY_BINDINGS)
        end
      end
    }
  },

  -- get out of command mode by pressing <esc> in normal mode
  {
    'CmdwinEnter',
    {
      pattern = '*',
      command = 'map <buffer> <esc> <c-c><c-c>'
    }
  }
}
