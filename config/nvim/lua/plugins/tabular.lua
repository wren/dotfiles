-- Keymap --
map('i', '<localleader><Bar>', '<Bar><Esc>:call <SID>align()<CR>a')

-- @todo migrate to lua
-- Calls tabularize whenever a pipe char (|) is typed in normal mode
-- from: https://gist.github.com/tpope/287147
map('i', '<Bar>', '<Bar><Esc>:call <SID>align()<CR>a', { silent = true })
cmd [[
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
]]
