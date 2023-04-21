-- Battery --
local function get_info()
  local wezterm = require 'wezterm'
  local percent = 0
  local state = ""

  for _, b in ipairs(wezterm.battery_info()) do
    percent = b.state_of_charge * 100
    state = b.state
  end

  return percent, state
end

local function build_bar(percent)
  local chars = require 'config.chars'
  local LEFT = percent >= 10 and chars.LEFT_FULL or chars.LEFT_EMPTY
  local mid_count = math.floor(percent/10)-1
  local MID = string.rep(chars.MID_FULL, mid_count) .. string.rep(chars.MID_EMPTY, 8-mid_count)
  local RIGHT = percent > 90 and chars.RIGHT_FULL or chars.RIGHT_EMPTY
  return LEFT .. MID .. RIGHT
end

local function get_icon(output)
  local chars = require 'config.chars'
  local result = chars.POWER_ICON_BATTERY
  if "Charging" == output then
    result = chars.POWER_ICON_CHARGE
  end
  return result
end

local function get_color(percent)
  return _G.MY_COLORS.battery[math.floor(percent/10)]
end

return {
  build_bar = build_bar,
  get_color = get_color,
  get_icon = get_icon,
  get_info = get_info,
}
