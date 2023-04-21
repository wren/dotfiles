-- Syntax highlighting for jrnl files
local plugin = { 'lambdalisue/suda.vim' }

plugin.cmd = {
  'SudaRead',
  'SudaWrite',
}

table.insert(lvim.plugins, plugin)
