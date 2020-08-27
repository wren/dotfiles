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
  \ 'a' : {
    \ 'name' : '+coc-code-action',
    \ 'c' : 'code action',
    \ },
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
  \ 'd' : 'search cursor word on Dash.app' ,
  \ 'G' : 'distraction free writing' ,
  \ 'f' : {
    \ 'name' : '+search {files cursorword word outline}',
    \ 'b' : 'find buffers',
    \ 'f' : 'find {word} under cursor',
    \ 'c' : 'find commands',
    \ 'p' : 'find files in project',
    \ 'm' : 'find mappings',
    \ 'w' : 'search cursorword',
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
  \ 's' : {
    \ 'name' : '+SimpleNote ',
    \ 'n'    : 'New',
    \ 'l'    : 'List',
    \ 'd'    : 'Delete',
    \ 't'    : 'Tag',
    \ 'u'    : 'Update',
    \ 'p'    : 'Pin',
    \ 'P'    : 'Unpin',
    \ 'V'    : 'VersionInfo',
    \ 'v'    : 'Version',
    \ },
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
  \ 'c'    : {
    \ 'name' : '+coc list' ,
    \ 'a'    : 'coc CodeActionSelected',
    \ 'd'    : 'coc Diagnostics',
    \ 'c'    : 'coc Commands',
    \ 'e'    : 'coc Extensions',
    \ 'j'    : 'coc Next',
    \ 'k'    : 'coc Prev',
    \ 'o'    : 'coc OutLine',
    \ 'r'    : 'coc Resume',
    \ 'n'    : 'coc Rename',
    \ 's'    : 'coc Isymbols',
    \ 'g'    : 'coc Gitstatus',
    \ 'f'    : 'coc Format',
    \ 'm'    : 'coc search word to multiple cursors',
    \ },
  \ 'q' : {
    \ 'name' : '+coc-quickfix',
    \ 'f' : 'coc fixcurrent',
    \ },
  \ 't' : {
    \ 'name' : '+tab-operate',
    \ 'n' : 'new tab',
    \ 'e' : 'edit tab',
    \ 'm' : 'move tab',
    \ },
  \ }

let g:which_key_map[' '] = {
  \ 'name' : '+easymotion-jumpto-word ' ,
  \ 'b' : ['<plug>(easymotion-b)' , 'beginning of word backward'],
  \ 'f' : ['<plug>(easymotion-f)' , 'find {char} to the left'],
  \ 'w' : ['<plug>(easymotion-w)' , 'beginning of word forward'],
  \ }

let g:which_key_localmap ={
  \ 'name' : '+LocalLeaderKey'  ,
  \ 't'    : 'open tagbar show outlien',
  \ 'v'    : 'open vista show outline',
  \ 'r'    : 'quick run',
  \ 'm'    : 'toolkit Menu',
  \ 'g' : {
    \ 'name' : '+golang-toolkit',
    \ 'i'    : 'go impl',
    \ 'd'    : 'go describe',
    \ 'c'    : 'go callees',
    \ 'C'    : 'go callers',
    \ 's'    : 'go callstack',
    \ },
  \ }

let g:which_key_rsbgmap = {
  \ 'name' : '+Next',
  \ 'a'    : 'ale nextwarp',
  \ 'c'    : 'next change',
  \ 'b'    : 'next buffer',
  \ 'g'    : 'coc gitnextchunk',
  \ 't'    : 'next tab',
  \ ']'    : 'jump prefunction-golang',
  \ }


let g:which_key_lsbgmap = {
  \ 'name' : '+Previous',
  \ 'a'    : 'ale prewarp',
  \ 'c'    : 'previous change',
  \ 'b'    : 'pre buffer',
  \ 'g'    : 'coc gitprevchunk',
  \ 't'    : 'previous tab',
  \ '['    : 'jump nextfunction-golang',
  \ }

