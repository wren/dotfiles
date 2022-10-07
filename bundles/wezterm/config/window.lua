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
-- config.enable_scroll_bar = true
config.scrollback_lines = 1000000

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local color = _G.MY_COLORS
  local ROUND_LEFT_EDGE = utf8.char(0xe0b6)
  local ROUND_RIGHT_EDGE = utf8.char(0xe0b4)

  local tab_bg = color.tab.bg
  local tab_fg = color.tab.fg

  if tab.is_active then
    tab_bg = color.tab.active
    tab_fg = color.tab.bg
  elseif hover then
    tab_bg = color.selection.bg
    tab_fg = color.tab.bg
  end

  return {
    {Background={Color=color.window.bg}},
    {Foreground={Color=tab_bg}},
    {Text=" " .. ROUND_LEFT_EDGE},
    {Background={Color=tab_bg}},
    {Foreground={Color=tab_fg}},
    {Text=" "},
    {Text=basename(tab.active_pane.foreground_process_name)},
    {Text=" "},
    {Background={Color=color.window.bg}},
    {Foreground={Color=tab_bg}},
    {Text=ROUND_RIGHT_EDGE},
  }
end)


wezterm.on("update-right-status", function (window, pane)
  local chars = require 'config.chars'

  -- battery
  local battery = require 'config.battery'
  local percent, state = battery.get_info()
  local icon = battery.get_icon(state)
  local color = battery.get_color(percent)
  local bar = battery.build_bar(percent)

  local leader = ""
  if window:leader_is_active() then
    leader = string.format(' %s ', chars.TERMINAL)
  end

  window:set_right_status(wezterm.format({
    {Background={Color=_G.MY_COLORS.window.bg}},
    {Foreground={Color=_G.MY_COLORS.window.fg}},
    {Text=leader},
    {Foreground={Color=_G.MY_COLORS.split}},
    {Text=string.format("  %s %.0f%%", icon, percent)},
    {Foreground={Color=color}},
    {Text=string.format(" %s ", bar)},
  }))
end)

return config
