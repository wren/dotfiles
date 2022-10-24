-- Highlights custom words on the fly independent of search
local plugin = { 'lfv89/vim-interestingwords' }

plugin.keys = {
  '<localleader>*',
  '<localleader><c-L>',
  '<localleader>n',
  '<localleader>N',
}
plugin.config = function()
  -- Settings --
  g.interestingWordsDefaultMappings = 0
  g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF' }
  g.interestingWordsRandomiseColors = 1
end

-- Keymap --
local opts = { silent = true }
map('n', '<localleader>w*',     ':call InterestingWords("n")<cr>', opts)
map('v', '<localleader>w*',     ':call InterestingWords("v")<cr>', opts)
map('n', '<localleader>w<c-l>', ':call UncolorAllWords()<cr>',     opts)
map('n', '<localleader>wn',     ':call WordNavigation(1)<cr>',     opts)
map('n', '<localleader>wN',     ':call WordNavigation(0)<cr>',     opts)

-- Which key --
which_key_register_if_loaded({
  ["<localleader>w"] = {
    name = "Interesting Words",
    ['*'] = { 'Highlight <word>' },
    ['<c-l>'] = { 'Clear highlighted words' },
    n = { 'Next highlighted word' },
    N = { 'Previous highlighted word' },
  }
})

table.insert(lvim.plugins, plugin)
