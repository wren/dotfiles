
function chad_open()
  cmd('CHADopen ' .. fn.expand('%:p'))
end

map('n', '<leader>eo', ':CHADopen<cr>', {silent = true})
map('n', '<leader>ef', ':luado chad_open()<cr>', {silent = true})
-- nnoremap <silent><C-\> :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
-- nnoremap <silent> <Leader>eo :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
-- nnoremap <silent> <Leader>ef :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>

