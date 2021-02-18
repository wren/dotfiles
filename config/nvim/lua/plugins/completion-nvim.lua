cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

g.completion_enable_auto_popup = 1

-- Set completeopt to have a better completion experience
set.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing message extra message when using completion
cmd 'set shortmess+=c'

local opts = { noremap = false }
map('i', '<tab>', '<Plug>(completion_smart_tab)', opts)
map('i', '<s-tab>', '<Plug>(completion_smart_s_tab)', opts)

