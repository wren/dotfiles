local config = {}

local wezterm = require("wezterm")

-- config = {
--   unix_domains = {
--     {
--       name = "unix",
--       serve_command = {"wezterm-mux-server", "--daemonize"},
--     }
--   },

--   -- This causes `wezterm` to act as though it was started as
--   -- `wezterm connect unix` by default, connecting to the unix
--   -- domain on startup.
--   -- If you prefer to connect manually, leave out this line.
--   default_gui_startup_args = {"connect", "unix"},
-- }

_G.nav_nvim_split = function(direction)
  return function(window, pane)
    local running = pane:get_foreground_process_info()

    local action
    if nil ~= string.find(running.executable, "nvim") then
      -- pass the keystrokes on to nvim
      wezterm.log_info("in nvim")
      local direction_keys = {
        Left = "h",
        Down = "j",
        Up = "k",
        Right = "l",
      }
      action = wezterm.action({ SendKey = { key = direction_keys[direction], mods = "CTRL|ALT" } })
    else
      -- do the action in wezterm
      wezterm.log_info("not in nvim")
      action = wezterm.action({ ActivatePaneDirection = direction })
    end
    window:perform_action(action, pane)
  end
end

return config
