local config = {}

config = {
  unix_domains = {
    {
      name = "unix",
      serve_command = {"wezterm-mux-server", "--daemonize"},
    }
  },

  -- This causes `wezterm` to act as though it was started as
  -- `wezterm connect unix` by default, connecting to the unix
  -- domain on startup.
  -- If you prefer to connect manually, leave out this line.
  default_gui_startup_args = {"connect", "unix"},
}

return config
