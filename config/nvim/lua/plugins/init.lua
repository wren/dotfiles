
-- Bootstrap plugin manager
cmd('set rtp+=' .. fn.stdpath('data') .. '/packer')
local packer_directory = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(packer_directory)) > 0 then
  print('Downloading and installing plugins...')
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

-- Events
-- vim.cmd [[ autocmd BufWritePost */install.lua PackerCompile ]]

