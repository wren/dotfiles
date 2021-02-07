
-- Settings --
g.interestingWordsDefaultMappings = 0
g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF' }
g.interestingWordsRandomiseColors = 1

-- Keymap --
map('n', '<leader>*',     '<cmd>call InterestingWords("n")<cr>', {silent = true})
map('v', '<leader>*',     '<cmd>call InterestingWords("v")<cr>', {silent = true})
map('n', '<leader><c-L>', '<cdm>call UncolorAllWords()<cr>',     {silent = true})
map('n', '<leader>n',     '<cdm>call WordNavigation(1)<cr>',     {silent = true})
map('n', '<leader>N',     '<cdm>call WordNavigation(0)<cr>',     {silent = true})
