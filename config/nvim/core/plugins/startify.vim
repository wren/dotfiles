" For startify
let g:startify_padding_left = 45
let s:header = [
  \ '   _      _      _      _      _      _  ',
  \ '__(.)< __(.)> __(.)= __(.)< __(.)> __(.)=',
  \ '\___)  \___)  \___)  \___)  \___)  \___)  ',
  \ ]

let s:footer = [
      \ '+-------------------------------------------+',
      \ '|           Things go here                  |',
      \ '|                                           |',
      \ '+-------------------------------------------+',
      \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", 10 + g:startify_padding_left) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center(s:header)
let g:startify_custom_footer = s:center(s:footer)


let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

