
-- Bootstrap plugin manager
local packer_status, lfs = pcall(require, 'packer_compiled')

if(not packer_status) then
  print('Downloading and installing plugins...')

  local packer_directory = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

  fn.mkdir(packer_directory, 'p')
  local out = fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    packer_directory
  })

  -- manually call packer this time (it later manages itself)
  cmd 'packadd packer.nvim'
  local packer = require'plugins.packer'
  packer.sync()
end

