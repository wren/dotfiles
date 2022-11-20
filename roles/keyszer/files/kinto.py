# REMOVE THIS AFTER v0.7 KEYSZER RELEASE - WILL NO LONGER BE NEEDED
from keyszer.config_api import to_US_keystrokes as ST

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
])

mscodes = to_lower([
    "code",
    "vscodium",
])

# Add remote desktop clients & VM software here
# Ideally we'd only exclude the client window,
# but that may not be easily done.
remotes = to_lower([
    "Gnome-boxes",
    "org.remmina.Remmina",
    "remmina",
    "qemu-system-.*",
    "qemu",
    "Spicy",
    "Virt-manager",
    "VirtualBox",
    "VirtualBox Machine",
    "xfreerdp",
    "Wfica",
])

# Add remote desktop clients & VMs for no remapping
terminals.extend(remotes)
mscodes.extend(remotes)

# Use for browser specific hotkeys
browsers = to_lower([
    "Chromium",
    "Chromium-browser",
    "Discord",
    "Epiphany",
    "Firefox",
    "Firefox Developer Edition",
    "Navigator",
    "firefoxdeveloperedition",
    "Waterfox",
    "Google-chrome",
    "microsoft-edge",
    "microsoft-edge-dev",
    "org.deepin.browser",
])

chromes = to_lower([
    "Chromium",
    "Chromium-browser",
    "Google-chrome",
    "microsoft-edge",
    "microsoft-edge-dev",
    "org.deepin.browser",
])

filemanagers = to_lower([
    "caja",
    "cutefish-filemanager",
    "dde-file-manager",
    "dolphin",
    "io.elementary.files",
    "nautilus",
    "nemo",
    "org.gnome.nautilus",
    "pcmanfm",
    "pcmanfm-qt",
    "spacefm",
    "thunar",
])


multipurpose_modmap("Escape to some other shit", {
    Key.CAPSLOCK: [Key.ESC, Key.RIGHT_ALT],
})

modmap("Global modmap", {
    # - Mac Only
    Key.LEFT_META: Key.RIGHT_CTRL,  # Mac
    Key.LEFT_CTRL: Key.LEFT_META,   # Mac
    Key.RIGHT_META: Key.RIGHT_CTRL, # Mac - Multi-language (Remove)
    Key.RIGHT_CTRL: Key.RIGHT_META, # Mac - Multi-language (Remove)
}, when = class_not_in_group(terminals))

# [Conditional modmap] Change modifier keys in certain applications
modmap("Terminal modmap (keep ctrl)", {
    # - Mac Only
    Key.LEFT_META: Key.RIGHT_CTRL,  # Mac
    # Left Ctrl Stays Left Ctrl
    Key.RIGHT_META: Key.RIGHT_CTRL, # Mac - Multi-language (Remove)
    Key.RIGHT_CTRL: Key.LEFT_CTRL,  # Mac - Multi-language (Remove)
}, when = class_in_group(terminals))


##############################################
### START OF FILE MANAGER GROUP OF KEYMAPS ###
##############################################

# Keybindings overrides for Nautilus
# (overrides some bindings from general file manager code block below)
keymap("Overrides for Nautilus - Finder Mods",{
    C("RC-KEY_1"):  C("C-KEY_2"),      # View as Icons
    C("RC-KEY_2"):  C("C-KEY_1"),      # View as List (Detailed)
    C("RC-Meta-O"): C("Shift-Enter"),  # Open in new window
    C("RC-comma"):  C("RC-comma"),     # Overrides "Open preferences dialog" shortcut below
}, when = wm_class_match("^(org.gnome.)?nautilus$"))

# Keybindings for general Linux file managers group:
keymap("General File Managers - Finder Mods",{
    C("RC-i"):                  C("Alt-Enter"),       # File properties dialog (Get Info)
    C("RC-comma"):              [C("Alt-E"),C("N")],  # Open preferences dialog
    C("RC-Shift-dot"):          C("RC-H"),            # Show/hide hidden files ("dot" files)
    #--- Navigation ---#
    C("RC-Left_Brace"):         C("Alt-Left"),        # Go Back
    C("RC-Right_Brace"):        C("Alt-Right"),       # Go Forward
    C("RC-Left"):               C("Alt-Left"),        # Go Back
    C("RC-Right"):              C("Alt-Right"),       # Go Forward
    C("RC-Up"):                 C("Alt-Up"),          # Go Up dir
    C("RC-Down"):               C("Enter"),           # Go Down dir (open folder/file) [universal]
    C("RC-Shift-Left_Brace"):   C("C-Page_Up"),       # Go to prior tab
    C("RC-Shift-Right_Brace"):  C("C-Page_Down"),     # Go to next tab
    C("RC-Shift-Left"):         C("C-Page_Up"),       # Go to prior tab
    C("RC-Shift-Right"):        C("C-Page_Down"),     # Go to next tab
    C("RC-Super-o"):            C("RC-Shift-o"),      # Open in new window (or tab, depends on FM setup) [not universal]
    C("RC-Backspace"):          C("Delete"),          # Move to Trash (delete)
    # C("Enter"):                 C("F2"),              # Rename with Enter key
    # C("RC-Shift-Enter"):        C("Enter"),           # Remap alternative "Enter" key to easily activate/exit text fields
    C("RC-Shift-Enter"):    C("F2"),                  # Rename with Cmd+Shift+Enter
}, when = class_in_group(filemanagers))


#########################################
### START OF BROWSER GROUP OF KEYMAPS ###
#########################################

keymap(
    "Firefox",
    {
        C("C-comma"): [ C("C-T"), ST("about"), C("Shift-SEMICOLON"), ST("preferences") ,C("Enter") ],
        C("RC-Shift-N"):    C("RC-Shift-P"),        # Open private window with Ctrl+Shift+N like other browsers
    },
    when = wm_class_match("^firefox$")
)

keymap(
    "Chrome-like browers",
    {
        C("C-comma"): [C("Alt-e"), C("s"),C("Enter")],    # Open preferences
        C("RC-q"):              C("Alt-F4"),              # Quit Chrome(s) browsers with Cmd+Q
        # C("RC-Left"):           C("Alt-Left"),            # Page nav: Back to prior page in history (conflict with wordwise)
        # C("RC-Right"):          C("Alt-Right"),           # Page nav: Forward to next page in history (conflict with wordwise)
        C("RC-Left_Brace"):     C("Alt-Left"),            # Page nav: Back to prior page in history
        C("RC-Right_Brace"):    C("Alt-Right"),           # Page nav: Forward to next page in history
    },
    when = class_in_group(chromes)
)

# Keybindings for General Web Browsers
keymap(
    "General Web Browers",
    {
        C("RC-Q"): C("RC-Q"),           # Close all browsers Instances
        C("Alt-RC-I"): C("RC-Shift-I"),   # Dev tools
        C("Alt-RC-J"): C("RC-Shift-J"),   # Dev tools
        C("RC-Key_1"): C("Alt-Key_1"),    # Jump to Tab #1-#8
        C("RC-Key_2"): C("Alt-Key_2"),
        C("RC-Key_3"): C("Alt-Key_3"),
        C("RC-Key_4"): C("Alt-Key_4"),
        C("RC-Key_5"): C("Alt-Key_5"),
        C("RC-Key_6"): C("Alt-Key_6"),
        C("RC-Key_7"): C("Alt-Key_7"),
        C("RC-Key_8"): C("Alt-Key_8"),
        C("RC-Key_9"): C("Alt-Key_9"),    # Jump to last tab
        # Enable Cmd+Shift+Braces for tab navigation
        C("RC-Shift-Left_Brace"):   C("C-Page_Up"),     # Go to prior tab
        C("RC-Shift-Right_Brace"):  C("C-Page_Down"),   # Go to next tab
        # Enable Cmd+Option+Left/Right for tab navigation
        C("RC-Alt-Left"):             C("C-Page_Up"),     # Go to prior tab
        C("RC-Alt-Right"):            C("C-Page_Down"),   # Go to next tab
        # Enable Ctrl+PgUp/PgDn for tab navigation
        C("Super-Page_Up"):         C("C-Page_Up"),     # Go to prior tab
        C("Super-Page_Down"):       C("C-Page_Down"),   # Go to next tab
        # Use Cmd+Braces keys for tab navigation instead of page navigation
        # C("C-Left_Brace"): C("C-Page_Up"),
        # C("C-Right_Brace"): C("C-Page_Down"),
    },
    when = class_in_group(browsers)
)

keymap(
    "U-Launcher",
    {
        C("RC-Key_1"):      C("Alt-Key_1"),      # Remap Ctrl+[1-9] and Ctrl+[a-z] to Alt+[1-9] and Alt+[a-z]
        C("RC-Key_2"):      C("Alt-Key_2"),
        C("RC-Key_3"):      C("Alt-Key_3"),
        C("RC-Key_4"):      C("Alt-Key_4"),
        C("RC-Key_5"):      C("Alt-Key_5"),
        C("RC-Key_6"):      C("Alt-Key_6"),
        C("RC-Key_7"):      C("Alt-Key_7"),
        C("RC-Key_8"):      C("Alt-Key_8"),
        C("RC-Key_9"):      C("Alt-Key_9"),
        C("RC-Key_0"):      C("Alt-Key_0"),
        # C("RC-a"):          C("Alt-a"),
        C("RC-b"):          C("Alt-b"),
        # C("RC-c"):          C("Alt-c"),
        C("RC-d"):          C("Alt-d"),
        C("RC-e"):          C("Alt-e"),
        C("RC-f"):          C("Alt-f"),
        C("RC-g"):          C("Alt-g"),
        C("RC-h"):          C("Alt-h"),
    },
    when = wm_class_match("^ulauncher$")
)

# Special overrides for terminals for shortcuts that conflict with General GUI block below.
keymap(
    "Special overrides for terminals",
    {
        C("Alt-Backspace"):   C("Alt-Shift-Backspace"), # Wordwise delete word left of cursor in terminals
        C("Alt-Delete"):      [C("Esc"),C("d")],        # Wordwise delete word right of cursor in terminals
        C("RC-Backspace"):    C("C-u"),                 # Wordwise delete line left of cursor in terminals
        C("RC-Delete"):       C("C-k"),                 # Wordwise delete line right of cursor in terminals
        ### Tab navigation
        C("RC-Shift-Left"):   C("C-Page_Up"),           # Tab nav: Go to prior tab (Left)
        C("RC-Shift-Right"):  C("C-Page_Down"),         # Tab nav: Go to next tab (Right)
    },
    when = class_in_group(terminals)
)

keymap(
    "Terminals Some More",
    {
        C("LC-RC-f"): C("Alt-F10"),                       # Toggle window maximized state
        # C("RC-Grave"): C("Super-Tab"),                # xfce4 Switch within app group
        # C("RC-Shift-Grave"): C("Super-Shift-Tab"),    # xfce4 Switch within app group
        C("LC-Grave") : C("LC-PAGE_UP"),
        # C("Alt-Tab"): pass_through_key,                 # Default - Cmd Tab - App Switching Default
        # C("RC-Tab"): C("Alt-Tab"),                      # Default - Cmd Tab - App Switching Default
        # C("RC-Shift-Tab"): C("Alt-Shift-Tab"),          # Default - Cmd Tab - App Switching Default
        # Converts Cmd to use Ctrl-Shift
        C("RC-MINUS"): C("C-MINUS"),
        C("RC-EQUAL"): C("C-Shift-EQUAL"),
        C("RC-BACKSPACE"): C("C-Shift-BACKSPACE"),
        C("RC-W"): C("C-Shift-W"),
        C("RC-E"): C("C-Shift-E"),
        C("RC-R"): C("C-Shift-R"),
        C("RC-T"): C("C-Shift-t"),
        C("RC-Y"): C("C-Shift-Y"),
        # C("RC-U"): C("C-Shift-U"),
        C("RC-I"): C("C-Shift-I"),
        C("RC-O"): C("C-Shift-O"),
        C("RC-P"): C("C-Shift-P"),
        C("RC-LEFT_BRACE"): C("C-Shift-LEFT_BRACE"),
        C("RC-RIGHT_BRACE"): C("C-Shift-RIGHT_BRACE"),
        C("RC-Shift-Left_Brace"):   C("C-Page_Up"),     # Go to prior tab (Left)
        C("RC-Shift-Right_Brace"):  C("C-Page_Down"),   # Go to next tab (Right)
        C("RC-A"): C("C-Shift-A"),
        C("RC-S"): C("C-Shift-S"),
        # C("RC-D"): C("C-Shift-D"),
        C("RC-F"): C("C-Shift-F"),
        C("RC-G"): C("C-Shift-G"),
        C("RC-H"): C("Super-H"),
        C("RC-J"): C("Super-J"),
        C("RC-K"): C("Super-K"),
        C("RC-L"): C("Super-L"),
        C("RC-SEMICOLON"): C("C-Shift-SEMICOLON"),
        C("RC-APOSTROPHE"): C("C-Shift-APOSTROPHE"),
        C("RC-GRAVE"): C("C-Shift-GRAVE"),
        C("RC-Z"): C("C-Shift-Z"),
        C("RC-X"): C("C-Shift-X"),
        C("RC-C"): C("C-Shift-C"),
        C("RC-V"): C("C-Shift-V"),
        C("RC-B"): C("C-Shift-B"),
        C("RC-N"): C("C-Shift-N"),
        C("RC-M"): C("C-Shift-M"),
        C("RC-COMMA"): C("C-Shift-COMMA"),
        # C("RC-Dot"): C("LC-c"),
        C("RC-SLASH"): C("Alt-Slash"),
        C("RC-KPASTERISK"): C("C-Shift-KPASTERISK"),
    },
    when = class_in_group(terminals)
)


# These are the typical remaps for ALL GUI based apps
keymap(
    "General GUI",
    {
        # Arrows
        C("RAlt-H"): C("Left"),
        C("RAlt-J"): C("Down"),
        C("RAlt-K"): C("Up"),
        C("RAlt-L"): C("Right"),

        C("RC-Dot"): C("Super-Dot"),
        C("RC-Shift-Left_Brace"):   C("C-Page_Up"),               # Tab nav: Go to prior (left) tab
        C("RC-Shift-Right_Brace"):  C("C-Page_Down"),             # Tab nav: Go to next (right) tab
        C("RC-Space"): C("Alt-F1"),                               # Default SL - Launch Application Menu (gnome/kde)
        C("RC-F3"):C("Super-d"),                                  # Default SL - Show Desktop (gnome/kde,eos)
        C("RC-Super-f"):C("Alt-F10"),                             # Default SL - Maximize app (gnome/kde)
        C("RC-Q"): C("Alt-F4"),                                   # Default SL - not-popos
        C("RC-H"):C("Super-h"),                                   # Default SL - Minimize app (gnome/budgie/popos/fedora)
        # C("Alt-Tab"): pass_through_key,                         # Default - Cmd Tab - App Switching Default
        C("RC-Tab"):               [bind, C("Alt-Tab")],          # Default - Cmd Tab - App Switching Default
        C("Shift-RC-Tab"):         [bind, C("Alt-Shift-Tab")],    # Default - Cmd Tab - App Switching Default
        C("RC-Grave"):             [bind, C("Alt-Grave")],        # Default not-xfce4 - Cmd ` - Same App Switching
        C("Shift-RC-Grave"):       [bind, C("Alt-Shift-Grave")],  # Default not-xfce4 - Cmd ` - Same App Switching
        C("Super-Tab"): C("LC-Tab"),                              # Default not-chromebook
        C("Super-Shift-Tab"): C("LC-Shift-Tab"),                  # Default not-chromebook

        # Fn to Alt style remaps
        C("RAlt-Enter"): C("insert"),                   # Insert

        # emacs style
        C("Super-a"): C("Home"),                      # Beginning of Line
        C("Super-e"): C("End"),                       # End of Line
        C("Super-b"): C("Left"),
        C("Super-f"): C("Right"),
        C("Super-n"): C("Down"),
        C("Super-p"): C("Up"),
        C("Super-k"): [C("Shift-End"), C("Backspace")],
        C("Super-d"): C("Delete"),

        # Wordwise
        C("RC-Left"): C("Home"),                      # Beginning of Line
        C("RC-Shift-Left"): C("Shift-Home"),          # Select all to Beginning of Line
        C("RC-Right"): C("End"),                      # End of Line
        C("RC-Shift-Right"): C("Shift-End"),          # Select all to End of Line
        C("RC-Up"): C("C-Home"),                      # Beginning of File
        C("RC-Shift-Up"): C("C-Shift-Home"),          # Select all to Beginning of File
        C("RC-Down"): C("C-End"),                     # End of File
        C("RC-Shift-Down"): C("C-Shift-End"),         # Select all to End of File
        C("Super-Backspace"): C("C-Backspace"),       # Delete Left Word of Cursor
        C("Super-Delete"): C("C-Delete"),             # Delete Right Word of Cursor
        C("Alt-Backspace"): C("C-Backspace"),           # Default not-chromebook
        C("RC-Backspace"): C("C-Shift-Backspace"),    # Delete Entire Line Left of Cursor
        C("Alt-Delete"): C("C-Delete"),               # Delete Right Word of Cursor
    },
    when = class_not_in_group(remotes)
)
