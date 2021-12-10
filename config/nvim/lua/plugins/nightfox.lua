local nightfox = require('nightfox')
local none = 'NONE'
local custom = {
  grey_darkest = '#16181d',
  -- grey_dark = '#21242a',
  grey_dark = '#1D2025',
  grey_mid = '#2D3439',
  grey_light = '#363B46',
  grey_lightest = '#4F5B64',
  -- '#3F4552'

  -- chrome = '#323232',
}

nightfox.setup({
  fox = 'nightfox',
  transparent = false,
  alt_nc = true,
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
    --   :Bufferize lua print(vim.inspect(require('nightfox.colors').load()))
    bg = custom.grey_darkest,
    bg_alt = custom.grey_dark,
    bg_sidebar = custom.grey_darkest,
    bg_statusline = custom.grey_mid,
 
    blue = '#8CCBEA',
    green = '#A4E57E',
    yellow = '#FFDB72',
    red = '#FF7272',
    pink = '#FFB3FF',
    magenta = '#9999FF',

    -- border = custom.grey_mid,
    border = custom.grey_dark,
    border_highlight = custom.grey_lightest, -- floating windows, etc
    bg_highlight = custom.grey_dark,

    -- bg_float = custom.grey_dark,
    -- bg_float = "#131A24",
    -- bg_popup = "#131A24",
    -- bg_search = "#2F5660",   require'bufferline.state'.set_offset(31, 'FileTree')

  },
  hlgroups = {
    -- ExampleClass = { fg = '#fff', bg = '#fff', style = 'bold, sp = 'underline' },
    IndentlineOne     = { fg = custom.grey_mid,   bg =  none },
    IndentlineTwo     = { fg = custom.grey_light, bg =  none },
    Normal            = { bg = none },
    SignColumn        = { bg = none },
    -- SignColumnNC      = { bg = custom.bg_inactive },
    VertSplit         = { fg = custom.grey_mid , bg = custom.grey_mid },
    SignifySignAdd    = { fg = '${green}', bg = 'NONE' },
    SignifySignDelete = { fg = '${red}', bg   = 'NONE' },
    SignifySignChange = { fg = '${blue}', bg  = 'NONE' },
    SignifySignChangeDelete = { fg = '${orange}', bg  = 'NONE' },
    LualineFilenameInactive = { fg = custom.grey_dark, bg = custom.grey_mid },
    -- WhichKey
    -- WhichKeyGroup
    -- WhichKeySeparator
    -- WhichKeyDesc = {},
    WhichKeyFloat =  { bg = custom.grey_mid } ,
    VM_Mono       =  { bg = custom.butt, fg = custom.butt } ,
    VM_Cursor     =  { bg = custom.butt, fg = custom.butt } ,
    VM_Extend     =  { bg = custom.butt, fg = custom.butt } ,
    VM_Insert     =  { bg = custom.butt, fg = custom.butt } ,
    MultiCursor   =  { bg = custom.butt, fg = custom.butt } ,

    -- WhichKeyValue
    -- MsgArea           = { bg = custom.grey_mid },
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
