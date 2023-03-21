local config = {}

local wezterm = require 'wezterm'

local my_font = wezterm.font_with_fallback({
  { family = "MonoLisa Nerd Font", weight = "Light" },
  { family = "FiraCode Nerd Font", weight = "Light" },
  { family = "Noto Color Emoji" },
})


config = {
  font = my_font,
  font_size = 20,
  line_height = 1.2,
  harfbuzz_features = {
    -- see: https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets
    -- "zero", -- slash inside zero instead of dot
    "calt=0", "clig=0", "liga=0", -- disable ligatures
  },

  -- tab bar
  window_frame = {
    -- The font used in the tab bar.
    font = my_font,
    font_size = 16,
  },
}

return config
