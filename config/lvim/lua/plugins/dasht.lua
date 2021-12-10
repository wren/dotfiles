-- Keymap --
-- Search given docset for words
map('n', '<Leader>K', ':call Dasht(dasht#cursor_search_terms())<Return>', { silent = true })
map('v', '<Leader>K', 'y:<C-U>call Dasht(getreg(0))<Return>', { silent = true })
-- Use K for show documentation in preview window
map('n', '<space>K', '<cmd>call <sid>show_documentation()<cr>')

-- Search all the docsets (not sure if this is ever useful)
-- nnoremap <Leader><Leader>K :call Dasht(dasht#cursor_search_terms(), '!')<Return>
-- vnoremap <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>
cmd [[
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call Dasht(dasht#cursor_search_terms())
  endif
endfunction
]]
