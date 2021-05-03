--- Colorscheme ---

-- Enable true color
if fn.has('termguicolors') == 1 then
  set.termguicolors = true
end

-- require 'plugins.colorscheme.onedark'
-- cmd 'colorscheme onedark'

require('material').set()
require 'plugins.colorscheme.material'
