
--- Colorscheme overrides ---
nvim_create_augroups({
  colorextend = {
    'ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "NONE" } })',
    'ColorScheme * call onedark#set_highlight("NormalNC", { "bg": { "gui": "#212121", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("NormalFloat", { "bg": { "gui": "#1a1a1a", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("PMenu", { "bg": { "gui": "#1a1a1a", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("LspReferenceRead", { "bg": { "gui": "#626262", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("LspReferenceText", { "bg": { "gui": "#626262", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("LspReferenceWrite", { "bg": { "gui": "#626262", "cterm": 12 } })',
  }
})
