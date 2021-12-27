-- A thing for when you open the other thing
local plugin = lvim.builtin.dashboard

-- disabled by default, so enable it
plugin.active = true

-- Set header
plugin.custom_header = {
    '                                                     ',
    '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
    '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
    '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
    '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
    '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
    '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
    '                                                     ',
}

-- Set menu
plugin.custom_section = {
  a = {
    description = { '  Find file           ' },
    command = 'Telescope git_files',
  },
  b = {
    description = { '  New file            ' },
    command = ":enew!",
  },
  c = {
    description = { '  Recent files        ' },
    command = 'Telescope oldfiles',
  },
  d = {
    description = { '  Restore session     ' },
    command = ':RestoreSession',
  },
  e = {
    description = { '  Settings            ' },
    command = ':e $MYVIMRC | :cd %:p:h | wincmd k | pwd',
  },
  f = {
    description = { '  Quit                ' },
    command = ':qa',
  },
}
