# @see: https://github.com/joshgoebel/keyszer
# @see: https://github.com/joshgoebel/keyszer/blob/main/src/keyszer/models/key.py

from subprocess import run

# Remove this after v0.7 keyszer release
from keyszer.config_api import to_US_keystrokes as ST

# Keyszer-specific config settings - REMOVE OR SET TO DEFAULTS FOR DISTRIBUTION
dump_diagnostics_key(Key.F7)   # default key: F15
emergency_eject_key(Key.F8) # default key: F16
timeouts(
    multipurpose = 0.1,        # default: 1 sec
    suspend = 1,               # default: 1 sec
)

###################################################################################
###                                                                             ###
###                                                                             ###
###   ███████ ██   ██ ███    ██  ██████ ████████ ██  ██████  ███    ██ ███████  ###
###   ██      ██   ██ ████   ██ ██         ██    ██ ██    ██ ████   ██ ██       ###
###   █████   ██   ██ ██ ██  ██ ██         ██    ██ ██    ██ ██ ██  ██ ███████  ###
###   ██      ██   ██ ██  ██ ██ ██         ██    ██ ██    ██ ██  ██ ██      ██  ###
###   ██       █████  ██   ████  ██████    ██    ██  ██████  ██   ████ ███████  ###
###                                                                             ###
###                                                                             ###
###################################################################################

def switch_to_workspace(num: int):
    return lambda: run(["/bin/xdotool", "set_desktop", f"{num - 1}"])


def open_or_focus(window: str, user: str):
    return lambda: run(['/bin/open-or-focus-window', window, user])


def to_lower(list):
    return [item.casefold() for item in list]


def class_in_group(group):
    return lambda ctx: ctx.wm_class.casefold() in group

def class_not_in_group(group):
    return lambda ctx: not ctx.wm_class.casefold() in group

######################################################
###                                                ###
###                                                ###
###      ██      ██ ███████ ████████ ███████       ###
###      ██      ██ ██         ██    ██            ###
###      ██      ██ ███████    ██    ███████       ###
###      ██      ██      ██    ██         ██       ###
###      ███████ ██ ███████    ██    ███████       ###
###                                                ###
###                                                ###
######################################################

# Use the following for testing terminal keymaps
# terminals = [ "", ... ]
# xbindkeys -mk
terminals = to_lower([
    "alacritty",
    "deepin-terminal",
    "eterm",
    "gnome-terminal",
    "guake",
    "hyper",
    "io.elementary.terminal",
    "kinto-gui.py",
    "Kgx",                      # GNOME Console terminal app
    "konsole",
    "lxterminal",
    "mate-terminal",
    "org.gnome.Console",
    "org.wezfurlong.wezterm",
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
    "wezterm",
    "xfce4-terminal",
    "xterm",
])

# Add remote desktop clients & VM software here
# Ideally we'd only exclude the client window,
# but that may not be easily done.
remotes = to_lower([
    "Gnome-boxes",
    "org.remmina.Remmina",
    "Nxplayer.bin",
    "remmina",
    "qemu-system-.*",
    "qemu",
    "Spicy",
    "Virt-manager",
    "VirtualBox",
    "VirtualBox Machine",
    "xfreerdp",
])

# Add remote desktop clients & VMs for no remapping
terminals.extend(remotes)

# Use for browser specific hotkeys
browsers = to_lower([
    "Chromium",
    "Chromium-browser",
    "Discord",
    "Epiphany",
    "Firefox",
    "Firefox Developer Edition",
    "Waterfox",
    "Google-chrome",
    "microsoft-edge",
    "microsoft-edge-dev",
])

chromes = to_lower([
    "Chromium",
    "Chromium-browser",
    "Google-chrome",
    "microsoft-edge",
    "microsoft-edge-dev",
])

filemanagers = to_lower([
    "caja",
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


#####################################################
###                                               ###
###                                               ###
###      ███    ███  ██████  ██████  ███████      ###
###      ████  ████ ██    ██ ██   ██ ██           ###
###      ██ ████ ██ ██    ██ ██   ██ ███████      ###
###      ██  ██  ██ ██    ██ ██   ██      ██      ###
###      ██      ██  ██████  ██████  ███████      ###
###                                               ###
###                                               ###
#####################################################

add_modifier("HYPER", aliases = ["Hyper"], key = Key.F24)
multipurpose_modmap(
    "Caps Lock -> Esc/Hyper",
    {
        # Key.ENTER:    [Key.ENTER, Key.F24],
        Key.CAPSLOCK: [Key.ESC, Key.F24],
    }
)

# modmap(
#     """
#     Terminal Modifiers

#     Change modifier keys in terminals
#     """,
#     {
#         Key.LEFT_META: Key.RIGHT_CTRL,

#         # Left Ctrl Stays Left Ctrl
#         Key.RIGHT_META: Key.RIGHT_CTRL,
#         Key.RIGHT_CTRL: Key.LEFT_CTRL,
#     },
#     when = class_in_group(terminals)
# )


# modmap(
#     """
#     General global modifers

#     Change modifier keys in all other apps (not terminals)
#     """,
#     {
#         Key.LEFT_META:            Key.RIGHT_CTRL,
#         Key.LEFT_CTRL:            Key.LEFT_META,
#         Key.RIGHT_META:           Key.RIGHT_CTRL,
#         Key.RIGHT_CTRL:           Key.RIGHT_META,
#     },
#     when = lambda ctx: ctx.wm_class.casefold() not in terminals
# )


#######################################################################
###                                                                 ###
###                                                                 ###
###      ███    ██ ██    ██ ███    ███ ██████   █████  ██████       ###
###      ████   ██ ██    ██ ████  ████ ██   ██ ██   ██ ██   ██      ###
###      ██ ██  ██ ██    ██ ██ ████ ██ ██████  ███████ ██   ██      ###
###      ██  ██ ██ ██    ██ ██  ██  ██ ██      ██   ██ ██   ██      ###
###      ██   ████  ██████  ██      ██ ██      ██   ██ ██████       ###
###                                                                 ###
###                                                                 ###
#######################################################################

modmap(
    "Always on Numpad",
    {
        # Make numpad be a numpad regardless of
        # Numlock state (like an Apple keyboard in macOS)
        Key.KP1:                    Key.KEY_1,
        Key.KP2:                    Key.KEY_2,
        Key.KP3:                    Key.KEY_3,
        Key.KP4:                    Key.KEY_4,
        Key.KP5:                    Key.KEY_5,
        Key.KP6:                    Key.KEY_6,
        Key.KP7:                    Key.KEY_7,
        Key.KP8:                    Key.KEY_8,
        Key.KP9:                    Key.KEY_9,
        Key.KP0:                    Key.KEY_0,
        Key.KPDOT:                  Key.DOT,
        Key.KPENTER:                Key.ENTER,
    }
)


###########################################################
###                                                     ###
###                                                     ###
###      ██    ██ ██    ██ ██████  ███████ ██████        ###
###      ██    ██  ██  ██  ██   ██ ██      ██   ██      ###
###      ████████   ████   ██████  ██████  █████         ###
###      ██    ██    ██    ██      ██      ██  ██       ###
###      ██    ██    ██    ██      ███████ ██   ██      ###
###                                                     ###
###                                                     ###
###########################################################


keymap(
    """
    Hyper key shortcuts

    This is here to help the built-in keyboard on the macbook
    to match my customized mech keyboard with fancy keys
    """,
    {
        # Hyper keys
        C("Hyper-H"):     C("Left"),
        C("Hyper-J"):     C("Down"),
        C("Hyper-K"):     C("Up"),
        C("Hyper-L"):     C("Right"),
        C("Hyper-U"):     C("Volumedown"),
        C("Hyper-I"):     C("Volumeup"),
        C("Hyper-O"):     C("Mute"),
        C("Hyper-Y"):     C("Shift-Alt-Super-Y"),  # Toggle tiling mode
        C("Hyper-1"):     switch_to_workspace(1),  # Change workspace
        C("Hyper-2"):     switch_to_workspace(2),  # Change workspace
        C("Hyper-3"):     switch_to_workspace(3),  # Change workspace
        C("Hyper-4"):     switch_to_workspace(4),  # Change workspace
        C("Hyper-5"):     switch_to_workspace(5),  # Change workspace
        C("Hyper-6"):     switch_to_workspace(6),  # Change workspace
        C("Hyper-7"):     switch_to_workspace(7),  # Change workspace
        C("Hyper-8"):     switch_to_workspace(8),  # Change workspace
        C("Hyper-9"):     switch_to_workspace(9),  # Change workspace
        C("Hyper-0"):     switch_to_workspace(10),  # Change workspace

        C("C-Shift-Alt-1"):     switch_to_workspace(1),  # Change workspace
        C("C-Shift-Alt-2"):     switch_to_workspace(2),  # Change workspace
        C("C-Shift-Alt-3"):     switch_to_workspace(3),  # Change workspace
        C("C-Shift-Alt-4"):     switch_to_workspace(4),  # Change workspace
        C("C-Shift-Alt-5"):     switch_to_workspace(5),  # Change workspace
        C("C-Shift-Alt-6"):     switch_to_workspace(6),  # Change workspace
        C("C-Shift-Alt-7"):     switch_to_workspace(7),  # Change workspace
        C("C-Shift-Alt-8"):     switch_to_workspace(8),  # Change workspace
        C("C-Shift-Alt-9"):     switch_to_workspace(9),  # Change workspace
        C("C-Shift-Alt-0"):     switch_to_workspace(10),  # Change workspace

        C("Hyper-Comma"): [bind, C("C-Shift-Tab")],
        C("Hyper-Dot"):   [bind, C("C-Tab")],

        C("Hyper-Alt-I"): C("Shift-Alt-Super-I"), # maximize window
        C("Hyper-Alt-H"): C("Shift-Alt-Super-H"), # move window to left
        C("Hyper-Alt-L"): C("Shift-Alt-Super-L"), # move window to right
    },
    when = class_not_in_group(remotes)
)

keymap(
    """
    General global shortcuts
    """,
    {
        C("Super-Dot"): open_or_focus('wezterm', 'jonathan'),
    },
    when = class_not_in_group(remotes)
)



###################################################################################
###                                                                             ###
###                                                                             ###
###      ███    ███ ██ ███████  ██████      █████  ██████  ██████  ███████      ###
###      ████  ████ ██ ██      ██          ██   ██ ██   ██ ██   ██ ██           ###
###      ██ ████ ██ ██ ███████ ██          ███████ ██████  ██████  ███████      ###
###      ██  ██  ██ ██      ██ ██          ██   ██ ██      ██           ██      ###
###      ██      ██ ██ ███████  ██████     ██   ██ ██      ██      ███████      ###
###                                                                             ###
###                                                                             ###
###################################################################################

keymap("GNOME image viewer",{
    C("Super-i"):                  C("Alt-Enter"),                 # Image properties
}, when = wm_class_match("eog"))



####################################################################################################
###                                                                                              ###
###                                                                                              ###
###     ███████ ██ ███    ██ ██████  ███████ ██████      ███    ███  ██████  ██████  ███████     ###
###     ██      ██ ████   ██ ██   ██ ██      ██   ██     ████  ████ ██    ██ ██   ██ ██          ###
###     █████   ██ ██ ██  ██ ██   ██ █████   ██████      ██ ████ ██ ██    ██ ██   ██ ███████     ###
###     ██      ██ ██  ██ ██ ██   ██ ██      ██   ██     ██  ██  ██ ██    ██ ██   ██      ██     ###
###     ██      ██ ██   ████ ██████  ███████ ██   ██     ██      ██  ██████  ██████  ███████     ###
###                                                                                              ###
###                                                                                              ###
####################################################################################################

keymap(
    """
    Keybindings overrides for Nautilus (used in Gnome)
    """,
    {
        C("Super-KEY_1"):              C("C-KEY_2"),                   # View as Icons
        C("Super-KEY_2"):              C("C-KEY_1"),                   # View as List (Detailed)
        C("Super-C-O"):                C("Shift-Enter"),               # Open in new window (disable line below)
        C("Super-comma"):              C("Super-comma"),               # Overrides "Open preferences dialog" shortcut below
        C("Super-F"):                  C("Super-F"),                   # Don't toggle Enter key, pass Cmd+F
    },
    when = wm_class_match("(org\.gnome\.)?nautilus")
)

# Keybindings overrides for GNOME XDG "Save As" and "Open File" dialogs in Firefox
keymap(
    """
    XDG file dialogs
    """,
    {
        C("Super-Left"):               C("Alt-Left"),                  # Go Back
        C("Super-Right"):              C("Alt-Right"),                 # Go Forward
        C("Super-Up"):                 C("Alt-Up"),                    # Go Up dir
        C("Super-Down"):               C("Enter"),                     # Go Down dir (open folder/file) [universal]
    },
    when = lambda ctx: ctx.wm_class == "xdg-desktop-portal-gnome" and (ctx.wm_name == "Open File" or ctx.wm_name == "Save As")
)


keymap(
    """
    General file manager keys
    """,
    {
        C("Super-i"):                  C("Alt-Enter"),                 # File properties dialog (Get Info)
        C("Super-comma"):             [C("Alt-E"),C("N")],             # Open preferences dialog
        C("Shift-Super-dot"):          C("Super-H"),                      # Show/hide hidden files ("dot" files)

        ###  Navigation ###
        C("Super-Left_Brace"):         C("Alt-Left"),                  # Go Back
        C("Super-Right_Brace"):        C("Alt-Right"),                 # Go Forward
        C("Super-Left"):               C("Alt-Left"),                  # Go Back
        C("Super-Right"):              C("Alt-Right"),                 # Go Forward
        C("Super-Up"):                 C("Alt-Up"),                    # Go Up dir
        # C("Super-Down"):               C("Alt-Down"),                  # Go Down dir (only works on folders) [not universal]
        # C("Super-Down"):               C("Super-O"),                      # Go Down dir (open folder/file) [not universal]
        C("Super-Down"):               C("Enter"),                     # Go Down dir (open folder/file) [universal]
        C("Shift-Super-Left_Brace"):   C("C-Page_Up"),                 # Go to prior tab
        C("Shift-Super-Right_Brace"):  C("C-Page_Down"),               # Go to next tab
        C("Shift-Super-Left"):         C("C-Page_Up"),                 # Go to prior tab
        C("Shift-Super-Right"):        C("C-Page_Down"),               # Go to next tab
        C("Super-C-o"):            C("Shift-Super-o"),                # Open in new window (or tab, depends) [not universal]
        C("Super-Backspace"):          C("Delete"),	                # Move to Trash (delete)
        C("Super-Delete"):             None,                           # Block Ctrl+Delete from performing any action (error in macOS)
    },
    when = class_in_group(filemanagers)
)

####################################################################################
###                                                                              ###
###                                                                              ###
###      ██████  ██████   ██████  ██     ██ ███████ ███████ ██████  ███████      ###
###      ██   ██ ██   ██ ██    ██ ██     ██ ██      ██      ██   ██ ██           ###
###      ██████  ██████  ██    ██ ██  █  ██ ███████ █████   ██████  ███████      ###
###      ██   ██ ██   ██ ██    ██ ██ ███ ██      ██ ██      ██   ██      ██      ###
###      ██████  ██   ██  ██████   ███ ███  ███████ ███████ ██   ██ ███████      ###
###                                                                              ###
###                                                                              ###
####################################################################################

# Open preferences in browsers
keymap(
    "Firefox",
    {
        C("C-comma"):    [C("C-t"),usleep(5),ST("about"),C("Shift-SEMICOLON"),ST("preferences"),C("Enter")],
        C("Shift-Super-N"): C("Shift-Super-P"),                # Open private window with Cmd+Shift+N like other browsers
    },
    when = wm_class_match("firefox")
)

keymap(
    """
    Chrome and Chrome-like browsers
    """,
    {
        C("C-comma"):              [C("Alt-e"), C("s"),C("Enter")], # Open preferences
        C("Super-q"):                  C("Alt-F4"),                    # Quit Chrome(s) browsers with Cmd+Q
        # C("Super-Left"):               C("Alt-Left"),                  # Page nav: Back to prior page in history (conflict with wordwise)
        # C("Super-Right"):              C("Alt-Right"),                 # Page nav: Forward to next page in history (conflict with wordwise)
        C("Super-Left_Brace"):         C("Alt-Left"),                  # Page nav: Back to prior page in history
        C("Super-Right_Brace"):        C("Alt-Right"),                 # Page nav: Forward to next page in history
    },
    when = class_in_group(chromes)
    )

keymap(
    """
    Keybindings for general web browsers
    """,
    {
        C("Alt-Super-I"):              C("Shift-Super-I"),                # Dev tools
        # C("Alt-Super-J"):              C("Shift-Super-J"),                # Dev tools
        C("Super-Key_1"):              C("Alt-Key_1"),                 # Jump to Tab #1-#8
        C("Super-Key_2"):              C("Alt-Key_2"),
        C("Super-Key_3"):              C("Alt-Key_3"),
        C("Super-Key_4"):              C("Alt-Key_4"),
        C("Super-Key_5"):              C("Alt-Key_5"),
        C("Super-Key_6"):              C("Alt-Key_6"),
        C("Super-Key_7"):              C("Alt-Key_7"),
        C("Super-Key_8"):              C("Alt-Key_8"),
        C("Super-Key_9"):              C("Alt-Key_9"),                 # Jump to last tab
        # Enable Cmd+Option+Left/Right for tab navigation
        C("Super-Alt-Left"):           C("C-Page_Up"),                 # Go to prior tab
        C("Super-Alt-Right"):          C("C-Page_Down"),               # Go to next tab
        # Enable Ctrl+PgUp/PgDn for tab navigation
        C("Super-Page_Up"):         C("C-Page_Up"),                 # Go to prior tab
        C("Super-Page_Down"):       C("C-Page_Down"),               # Go to next tab
        # Use Cmd+Braces keys for tab navigation instead of page navigation
        # C("C-Left_Brace"):        C("C-Page_Up"),
        # C("C-Right_Brace"):       C("C-Page_Down"),
    },
    when = class_in_group(browsers)
)

######################################################################
###                                                                ###
###                                                                ###
###      ██████  ██  █████  ██       ██████   ██████  ███████      ###
###      ██   ██ ██ ██   ██ ██      ██    ██ ██       ██           ###
###      ██   ██ ██ ███████ ██      ██    ██ ██   ███ ███████      ###
###      ██   ██ ██ ██   ██ ██      ██    ██ ██    ██      ██      ###
###      ██████  ██ ██   ██ ███████  ██████   ██████  ███████      ###
###                                                                ###
###                                                                ###
######################################################################
# Fixes for the problem of modal dialogs and other
# "child" windows failing to close with Esc key

keymap("Modal dialog fix - GNOME Settings child windows",{
    C("Esc"):                  C("Alt-F4"),
}, when = lambda ctx: ctx.wm_class == "Gnome-control-center" and ctx.wm_name != "Settings")

keymap("Modal dialog fix - Totem child windows",{
    C("Esc"):                  C("Alt-F4"),
}, when = lambda ctx: ctx.wm_class == "Totem" and ctx.wm_name != "Videos")


#########################################################################
###                                                                   ###
###                                                                   ###
###      ████████  █████  ██████      ███    ██  █████  ██    ██      ###
###         ██    ██   ██ ██   ██     ████   ██ ██   ██ ██    ██      ###
###         ██    ███████ ██████      ██ ██  ██ ███████ ██    ██      ###
###         ██    ██   ██ ██   ██     ██  ██ ██ ██   ██  ██  ██       ###
###         ██    ██   ██ ██████      ██   ████ ██   ██   ████        ###
###                                                                   ###
###                                                                   ###
#########################################################################
# Various fixes for supporting tab navigation
# shortcuts like C-Tab and C-Shift-Tab

# Tab navigation overrides for tabbed UI apps that use Ctrl+Alt+PgUp/PgDn instead of Ctrl+PgUp/PgDn
keymap(
    "Gedit & friends",
    {
        C("C-Shift-Tab"):  C("C-Alt-Page_Up"),   # Go to prior tab (Left)
        C("C-Tab"):        C("C-Alt-Page_Down"), # Go to next tab (Right)
    },
    when = wm_class_match("gedit")
)

#########################################################################
###                                                                   ###
###                                                                   ###
###  ████████ ███████ ██████  ███    ███ ██ ███    ██  █████  ██      ###
###     ██    ██      ██   ██ ████  ████ ██ ████   ██ ██   ██ ██      ###
###     ██    █████   ██████  ██ ████ ██ ██ ██ ██  ██ ███████ ██      ###
###     ██    ██      ██   ██ ██  ██  ██ ██ ██  ██ ██ ██   ██ ██      ###
###     ██    ███████ ██   ██ ██      ██ ██ ██   ████ ██   ██ ███████ ###
###                                                                   ###
###                                                                   ###
#########################################################################

# I use Wezterm, which properly recognizes the Super key, so
# there's not many overrides needed here. If you use another
# terminal, you might want to override Super with C-Shift for
# all keys

keymap(
    "All Terminals",
    {
        ### wordwise overrides of general GUI block
        C("Alt-Backspace"):     C("Alt-Shift-Backspace"),       # Wordwise delete word left of cursor in terminals
        C("Alt-Delete"):        [ C("Esc"), C("d") ],           # Wordwise delete word right of cursor in terminals
        C("Super-Backspace"):   C("C-u"),                       # Wordwise delete line left of cursor in terminals
        C("Super-Delete"):      C("C-k"),                       # Wordwise delete line right of cursor in terminals
    },
    when = class_in_group(terminals)
)


############################################################################
###                                                                      ###
###                                                                      ###
###       ██████  ███████ ███    ██ ███████ ██████   █████  ██           ###
###      ██       ██      ████   ██ ██      ██   ██ ██   ██ ██           ###
###      ██   ███ █████   ██ ██  ██ █████   ██████  ███████ ██           ###
###      ██    ██ ██      ██  ██ ██ ██      ██   ██ ██   ██ ██           ###
###       ██████  ███████ ██   ████ ███████ ██   ██ ██   ██ ███████      ###
###                                                                      ###
###                                                                      ###
############################################################################


keymap(
    """
    General GUI

    These are the typical remaps for all apps (including terminals)
    """,
    {
        # General usage keys
        C("Super-W"): C("C-W"),
        C("Super-T"): C("C-T"),
        C("Super-Shift-T"): C("C-Shift-T"),
        C("Super-P"): C("C-P"),
        C("Super-A"): C("C-A"),
        C("Super-F"): C("C-F"),
        C("Super-G"): C("C-G"),
        C("Super-Shift-G"): C("C-Shift-G"),
        C("Super-L"): C("C-L"),
        C("Super-Z"): C("C-Z"),
        C("Super-Shift-Z"): C("C-Shift-Z"),
        C("Super-X"): C("C-X"),
        C("Super-C"): C("C-C"),
        C("Super-V"): C("C-V"),
        C("Super-N"): C("C-N"),

        # Wordwise
        C("Super-Left"):         C("Home"),                      # Beginning of Line
        C("Shift-Super-Left"):   C("Shift-Home"),                # Select all to Beginning of Line
        C("Super-Right"):        C("End"),                       # End of Line
        C("Shift-Super-Right"):  C("Shift-End"),                 # Select all to End of Line
        # C("Super-Left"):       C("C-LEFT_BRACE"),              # Firefox-nw - Back
        # C("Super-Right"):      C("C-RIGHT_BRACE"),             # Firefox-nw - Forward
        C("Super-Up"):           C("C-Home"),                    # Beginning of File
        C("Shift-Super-Up"):     C("C-Shift-Home"),              # Select all to Beginning of File
        C("Super-Down"):         C("C-End"),                     # End of File
        C("Shift-Super-Down"):   C("C-Shift-End"),               # Select all to End of File
        C("Super-Backspace"):    C("C-Backspace"),               # Delete Left Word of Cursor
        C("Super-Delete"):       C("C-Delete"),                  # Delete Right Word of Cursor
        C("Alt-Backspace"):      C("C-Backspace"),               # Default not-chromebook
        C("Super-Backspace"):    C("C-Shift-Backspace"),         # Delete Entire Line Left of Cursor
        C("Alt-Delete"):         C("C-Delete"),                  # Delete Right Word of Cursor
    },
    when = class_not_in_group(terminals)
)
