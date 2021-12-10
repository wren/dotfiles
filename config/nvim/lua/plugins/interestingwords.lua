
-- Settings --
g.interestingWordsDefaultMappings = 0
g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF' }
g.interestingWordsRandomiseColors = 1

-- Keymap --
map('n', '<localleader>*',     ':call InterestingWords("n")<cr>', {silent = true})
map('v', '<localleader>*',     ':call InterestingWords("v")<cr>', {silent = true})
map('n', '<localleader><c-L>', ':call UncolorAllWords()<cr>',     {silent = true})
map('n', '<localleader>n',     ':call WordNavigation(1)<cr>',     {silent = true})
map('n', '<localleader>N',     ':call WordNavigation(0)<cr>',     {silent = true})

-- Which key --
local status, wk = pcall(require, 'which-key')
if(status) then
  wk.register({
    ["<localleader>"] = {
      ['*'] = { 'Highlight <word>' },
      ['<c-L'] = { 'Clear highlighted words' },
      n = { 'Next highlighted word' },
      N = { 'Previous highlighted word' },
    }
  })
end

