-- Battery --
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
  local is_charging = 'AC Power' == string.match(output, "Now drawing from '(.*)'")
  return is_charging and chars.POWER_ICON_CHARGE or chars.POWER_ICON_BATTERY
end

local function get_percent(output)
  return tonumber(string.match(output, '(%d+)%%'))
end

local function get_color(percent)
  return _G.COLORS.battery[math.floor(percent/10)]
end

return {
  build_bar = build_bar,
  get_icon = get_icon,
  get_percent = get_percent,
  get_color = get_color,
}
