local nightfox = require('nightfox')
local custom = {
  bg = '#141414',
  bg_inactive = '#1C1C1C',
  chrome = '#323232',
}

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nightfox",
  transparent = true,
  alt_nc = custom.bg_inactive,
  styles = {
    -- Style that is applied to variables: see `highlight-args` for options
    comments = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  inverse = {
    match_paren = false, -- Enable/Disable inverse highlighting for match parens
    visual = false, -- Enable/Disable inverse highlighting for visual selection
    search = false, -- Enable/Disable inverse highlights for search highlights
  },
  colors = {},
  hlgroups = {
    -- ExampleClass = { fg = '#fff', bg = '#fff', style = 'bold, sp = 'underline' },
    IndentlineOne     = { fg = '#2D3439', bg = "NONE" },
    IndentlineTwo     = { fg = '#4F5B64', bg = "NONE" },
    -- Normal            = { bg = custom.bg },
    NormalNC          = { bg = custom.bg_inactive },
    SignColumn        = { bg = "NONE" },
    -- SignColumnNC      = { bg = custom.bg_inactive },
    VertSplit         = { fg = custom.chrome , bg = custom.chrome },
    SignifySignAdd    = { fg = "${green}", bg = "NONE" },
    SignifySignDelete = { fg = "${red}", bg   = "NONE" },
    SignifySignChange = { fg = "${blue}", bg  = "NONE" },
    SignifySignChangeDelete = { fg = "${orange}", bg  = "NONE" },
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()

