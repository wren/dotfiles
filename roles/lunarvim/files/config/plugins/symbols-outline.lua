-- Tree view of code in file
local plugin = { 'simrat39/symbols-outline.nvim' }

plugin.cmd = {
  'SymbolsOutline',
  'SymbolsOutlineOpen',
  'SymbolsOutlineClose',
}

plugin.init = function()
  -- Keymap --
  which_key_register_if_loaded({
    ['<localleader>s'] = { ':SymbolsOutline<cr>', 'Symbols Toggle' }
  })
end

plugin.config = function()
-- Config
  require("symbols-outline").setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    width = 32,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = "<leader>q",
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<s-k>",
      rename_symbol = "r",
      code_actions = "a",
      toggle_preview = "<s-q>",
      fold = "h",
      unfold = "l",
      fold_all = "W",
      unfold_all = "E",
      fold_reset = "R",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
      File = {hl = "@text.uri" },
      Module = {hl = "@namespace" },
      Namespace = {hl = "@namespace" },
      Package = {hl = "@namespace" },
      Class = {hl = "@type" },
      Method = {hl = "@method" },
      Property = {hl = "@method" },
      Field = {hl = "@field" },
      Constructor = {hl = "@constructor" },
      Enum = {hl = "@type" },
      Interface = {hl = "@type" },
      Function = {hl = "@function" },
      Variable = {hl = "@constant" },
      Constant = {hl = "@constant" },
      String = {hl = "@string" },
      Number = {hl = "@number" },
      Boolean = {hl = "@boolean" },
      Array = {hl = "@constant" },
      Object = {hl = "@type" },
      Key = {hl = "@type" },
      Null = {hl = "@type" },
      EnumMember = {hl = "@field" },
      Struct = {hl = "@type" },
      Event = {hl = "@type" },
      Operator = {hl = "@operator" },
      TypeParameter = {hl = "@parameter" },
    },
  })
end

table.insert(lvim.plugins, plugin)
