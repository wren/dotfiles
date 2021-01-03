let g:interestingWordsDefaultMappings = 0
nnoremap <silent> <leader>* :call InterestingWords('n')<cr>
vnoremap <silent> <leader>* :call InterestingWords('v')<cr>
nnoremap <silent> <leader><c-L> :call UncolorAllWords()<cr>
nnoremap <silent> <leader>n :call WordNavigation(1)<cr>
nnoremap <silent> <leader>N :call WordNavigation(0)<cr>
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsRandomiseColors = 1
