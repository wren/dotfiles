-- Reuse the themes colors when possible
local material = require('material.colors')
local custom = {
  bg = '#141414',
  bg_inactive = '#212121',
  chrome = '#323232',
}

-- Config
g.material_style = 'darker'
require('material').setup({
  contrast = true,
  borders = false,
  contrast_windows = {
    "terminal",
    "packer",
    "qf",
    "nvim-tree",
  },
  text_contrast = {
    lighter = false,
    darker = true,
  },
  disable = {
    background = false,
    term_colors = false,
    eob_lines = true,
  },
  custom_highlights = {
    -- ExampleClass = { fg = '#fff', bg = '#fff', style = 'bold, sp = 'underline' },
    IndentlineOne     = { fg = '#2D3439', bg = nil },
    IndentlineTwo     = { fg = '#4F5B64', bg = nil },
    Normal            = { bg = custom.bg },
    NormalNC          = { bg = custom.bg_inactive },
    SignColumn        = { bg = nil },
    -- SignColumnNC      = { bg = custom.bg_inactive },
    VertSplit         = { fg = custom.chrome , bg = custom.chrome },
    SignifySignAdd    = { fg = material.green, bg = nil },
    SignifySignDelete = { fg = material.red, bg   = nil },
    SignifySignChange = { fg = material.blue, bg  = nil },
    SignifySignChangeDelete = { fg = material.orange, bg  = nil },

  -- Barbar styling (see https://github.com/romgrk/barbar.nvim#options)
    -- BufferCurrent =        { fg = '#ff0000', bg = '#00ff00' },
    -- BufferCurrentIndex =   { fg = '#ff0000', bg = '#00ff00' },
    -- BufferCurrentMod =     { fg = '#ff0000', bg = '#00ff00' },
    -- BufferCurrentSign =    { fg = '#ff0000', bg = '#00ff00' },
    -- BufferCurrentTarget =  { fg = '#ff0000', bg = '#00ff00' },
    -- BufferVisible =        { fg = '#ff0000', bg = '#00ff00' },
    -- BufferVisibleIndex =   { fg = '#ff0000', bg = '#00ff00' },
    -- BufferVisibleMod =     { fg = '#ff0000', bg = '#00ff00' },
    -- BufferVisibleSign =    { fg = '#ff0000', bg = '#00ff00' },
    -- BufferVisibleTarget =  { fg = '#ff0000', bg = '#00ff00' },
    -- BufferInactive =       { fg = '#ff0000', bg = '#00ff00' },
    -- BufferInactiveIndex =  { fg = '#ff0000', bg = '#00ff00' },
    -- BufferInactiveMod =    { fg = '#ff0000', bg = '#00ff00' },
    -- BufferInactiveSign =   { fg = '#ff0000', bg = '#00ff00' },
    -- BufferInactiveTarget = { fg = '#ff0000', bg = '#00ff00' },
    -- BufferTabpages =       { fg = '#ff0000', bg = '#00ff00' },
    -- BufferTabpageFill =    { fg = '#ff0000', bg = '#00ff00' },
  },
})

cmd 'colorscheme material'
