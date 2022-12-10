-- Changes some settings to make writing prose/notes
-- easier and nicer (ass opposed to writing code)
local plugin = { 'preservim/vim-pencil' }

plugin.ft = { 'jrnl' }

table.insert(lvim.plugins, plugin)


-- options
-- 0=disable, 1=one char, 2=hide char, 3=hide all (def)
g['pencil#conceallevel'] = 2

