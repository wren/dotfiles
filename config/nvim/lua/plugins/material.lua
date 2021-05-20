-- Config
vim.g.material_style = "darker"
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = true


-- Small wrapper to make this look nicer
local function hi(name, my_colors)
  color_pairs = {}
  for key, color in pairs(my_colors) do
    table.insert(color_pairs, string.format('%s=%s', key, color))
  end
  return string.format('ColorScheme * highlight %s %s', name, table.concat(color_pairs, ' '))
end

nvim_create_augroup('colorextend', {
  -- hi('Normal', { guibg = '#ff0000' }),
  -- hi('NormalNC' , { guibg = '#181B25' }),
  hi('NormalNC' , { guibg = '#212121' }),
  hi('IndentlineOne', { guifg = '#2D3439' })  ,
  hi('IndentlineTwo', { guifg = '#4F5B64' })  ,
})
