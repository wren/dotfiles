--- Colorscheme ---

-- Enable 256 color terminal
set.t_Co = '256'
-- let &t_ut=''

-- Enable true color
if fn.has('termguicolors') == 1 then
  set.termguicolors = true
end

require 'plugins.colorscheme.onedark'
cmd 'colorscheme onedark'
