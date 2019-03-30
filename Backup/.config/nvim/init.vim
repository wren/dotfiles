
call plug#begin()

try
  source ~/.config/nvim/configs/plugins_install.vim
catch
endtry

call plug#end()

source ~/.config/nvim/configs/basic.vim
source ~/.config/nvim/configs/plugins_settings.vim
