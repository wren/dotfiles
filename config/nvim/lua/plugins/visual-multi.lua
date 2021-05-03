-- @todo This still has some trouble with consistent word objects (e.g w or W).
-- It seems like it sometimes uses the wordmotion plugin's object, and
-- sometimes the built-in in vim one. Maybe file an issue?

-- Keymap
g.VM_leader = '<leader>m'

g.VM_default_mappings = 1
g.VM_mouse_mappings = 1
g.VM_exit_on_1_cursor_left = 1

local function with_leader(binding)
  return string.format('%s%s', g.VM_leader, binding)
end
-- This erases all maps if done in lua for some reason
cmd [[ let g:VM_maps = {} ]]
g.VM_maps = {
  ['Add Cursor Down'] = '<C-M-J>',
  ['Add Cursor Up'] = '<C-M-K>',
  ['Reselect Last'] = with_leader('h'),
  ['Select All'] = with_leader('*'),
}


g.VM_custom_noremaps = {
  ['=='] = '==',
  ['<<'] = '<<',
  ['>>'] = '>>',
}

g.VM_custom_motions = {
  H = '^',
  L = '$',
}

g.VM_user_operators = {
  'gc',
}
