
function color_scheme(method, highlight, placement, color)
  return string.format('ColorScheme * call onedark#%s_highlight("%s", { "%s": { "gui": "%s", "cterm": 12 } })', method, highlight, placement, color)
end

--- Colorscheme overrides ---
nvim_create_augroups({
  colorextend = {
    color_scheme ( 'extend' , 'Normal'                        , 'bg' , 'NONE'    )  ,
    color_scheme ( 'set'    , 'NormalNC'                      , 'bg' , '#1c1c1c' )  ,
    color_scheme ( 'set'    , 'NormalFloat'                   , 'bg' , '#1a1a1a' )  ,
    color_scheme ( 'set'    , 'VertSplit'                     , 'bg' , '#1a1a1a' )  ,
    color_scheme ( 'set'    , 'Statusline'                    , 'bg' , '#353644' )  ,
    color_scheme ( 'set'    , 'PMenu'                         , 'bg' , '#1a1a1a' )  ,
    color_scheme ( 'set'    , 'LspReferenceRead'              , 'bg' , '#626262' )  ,
    color_scheme ( 'set'    , 'LspReferenceText'              , 'bg' , '#626262' )  ,
    color_scheme ( 'set'    , 'LspReferenceWrite'             , 'bg' , '#626262' )  ,
    color_scheme ( 'set'    , 'LspDiagnosticsSignError'       , 'fg' , '#ec5f67' )  ,
    color_scheme ( 'set'    , 'LspDiagnosticsSignWarning'     , 'fg' , '#00FF00' )  ,
    color_scheme ( 'set'    , 'LspDiagnosticsSignInformation' , 'fg' , '#0000FF' )  ,
    color_scheme ( 'set'    , 'LspDiagnosticsSignHint'        , 'fg' , '#98C379' )  ,
    color_scheme ( 'set'    , 'FocusedSymbol'                 , 'fg' , '#fabd2f' )  , -- symbols sidebar
    color_scheme ( 'set'    , 'IndentlineOne'                 , 'fg' , '#2D3439' )  ,
    color_scheme ( 'set'    , 'IndentlineTwo'                 , 'fg' , '#4F5B64' )  ,
    color_scheme ( 'set'    , 'MatchParen'                    , 'bg' , '#fabd2f' )  ,
    color_scheme ( 'extend' , 'MatchParen'                    , 'fg' , '#141414' )  ,
    color_scheme ( 'set' , 'HelpNormalNC'                  , 'bg' , '#00ff00' )  ,
  }
})
-- This might be useful for styling tool windows (like symbols and defx)
-- set winhighlight=NormalNC:HelpNormalNC


