dump_diagnostics_key(Key.F7)    # default key: F15
emergency_eject_key(Key.F8)     # default key: F16
timeouts(
    multipurpose = 1,           # default: 1 sec
    suspend = 0.1,              # default: 1 sec
)

# --- Functions --- #
def class_in_group(group: list):
    return lambda ctx: ctx.wm_class.casefold() in group

def class_not_in_group(group: list):
    return lambda ctx: not ctx.wm_class.casefold() in group

def to_lower(list: list):
    return [str(x).casefold() for x in list]

# Use the following for testing terminal keymaps
# terminals = [ "", ... ]
terminals = to_lower([
    "alacritty",
    "cutefish-terminal",
    "deepin-terminal",
    "eterm",
    "gnome-terminal",
    "guake",
    "io.elementary.terminal",
    "kinto-gui.py",
    "Kgx",  # GNOME Console terminal app
    "konsole",
    "lxterminal",
    "mate-terminal",
    "org.gnome.Console",
    "qterminal",
    "st",
    "sakura",
    "station",
    "tabby",
    "terminator",
    "termite",
    "tilda",
    "tilix",
    "urxvt",
    "xfce4-terminal",
    "xterm",
    "org.wezfurlong.wezterm",
    "wezterm",
])

modmap("Global modmap", {
    # - Mac Only
    Key.LEFT_META: Key.RIGHT_CTRL,
    Key.LEFT_CTRL: Key.LEFT_META,
    Key.RIGHT_META: Key.RIGHT_CTRL,
    Key.RIGHT_CTRL: Key.RIGHT_META,
}, when = class_not_in_group(terminals))

modmap("Terminal modmap (keep ctrl)", {
    Key.LEFT_META: Key.RIGHT_CTRL,
    Key.RIGHT_META: Key.RIGHT_CTRL,
    Key.RIGHT_CTRL: Key.LEFT_CTRL,
}, when = class_in_group(terminals))

keymap(
    "Cut, copy, and paste",
    {
        C("RC-COMMA"): [C("T"), C("E"), C("S"), C("T")], # This works (types "TEST")
        C("RC-X"): C("C-Shift-X"),  # Does not work
        C("RC-C"): C("C-Shift-C"),  # Does not work
        C("RC-V"): C("C-Shift-V"),  # Does not work
    },
    when = class_in_group(terminals)
)
