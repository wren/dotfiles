local config = {}

-- config.window_background_image = "bg_terminal.png",

config.colors = {
  background = "#1F2329",
  foreground = "#DCDFE4",
  cursor_bg = "#A3B3CC",
  cursor_border = "#A3B3CC",
  cursor_fg = "#DCDfe4",
  selection_bg = "#474E5D",
  selection_fg = "#DCDFE4",
  split = "#808080",

  ansi = {"#535965","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#DCDFE4"},
  brights = {"#535965","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#DCDFE4"},
}

_G.COLORS = config.colors

config.window_frame = {
  active_titlebar_bg = _G.COLORS.background,
  inactive_titlebar_bg = _G.COLORS.background,
}

config.inactive_pane_hsb = {
  saturation = 0.85,
  brightness = 0.75,
}

  -- colors for each 10% the battery changes
_G.COLORS.battery = {
  [0] = "#FF0000",
  [1] = "#EC5F67",
  [2] = "#FF5F00",
  [3] = "#FF8700",
  [4] = "#F0AF30",
  [5] = "#ECBE7B",
  [6] = "#FFD758",
  [7] = "#ECDE5B",
  [8] = "#ACBE7B",
  [9] = "#A8BE65",
  [10] = "#98BE65",
}


return config
