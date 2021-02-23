
--- Colorscheme overrides ---
nvim_create_augroups({
  colorextend = {
    'ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "NONE" } })',
    'ColorScheme * call onedark#set_highlight("NormalNC", { "bg": { "gui": "#212121", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("NormalFloat", { "bg": { "gui": "#1a1a1a", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("VertSplit", { "bg": { "gui": "#1a1a1a", "cterm": 12 }, "fg": { "gui": "#1a1a1a", "cterm": 12 } })',
    -- @todo These cause a weird display bug in the statusline and I don't have time to fix it right now
    -- 'ColorScheme * call onedark#set_highlight("Statusline", { "fg": { "gui": "#1a1a1a", "cterm": 8 } })',
    -- 'ColorScheme * call onedark#set_highlight("StatuslineNC", { "fg": { "gui": "#1a1a1a", "cterm": 8 } })',
    'ColorScheme * call onedark#set_highlight("PMenu", { "bg": { "gui": "#1a1a1a", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("LspReferenceRead", { "bg": { "gui": "#626262", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("LspReferenceText", { "bg": { "gui": "#626262", "cterm": 12 } })',
    'ColorScheme * call onedark#set_highlight("LspReferenceWrite", { "bg": { "gui": "#626262", "cterm": 12 } })',
  }
})
