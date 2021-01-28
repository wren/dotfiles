local myfile = vim.call('fnamemodify', vim.call('expand', '<sfile>'), ':h')
vim.cmd('source ' .. myfile .. '/core/init.vim')
