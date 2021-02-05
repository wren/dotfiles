-- Keymap --
ss = { silent = true, noremap = false }
rr = { noremap = false }

map('n', 'sa', '<Plug>(operator-sandwich-add)', ss)
map('x', 'sa', '<Plug>(operator-sandwich-add)', ss)
map('o', 'sa', '<Plug>(operator-sandwich-g@)', ss)
map('n', 'sd', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', ss)
map('x', 'sd', '<Plug>(operator-sandwich-delete)', ss)
map('n', 'sr', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', ss)
map('x', 'sr', '<Plug>(operator-sandwich-replace)', ss)
map('n', 'sdb', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', ss)
map('n', 'srb', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', ss)

map('o', 'ib', '<Plug>(textobj-sandwich-auto-i)', rr)
map('x', 'ib', '<Plug>(textobj-sandwich-auto-i)', rr)
map('o', 'ab', '<Plug>(textobj-sandwich-auto-a)', rr)
map('x', 'ab', '<Plug>(textobj-sandwich-auto-a)', rr)
map('o', 'is', '<Plug>(textobj-sandwich-query-i)', rr)
map('x', 'is', '<Plug>(textobj-sandwich-query-i)', rr)
map('o', 'as', '<Plug>(textobj-sandwich-query-a)', rr)
map('x', 'as', '<Plug>(textobj-sandwich-query-a)', rr)
