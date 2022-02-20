local config = {}
local wezterm = require 'wezterm'

-- Window Appearance
config.window_padding = {
  left = 11,
  right = 0,
  top = 0,
  bottom = 0,
}

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = "RESIZE"
config.unzoom_on_switch_pane = false
config.window_close_confirmation = "NeverPrompt"


wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local ROUND_LEFT_EDGE = utf8.char(0xe0b6)
  local ROUND_RIGHT_EDGE = utf8.char(0xe0b4)

  local tab_bg = "#282C34"
  local tab_fg = "#535965"

  if tab.is_active then
    tab_bg = "#92D4F7"
    tab_fg = _G.COLORS.background
  end

  return {
    {Background={Color=_G.COLORS.background}},
    {Foreground={Color=tab_bg}},
    {Text=ROUND_LEFT_EDGE},
    {Background={Color=tab_bg}},
    {Foreground={Color=tab_fg}},
    {Text=" "},
    {Text=basename(tab.active_pane.foreground_process_name)},
    {Text=" "},
    {Background={Color=_G.COLORS.background}},
    {Foreground={Color=tab_bg}},
    {Text=ROUND_RIGHT_EDGE},
  }
end)


wezterm.on("update-right-status", function (window, pane)
  local battery = require 'config.battery'
  local output = get_cmd_output("pmset -g batt")

  local icon = battery.get_icon(output)
  local percent = battery.get_percent(output)
  local color = battery.get_color(percent)
  local bar = battery.build_bar(percent)

  window:set_right_status(wezterm.format({
    {Background={Color="#1F2329"}},
    {Text=string.format("  %s %s%%", icon, percent)},
    {Foreground={Color=color}},
    {Text=string.format(" %s ", bar)},
  }))
end)

return config
