VIM_PATH = vim.call('expand', '<sfile>:p:h')
vim.cmd(string.format('luafile %s/core/init.lua', VIM_PATH))
