local config = {}

local wezterm = require 'wezterm'

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.enable_csi_u_key_encoding = true

config.leader = { key=" ", mods="CTRL", timeout_milliseconds=1000 }
config.keys = {
  -- disable defaults
  {key="l", mods="CTRL", action="DisableDefaultAssignment"},
  {key="q", mods="CTRL", action="DisableDefaultAssignment"},
  {key="c", mods="CTRL", action="DisableDefaultAssignment"},
  {key="v", mods="CTRL", action="DisableDefaultAssignment"},

  -- make some often used keys easier to access by using cmd
  {key="d", mods="SUPER", action={SendKey={key="d", mods="CTRL"}}},
  {key="u", mods="SUPER", action={SendKey={key="u", mods="CTRL"}}},
  {key="p", mods="SUPER", action={SendKey={key="p", mods="CTRL"}}},
  {key="/", mods="SUPER", action={SendKey={key="/", mods="ALT"}}},

  -- shift + enter
  {key="\r", mods="SHIFT", action=wezterm.action{SendString="\x1b[13;2u"}},

  -- shift + space breaks terminal
  {key=" ", mods="SHIFT", action={SendKey={key=" "}}},

  -- splits
  {key="\\", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  {key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  {key="\\", mods="CTRL|LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  {key="-", mods="CTRL|LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  {key="=", mods="LEADER", action="TogglePaneZoomState"},

  -- Pane navigation
  {key="h", mods="SUPER", action=wezterm.action_callback(_G.nav_nvim_split("Left"))},
  {key="j", mods="SUPER", action=wezterm.action_callback(_G.nav_nvim_split("Down"))},
  {key="k", mods="SUPER", action=wezterm.action_callback(_G.nav_nvim_split("Up"))},
  {key="l", mods="SUPER", action=wezterm.action_callback(_G.nav_nvim_split("Right"))},

  {key="h", mods="SUPER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
  {key="j", mods="SUPER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
  {key="k", mods="SUPER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
  {key="l", mods="SUPER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},

  -- Closing tabs and panes
  {key="w", mods="SUPER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
  {key="w", mods="SUPER", action=wezterm.action{CloseCurrentPane={confirm=true}}},
  {key="q", mods="CMD", action="QuitApplication"},

  -- scrolling
  {key="PageUp", action=wezterm.action{ScrollByPage=-1}},
  {key="PageDown", action=wezterm.action{ScrollByPage=1}},

  {key="UpArrow", mods="SHIFT", action=wezterm.action{ScrollToPrompt=-1}},
  {key="DownArrow", mods="SHIFT", action=wezterm.action{ScrollToPrompt=1}},

}

return config
