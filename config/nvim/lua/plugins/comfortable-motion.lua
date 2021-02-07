-- Keymap --
opts = { silent = true }
map('n', '<C-d>', '<cmd>call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>', opts)
map('n', '<C-u>', '<cmd>call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>', opts)
-- map('n', '<ScrollWheelDown>', '<cmd>call comfortable_motion#flick(40)<CR>', opts)
-- map('n', '<ScrollWheelUp>',   '<cmd>call comfortable_motion#flick(-40)<CR>', opts)
map('n', '<C-A-J>', '<cmd>call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>', opts)
map('n', '<C-A-K>', '<cmd>call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>', opts)
