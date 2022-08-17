local config = {}

local wezterm = require 'wezterm'

config.window_background_image = wezterm.home_dir .. "/.config/wezterm/bg_terminal.png"

config.colors = {
  background = "#1F2329",
  foreground = "#DCDFE4",
  cursor_bg = "#A3B3CC",
  cursor_border = "#A3B3CC",
  cursor_fg = "#DCDfe4",
  selection_bg = "#474E5D",
  selection_fg = "#DCDFE4",
  scrollbar_thumb = "#282C34",
  split = "#808080",
  active = "#92D4F7",
  inactive = "#808080",
  tab_foreground = "#535965",

  ansi = {"#535965","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#DCDFE4"},
  brights = {"#535965","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#DCDFE4"},
}

_G.COLORS = config.colors

config.colors.tab_bar = {
  -- The color of the strip that goes along the top of the window
  -- (does not apply when fancy tab bar is in use)
  background = _G.COLORS.background,

  active_tab = {
    bg_color = _G.COLORS.background,
    fg_color = _G.COLORS.foreground,
    intensity = 'Bold', -- Half | [Normal] | Bold
    underline = 'None', -- [None] | Single | Double
    italic = false,
    strikethrough = false,
  },

  inactive_tab = {
    bg_color = _G.COLORS.background,
    fg_color = _G.COLORS.foreground,
    italic = true,
  },

  inactive_tab_hover = {
    bg_color = _G.COLORS.background,
    fg_color = _G.COLORS.foreground,
    italic = true,
  },

  new_tab = {
    bg_color = _G.COLORS.background,
    fg_color = _G.COLORS.inactive,
    intensity = 'Half',
  },

  new_tab_hover = {
    bg_color = _G.COLORS.background,
    fg_color = _G.COLORS.active,
    intensity = 'Bold',
  },
}

config.window_frame = {
  active_titlebar_bg = _G.COLORS.background,
  inactive_titlebar_bg = _G.COLORS.background,
}

config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 1,
}

  -- colors for each 10% the battery changes
_G.MY_COLORS = {}
_G.MY_COLORS.battery = {
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
