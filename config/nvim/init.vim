" Here for backward compatiblity with nvim < 0.5
" Should be removed soon after 0.5 is released
execute 'luafile' fnamemodify(expand('<sfile>'), ':h').'/init.lua'
