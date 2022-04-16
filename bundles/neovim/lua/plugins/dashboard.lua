-- A thing for when you open the other thing
local plugin = lvim.builtin.alpha.dashboard

-- disabled by default, so enable it
plugin.active = true

-- Set header
plugin.section.header.val = {
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
plugin.section.buttons.entries = {
  { "p", "  Find project file", ":Telescope git_files<CR>" },
  { "e", "  New file", ":ene <BAR> startinsert<CR>" },
  { "r", "  Recent files", "Telescope oldfiles<CR>" },
  { "s", "  Restore session", ":RestoreSession<CR>" },
  { ",", "  Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>" },
  { "q", "  Quit", ":qa<CR>" },
}
