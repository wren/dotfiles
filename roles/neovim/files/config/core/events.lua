
-- Disable swap/undo/viminfo/shada files in temp directories or shm
create_autocmd(
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
    callback = function()
      cmd('setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=')
      g.auto_session_enabled = false
    end
  }
)

  -- better autocomplete for commands
create_autocmd(
  'CmdLineEnter',
  {
    pattern = ':',
    command = 'set nosmartcase'
  }
)

create_autocmd(
  'CmdLineLeave',
  {
    pattern = ':',
    command = 'set smartcase'
  }
)

create_autocmd(
  'BufEnter',
  {
    pattern = '*',
    callback = _G.cd_if_open_directory
  }
)

-- turn off cursorline when window isn't active
-- see: https://vim.fandom.com/wiki/Highlight_current_line
create_autocmd(
  {'VimEnter', 'WinEnter', 'BufWinEnter'},
  {
    pattern = '*',
    command = 'setlocal cursorline'
  }
)

create_autocmd(
  'WinLeave',
  {
    pattern = '*',
    command = 'setlocal nocursorline'
  }
)

-- Delete empty buffers when tabbing away from them
-- { 'BufWinLeave', {pattern = {'*'}, command = 'silent lua delete_unused_buffer()' }},
create_autocmd(
  'BufWinLeave',
  {
    pattern = '*',
    callback = _G.delete_unused_buffer
  }
)

-- set keymap for bindings that don't work on unmodifiable buffers (e.g. help)
create_autocmd(
  {'BufReadPost', 'BufModifiedSet'},
  {
    pattern = '*',
    callback = function()
      if opt.modifiable:get() then
        map_buffer_group(_G.MODIFIABLE_ONLY_BINDINGS)
      end
    end
  }
)

-- get out of command mode by pressing <esc> in normal mode
create_autocmd(
  'CmdwinEnter',
  {
    pattern = '*',
    command = 'map <buffer> <esc> <c-c><c-c>'
  }
)
