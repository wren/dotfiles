-- Keymap --
-- map('n', '<silent>gd',    '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- map('n', '<silent><c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- map('n', '<silent>K',     '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Config --
local lspconfig = require'lspconfig'
lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  { autostart = true }
)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }
  map('n', 'gD',    '<Cmd>lua vim.lsp.buf.declaration()<CR>',                                opts)
  map('n', 'gd',    '<Cmd>lua vim.lsp.buf.definition()<CR>',                                 opts)
  map('n', 'K',     '<Cmd>lua vim.lsp.buf.hover()<CR>',                                      opts)
  map('n', 'gi',    '<cmd>lua vim.lsp.buf.implementation()<CR>',                             opts)
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',                             opts)
  map('n', ';wa',   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       opts)
  map('n', ';wr',   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    opts)
  map('n', ';wl',   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  map('n', ';D',    '<cmd>lua vim.lsp.buf.type_definition()<CR>',                            opts)
  map('n', ';rn',   '<cmd>lua vim.lsp.buf.rename()<CR>',                                     opts)
  map('n', 'gr',    '<cmd>lua vim.lsp.buf.references()<CR>',                                 opts)
  map('n', '[d',    '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',                           opts)
  map('n', ']d',    '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',                           opts)
  map('n', ';ds',    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',               opts)
  map('n', ';dq',    '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',                         opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    map("n", ";f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    map("n", ";f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Show more severe icons first
    severity_sort = true,
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text only on Warning or above, override spacing to 2
    virtual_text = false,
    -- virtual_text = {
    --   spacing = 2,
    --   severity_limit = "Error",
    -- },
    update_in_insert = true,
  }
)

-- config that activates keymaps and enables snippet support
function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

return { make_config = make_config }
