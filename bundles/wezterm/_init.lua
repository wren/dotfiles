-- local config = require 'config'

local wezterm = require 'wezterm'
local my_font = wezterm.font({family="FiraCode Nerd Font", weight="Light"})


-- Helpers --
function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end


-- Config --
local my_config = {
  -- Font
  font = my_font,
  font_size = 20,
  line_height = 1.2,
  harfbuzz_features = {
    "zero", -- dot inside zero instead of line
    "calt=0", "clig=0", "liga=0", -- disable ligatures
  },

  -- Colors
  -- window_background_image = "bg_terminal.png",
  -- color_scheme = "OneHalfDark",
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",

  -- Window Appearance
  window_padding = {
    left = 11,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- tab bar
  window_frame = {
    -- The font used in the tab bar.
    font = my_font,

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 18.0,

    line_height = 1.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = "#1F2329",

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = "#333333",

  },

  colors = {
    background = "#1F2329",
    foreground = "#DCDFE4",
    cursor_bg = "#A3B3CC",
    cursor_border = "#A3B3CC",
    cursor_fg = "#DCDfe4",
    selection_bg = "#474E5D",
    selection_fg = "#DCDFE4",

    ansi = {"#535965","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#DCDFE4"},
    brights = {"#535965","#E06C75","#98C379","#E5C07B","#61AFEF","#C678DD","#56B6C2","#DCDFE4"},

  },

  window_close_confirmation = "NeverPrompt",

  keys = {
    -- make some often used keys easier to access by using cmd
    {key="d", mods="SUPER", action={SendKey={key="d", mods="CTRL"}}},
    {key="u", mods="SUPER", action={SendKey={key="u", mods="CTRL"}}},
    {key="h", mods="SUPER", action={SendKey={key="h", mods="CTRL"}}},
    {key="j", mods="SUPER", action={SendKey={key="j", mods="CTRL"}}},
    {key="k", mods="SUPER", action={SendKey={key="k", mods="CTRL"}}},
    {key="l", mods="SUPER", action={SendKey={key="l", mods="CTRL"}}},
    {key="p", mods="SUPER", action={SendKey={key="p", mods="CTRL"}}},
    {key="/", mods="SUPER", action={SendKey={key="/", mods="ALT"}}},
  },

-- Always use alt
  send_composed_key_when_left_alt_is_pressed=false,
  send_composed_key_when_right_alt_is_pressed=false,
}


-- Events --
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local ROUND_LEFT_EDGE = utf8.char(0xe0b6)
  local ROUND_RIGHT_EDGE = utf8.char(0xe0b4)

  local bar_bg = "#1F2329"
  local tab_bg = "#282C34"
  local tab_fg = "#535965"

  if tab.is_active then
    bar_bg = "#1F2329"
    tab_bg = "#92D4F7"
    tab_fg = bar_bg
  -- elseif hover then
  --   bar_bg = "#1F2329"
  --   tab_bg = "#282C34"
  --   tab_fg = bar_bg
  end

  return {
    {Background={Color=bar_bg}},
    {Foreground={Color=tab_bg}},
    {Text=ROUND_LEFT_EDGE},
    {Background={Color=tab_bg}},
    {Foreground={Color=tab_fg}},
    {Text=" "},
    {Text=basename(tab.active_pane.foreground_process_name)},
    {Text=" "},
    {Background={Color=bar_bg}},
    {Foreground={Color=tab_bg}},
    {Text=ROUND_RIGHT_EDGE},
  }
end)

return my_config
