local nightfox = require('nightfox')
local none = 'NONE'
local custom = {
  grey_darkest = '#141414',
  grey_dark = '#212121',
  -- chrome = '#323232',
  grey_mid = '#2D3439',
  grey_light = '#4F5B64',
}

nightfox.setup({
  fox = 'nightfox',
  transparent = false,
  alt_nc = custom.bg_inactive,
  styles = {
    -- Style that is applied to variables: see `highlight-args` for options
    comments = none,
    functions = none,
    keywords = none,
    strings = none,
    variables = none,
  },
  inverse = {
    match_paren = false, -- Enable/Disable inverse highlighting for match parens
    visual = false, -- Enable/Disable inverse highlighting for visual selection
    search = false, -- Enable/Disable inverse highlights for search highlights
  },
  colors = {
    -- To see defaults run:
    --   :Bufferize lua print(vim.inspect(require('nightfox.colors').load()))`
    bg = custom.grey_darkest,
    bg_alt = custom.grey_dark,
    bg_sidebar = custom.grey_dark,
  },
  hlgroups = {
    -- ExampleClass = { fg = '#fff', bg = '#fff', style = 'bold, sp = 'underline' },
    IndentlineOne     = { fg = custom.grey_mid,   bg =  none },
    IndentlineTwo     = { fg = custom.grey_light, bg =  none },
    Normal            = { bg = none },
    -- NormalNC          = { bg = custom.bg_inactive },
    SignColumn        = { bg = none },
    -- SignColumnNC      = { bg = custom.bg_inactive },
    -- VertSplit         = { fg = custom.chrome , bg = custom.chrome },
    SignifySignAdd    = { fg = '${green}', bg = 'NONE' },
    SignifySignDelete = { fg = '${red}', bg   = 'NONE' },
    SignifySignChange = { fg = '${blue}', bg  = 'NONE' },
    SignifySignChangeDelete = { fg = '${orange}', bg  = 'NONE' },
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()

