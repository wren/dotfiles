-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.line_wrap_cursor_movement = true
lvim.format_on_save = false

lvim.lsp.automatic_configuration.skipped_filetypes = {"rst", "plaintext" }
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "ruff_lsp"
end, lvim.lsp.automatic_configuration.skipped_servers)
merge(lvim.builtin.breadcrumbs.winbar_filetype_exclude, { 'jrnl' })
