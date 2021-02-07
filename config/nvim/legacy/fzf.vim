" @todo migrate to lua
function! FloatingFZF(...)
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')
  let width = get(a:, 1, 8)

  let height = float2nr(&lines/2)
  " let width = float2nr(&columns - (&columns * 2 / 10))
  let width = float2nr(&columns * width / 10)
  "let width = &columns
  let row = float2nr(&lines / 3)
  let col = float2nr((&columns - width) / 3)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height':height,
        \ }
  let win =  nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
endfunction

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = ' -m --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview "bat --color always --theme TwoDark {}"'

  let opts = fzf#wrap({})
  let opts.options .= l:fzf_files_options
  call fzf#run(opts)
endfunction

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'window': 'call FloatingFZF(4)'})
endfunction
