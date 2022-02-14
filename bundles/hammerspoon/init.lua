local hs = hs or ""

-- Generates function to show or hide an app
local show_or_hide = function(app_name)
  local my_func = function()
    local app = hs.application.get(app_name)
    if not app or not app:isFrontmost() then
      hs.application.launchOrFocus(app_name)
    else
        app:hide()
    end
  end
  return my_func
end

-- Terminal hotkey
hs.hotkey.bind({"cmd"}, ".", show_or_hide("WezTerm"))

