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
    dashboard.button( 'e', '  New file' , ':enew<CR>'),
    dashboard.button( 'p', '  Find file in project', ':Telescope git_files<CR>'),
    dashboard.button( 'r', '  Recent files'   , ':Telescope oldfiles<CR>'),
    dashboard.button( 's', '  Restore session'   , ':silent! RestoreSession<CR>'),
    dashboard.button( ',', '  Settings' , ':e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>'),
    dashboard.button( 'q', '  Quit', ':qa<CR>'),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd('autocmd FileType alpha setlocal nofoldenable')

