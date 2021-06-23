-- Config
g.material_style = "darker"
g.material_italic_comments = true
g.material_italic_keywords = true
g.material_italic_functions = true
g.material_italic_variables = false
g.material_contrast = true
g.material_borders = false
-- g.material_disable_background = true -- never enable this

g.material_custom_colors = {
  bg       = "#121212",
  bg_alt  = "#0F0F0F",
}

-- Small wrapper to make overrides look nicer
local function hi(name, my_colors)
  color_pairs = {}
  for key, color in pairs(my_colors) do
    table.insert(color_pairs, string.format('%s=%s', key, color))
  end
  return string.format('ColorScheme * highlight %s %s', name, table.concat(color_pairs, ' '))
end

nvim_create_augroup('colorextend', {
  hi('SignColumnNC', { guibg = '#212121' }),
  hi('NormalNC',      { guibg = '#212121' }),
  hi('IndentlineOne', { guifg = '#2D3439' }),
  hi('IndentlineTwo', { guifg = '#4F5B64' }),

  -- Barbar styling (see https://github.com/romgrk/barbar.nvim#options)
  -- hi('BufferCurrent',        { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferCurrentIndex',   { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferCurrentMod',     { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferCurrentSign',    { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferCurrentTarget',  { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferVisible',        { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferVisibleIndex',   { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferVisibleMod',     { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferVisibleSign',    { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferVisibleTarget',  { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferInactive',       { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferInactiveIndex',  { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferInactiveMod',    { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferInactiveSign',   { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferInactiveTarget', { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferTabpages',       { guifg = '#ff0000', guibg = '#00ff00' }),
  -- hi('BufferTabpageFill',    { guifg = '#ff0000', guibg = '#00ff00' }),
})

-- require'material'.set()
cmd 'colorscheme material'
