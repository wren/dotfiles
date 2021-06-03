-- Keymap --
opts = { silent = true }
map('n', '<C-d>', '<cmd>call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 0.5)<CR>', opts)
map('n', '<C-u>', '<cmd>call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -0.5)<CR>', opts)
