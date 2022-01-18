
-- Takes any command and puts the output into a buffer
local plugin = { 'dkarter/bullets.vim' }

plugin.ft ={ 'jrnl', 'markdown' }
g.bullets_enabled_file_types = {
  'markdown',
  'text',
  'gitcommit',
  'scratch',
  'jrnl',
}

g.bullets_checkbox_markers = ' .oOx'

table.insert(lvim.plugins, plugin)
