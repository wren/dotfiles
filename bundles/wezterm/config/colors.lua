local config = {}

local wezterm = require 'wezterm'

config.window_background_image = wezterm.home_dir .. "/.config/wezterm/bg_terminal.png"

local color = {
  black = "#1F2329",
  black_on_black = "#535965",
  grey = "#808080",
  grey_blue = "#474E5D",
  red = "#E06C75",
  green = "#98C379",
  yellow = "#E5C07B",
  blue_dark = "#A3B3CC",
  blue = "#61AFEF",
  blue_bright = "#92D4F7",
  magenta = "#C678DD",
  cyan = "#56B6C2",
  white = "#DCDFE4",

  battery = {
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
}

local C = {
  window = {
    bg = color.black,
    fg = color.white,
  },
  cursor = {
    bg = color.blue_dark,
    fg = color.white,
  },
  selection = {
    bg = color.grey_blue,
    fg = color.white,
  },
  tab = {
    bg = color.black,
    fg = color.white,
    active = color.blue_bright,
  },
  scrollbar = color.grey_blue,
  split = color.grey,
  battery = color.battery,

  ansi = {
    color.black,
    color.red,
    color.green,
    color.yellow,
    color.blue,
    color.magenta,
    color.cyan,
    color.white,
  },
}
_G.MY_COLORS = C

config.colors = {
  background = C.window.bg,
  foreground = C.window.fg,
  cursor_bg = C.cursor.bg,
  cursor_border = C.cursor.bg,
  cursor_fg = C.fg,
  selection_bg = C.selection.bg,
  selection_fg = C.selection.fg,
  scrollbar_thumb = C.scrollbar,
  split = C.split,
  tab_bar = {
    background = C.window.bg,
  },

  ansi = C.ansi,
  brights = C.ansi,
}

config.window_frame = {
  active_titlebar_bg = C.window.bg,
  inactive_titlebar_bg = C.window.bg,
}

config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 1,
}

return config
