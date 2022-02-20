local config = {}

local wezterm = require 'wezterm'

local my_font = wezterm.font_with_fallback({
  {family="FiraCode Nerd Font", weight="Light"},
  {family="Fira Code", weight="Bold"},
  {family="Noto Color Emoji"},
})

config = {
  font = my_font,
  font_size = 20,
  line_height = 1.2,
  harfbuzz_features = {
    "zero", -- dot inside zero instead of line
    -- "calt=0", "clig=0", "liga=0", -- disable ligatures
  },

  -- tab bar
  window_frame = {
    -- The font used in the tab bar.
    font = my_font,
    font_size = 18.0,
  },
}

return config
