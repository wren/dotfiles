
-- Settings --
g.interestingWordsDefaultMappings = 0
g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF' }
g.interestingWordsRandomiseColors = 1

-- Keymap --
map('n', '<leader>*',     ':call InterestingWords("n")<cr>', {silent = true})
map('v', '<leader>*',     ':call InterestingWords("v")<cr>', {silent = true})
map('n', '<leader><c-L>', ':call UncolorAllWords()<cr>',     {silent = true})
map('n', '<leader>n',     ':call WordNavigation(1)',         {silent = true})
map('n', '<leader>N',     ':call WordNavigation(0)',         {silent = true})
