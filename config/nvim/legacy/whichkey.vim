
let g:which_key_use_floating_win = 0

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map =  {}
let g:which_key_map = {
  \ 'name' : '+Root ' ,
  \ '1' : 'which_key_ignore'      ,
  \ '2' : 'which_key_ignore'      ,
  \ '3' : 'which_key_ignore'      ,
  \ '4' : 'which_key_ignore'      ,
  \ '5' : 'which_key_ignore'      ,
  \ '6' : 'which_key_ignore'      ,
  \ '7' : 'which_key_ignore'      ,
  \ '8' : 'which_key_ignore'      ,
  \ '9' : 'which_key_ignore'      ,
  \ '0' : 'which_key_ignore'     ,
  \ '0-9': 'select window 1-10'  ,
  \ 'b' : {
    \ 'name' : 'buffer +',
    \ 'c' : 'keep current buffer',
    \ 'o' : 'kill {numbers or name} buffer',
    \ },
  \ 'e' : {
  \    'name' : '+explorer',
  \    'f' : 'find current file' ,
  \    'o' : 'open' ,
  \ },
  \ '-' : 'choose window by {prompt char}' ,
  \ 'f' : {
    \ 'name' : '+search {files cursorword word outline}',
    \ 'b' : 'find buffers',
    \ 'f' : 'find in project',
    \ 'c' : 'find commands',
    \ 'p' : 'find files in project',
    \ 'm' : 'find mappings',
    \ 'w' : 'find {word} in project',
    \ 'v' : 'find in vista outline',
    \ 'h' : {
    \   'name' : '+history',
    \   'f': 'file history',
    \   'c': 'command history',
    \   's': 'search history',
    \ },
    \ },
  \ 'l' : 'clear search highlights' ,
  \ 'm' : 'open mundotree' ,
  \ 'w' : 'write file',
  \ 'p' : 'edit pluginsconfig {filename}',
  \ 'g'  :{
    \'name'  : ' git +',
    \ 'd'    : 'Gdiff',
    \ 'c'    : 'Gcommit',
    \ 'b'    : 'Gblame',
    \ 'B'    : 'Gbrowse',
    \ 'S'    : 'Gstatus',
    \ 'p'    : 'git push',
    \ 'l'    : 'GitLogAll',
    \ 'h'    : 'GitBranch',
    \},
  \ 't' : {
    \ 'name' : '+tab-operate',
    \ 'n' : 'new tab',
    \ 'e' : 'edit tab',
    \ 'm' : 'move tab',
    \ },
  \ 'q' : 'quit window',
  \ '/' : 'comment/uncomment line',
  \ }

let g:which_key_map[' '] = {
  \ 'name' : '+easymotion-jumpto-word ' ,
  \ 'b' : ['<plug>(easymotion-b)' , 'beginning of word backward'],
  \ 'f' : ['<plug>(easymotion-f)' , 'find {char} to the left'],
  \ 'w' : ['<plug>(easymotion-w)' , 'beginning of word forward'],
  \ }

let g:which_key_localmap ={
  \ 'name'    : '+LocalLeaderKey'  ,
  \ 't'       : 'toggle markdown checkbox',
  \ 'v'       : 'open vista show outline',
  \ 's'       : 'show theme classes on cursor word',
  \ '<space>' : 'clear whitespace at end of lines',
  \ }

let g:which_key_rsbgmap = {
  \ 'name' : '+Next',
  \ 'a'    : 'ale nextwarp',
  \ 'c'    : 'next change',
  \ 'b'    : 'next buffer',
  \ 't'    : 'next tab',
  \ ']'    : 'jump prefunction-golang',
  \ }


let g:which_key_lsbgmap = {
  \ 'name' : '+Previous',
  \ 'a'    : 'ale prewarp',
  \ 'c'    : 'previous change',
  \ 'b'    : 'pre buffer',
  \ 't'    : 'previous tab',
  \ '['    : 'jump nextfunction-golang',
  \ }
