-- More operations for surrounding pairs of characters ("sandwiches")
local plugin = { 'machakann/vim-sandwich' }

plugin.event = 'CursorMoved'
plugin.config = function()
  -- The default mapping for sandwich (`s`) overrides a default binding, and
  -- that causes issues with some more obstinate plugins (i.e. vim-visual-multi),
  -- so this config mimics vim-surround for a more consistent experience.
  cmd 'runtime macros/sandwich/keymap/surround.vim'
end

table.insert(lvim.plugins, plugin)
