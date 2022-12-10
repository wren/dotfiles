-- Tree view of code in file
local plugin = { 'simrat39/symbols-outline.nvim' }

plugin.cmd = {
  'SymbolsOutline',
  'SymbolsOutlineOpen',
  'SymbolsOutlineClose',
}

plugin.setup = function()
  -- Keymap --
  -- local silent = { silent = true }
  -- map('n', '<localleader>s', ':SymbolsOutline<CR>', silent)

  which_key_register_if_loaded({
    ['<localleader>s'] = { ':SymbolsOutline<cr>', 'Symbols Toggle' }
  })
end

plugin.config = function()
-- Config
  require("symbols-outline").setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    -- width = 50,
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
      File          =  { icon = ""    , hl = "TSURI"         }  ,
      Module        =  { icon = ""    , hl = "TSNamespace"   }  ,
      Namespace     =  { icon = ""    , hl = "TSNamespace"   }  ,
      Package       =  { icon = ""    , hl = "TSNamespace"   }  ,
      Class         =  { icon = "𝓒"    , hl = "TSType"        }  ,
      Method        =  { icon = "ƒ"    , hl = "TSMethod"      }  ,
      Property      =  { icon = ""    , hl = "TSMethod"      }  ,
      Field         =  { icon = ""    , hl = "TSField"       }  ,
      Constructor   =  { icon = ""    , hl = "TSConstructor" }  ,
      Enum          =  { icon = "ℰ"    , hl = "TSType"        }  ,
      Interface     =  { icon = "ﰮ"    , hl = "TSType"        }  ,
      Function      =  { icon = ""    , hl = "TSFunction"    }  ,
      Variable      =  { icon = ""    , hl = "TSConstant"    }  ,
      Constant      =  { icon = ""    , hl = "TSConstant"    }  ,
      String        =  { icon = "𝓐"    , hl = "TSString"      }  ,
      Number        =  { icon = "#"    , hl = "TSNumber"      }  ,
      Boolean       =  { icon = "⊨"    , hl = "TSBoolean"     }  ,
      Array         =  { icon = ""    , hl = "TSConstant"    }  ,
      Object        =  { icon = "⦿"    , hl = "TSType"        }  ,
      Key           =  { icon = "🔐"   , hl = "TSType"        }  ,
      Null          =  { icon = "NULL" , hl = "TSType"        }  ,
      EnumMember    =  { icon = ""    , hl = "TSField"       }  ,
      Struct        =  { icon = "𝓢"    , hl = "TSType"        }  ,
      Event         =  { icon = "🗲"    , hl = "TSType"        }  ,
      Operator      =  { icon = "+"    , hl = "TSOperator"    }  ,
      TypeParameter =  { icon = "𝙏"    , hl = "TSParameter"   }  ,
    }
  })
end

table.insert(lvim.plugins, plugin)
