
--- Colorscheme overrides ---
nvim_create_augroups({
  colorextend = {
    'ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "NONE" } })',
    'ColorScheme * call onedark#set_highlight("NormalNC", { "bg": { "gui": "#212121", "cterm": 12 } })',
  }
})
