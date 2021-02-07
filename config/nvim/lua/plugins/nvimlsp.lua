-- Init --
require'lspconfig'.tsserver.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.bashls.setup{}

-- Keymap --
map('n', '<silent>gd',    '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', '<silent><c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<silent>K',     '<cmd>lua vim.lsp.buf.hover()<CR>')
