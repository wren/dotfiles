"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Notes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if $my_hostname == "rover"
  let g:notes_directories = ['~/Sync/Notes/Rover']
else
  let g:notes_directories = ['~/Sync/Notes/Personal', '~/Sync/Notes/Rover']
endif
let g:notes_smart_quotes = 0
