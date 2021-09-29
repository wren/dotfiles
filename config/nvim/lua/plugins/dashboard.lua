local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Set header
dashboard.section.header.val = {
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
dashboard.section.buttons.val = {
    dashboard.button( 'e', '  New file' , ':ene <BAR> startinsert <CR>'),
    dashboard.button( 'f', '  Find file in project', ':Files<CR>'),
    dashboard.button( 'r', '  Recent files'   , ':History<CR>'),
    dashboard.button( 's', '  Restore session'   , ':RestoreSession<CR>'),
    dashboard.button( ',', '  Settings' , ':e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>'),
    dashboard.button( 'q', '  Quit', ':qa<CR>'),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd('autocmd FileType alpha setlocal nofoldenable')

