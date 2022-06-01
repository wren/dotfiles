local config = {}

config.mouse_bindings = {
  {
    event={Down={streak=4, button="Left"}},
    action={SelectTextAtMouseCursor="SemanticZone"},
    mods="NONE"
  },
}

return config
