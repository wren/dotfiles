# -*- coding: utf-8 -*-
# autostart = false

import re
from subprocess import run
from keyszer.config_api import *
from keyszer.lib.logger import *

# REMOVE THIS AFTER v0.7 KEYSZER RELEASE - WILL NO LONGER BE NEEDED
from keyszer.config_api import to_US_keystrokes, unicode_keystrokes

# Keyszer-specific config settings - REMOVE OR SET TO DEFAULTS FOR DISTRIBUTION
dump_diagnostics_key(Key.F7)    # default key: F15
emergency_eject_key(Key.F8)     # default key: F16
timeouts(
    multipurpose = 1,           # default: 1 sec
    suspend = 0.1,              # default: 1 sec
)



###@########  LISTS OF WM_CLASS STRINGS ##############
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
terminals = [
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
]
terminals = [term.casefold() for term in terminals]
termStr = "|".join(f'^{x}$' for x in terminals)

mscodes = ["code","vscodium"]
codeStr = "|".join(f'^{x}$' for x in mscodes)

# Add remote desktop clients & VM software here
# Ideally we'd only exclude the client window,
# but that may not be easily done.
remotes = [
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
]
remotes = [client.casefold() for client in remotes]

# Add remote desktop clients & VMs for no remapping
terminals.extend(remotes)
mscodes.extend(remotes)

# Use for browser specific hotkeys
browsers = [
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
]
browsers = [browser.casefold() for browser in browsers]
browserStr = "|".join(str('^'+x+'$') for x in browsers)

chromes = [
    "Chromium",
    "Chromium-browser",
    "Google-chrome",
    "microsoft-edge",
    "microsoft-edge-dev",
]
chromes = [chrome.casefold() for chrome in chromes]
chromeStr = "|".join(str('^'+x+'$') for x in chromes)

# edges = ["microsoft-edge-dev","microsoft-edge"]
# edges = [edge.casefold() for edge in edges]
# edgeStr = "|".join(str('^'+x+'$') for x in edges)

filemanagers = [
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
]
filemanagers = [filemanager.casefold() for filemanager in filemanagers]
filemanStr = "|".join(str('^'+x+'$') for x in filemanagers)


#################################  MODMAPS  ####################################
###                                                                          ###
###                                                                          ###
###      ███    ███  ██████  ██████  ███    ███  █████  ██████  ███████      ###
###      ████  ████ ██    ██ ██   ██ ████  ████ ██   ██ ██   ██ ██           ###
###      ██ ████ ██ ██    ██ ██   ██ ██ ████ ██ ███████ ██████  ███████      ###
###      ██  ██  ██ ██    ██ ██   ██ ██  ██  ██ ██   ██ ██           ██      ###
###      ██      ██  ██████  ██████  ██      ██ ██   ██ ██      ███████      ###
###                                                                          ###
###                                                                          ###
################################################################################
### Modmaps turn a key into a different key as long as the modmap is active
### The modified key can be used in shortcut combos as the new key

# multipurpose_modmap(
    # {Key.ENTER:                 [Key.ENTER, Key.RIGHT_CTRL]     # Enter2Cmd
    # {Key.CAPSLOCK:              [Key.ESC, Key.RIGHT_CTRL]       # Caps2Esc
    # {Key.LEFT_META:             [Key.ESC, Key.RIGHT_CTRL]       # Caps2Esc - Chromebook
    # {                                                             # Placeholder
# })

modmap("Conditional modmap - Mac Numpad feature",{
    # Make numpad be a numpad regardless of Numlock state (like an Apple keyboard in macOS)
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
}, when = lambda _: MAC_NUMPAD_ON)


modmap("Conditional modmap - GTK3 numpad nav keys fix",{

    # Make numpad nav keys work correctly in GTK3 apps
    # Key.KP5:                    Key.X,                          # GTK3 numpad fix - TEST TO SEE IF WORKING
    # Numpad PgUp/PgDn/Home/End keys
    Key.KP9:                    Key.PAGE_UP,
    Key.KP3:                    Key.PAGE_DOWN,
    Key.KP7:                    Key.HOME,
    Key.KP1:                    Key.END,
    # Numpad arrow keys
    Key.KP8:                    Key.UP,
    Key.KP2:                    Key.DOWN,
    Key.KP4:                    Key.LEFT,
    Key.KP6:                    Key.RIGHT,
    # Numpad Insert/Delete/Enter keys
    Key.KP0:                    Key.INSERT,
    Key.KPDOT:                  Key.DELETE,
    Key.KPENTER:                Key.ENTER,

}, when = lambda ctx: not ctx.numlock_on and not MAC_NUMPAD_ON)


modmap("Conditional modmap - Media Arrows Fix",{

    # Fix arrow keys with media functions instead of PgUp/PgDn/Home/End
    Key.PLAYPAUSE:              Key.PAGE_UP,
    Key.STOPCD:                 Key.PAGE_DOWN,
    Key.PREVIOUSSONG:           Key.HOME,
    Key.NEXTSONG:               Key.END,

}, when = lambda _: _media_arrows_fix is True)


# [Global Terminals Conditional modmap] Change modifier keys in certain applications
modmap("Conditional modmap - Terminals",{
    # - IBM
    # Key.LEFT_ALT: Key.RIGHT_CTRL,     # IBM
    # # Left Ctrl Stays Left Ctrl
    # Key.CAPSLOCK: Key.LEFT_ALT,       # IBM
    # Key.RIGHT_ALT: Key.RIGHT_CTRL,    # IBM - Multi-language (Remove)
    # Key.RIGHT_CTRL: Key.RIGHT_ALT,    # IBM
    # # Right Meta does not exist on chromebooks

    # Key.RIGHT_ALT: Key.RIGHT_CTRL,  # IBM - Multi-language (Remove)
    # Key.RIGHT_CTRL: Key.RIGHT_ALT,  # IBM - Multi-language (Remove)

    # - Chromebook
    # Key.LEFT_ALT: Key.RIGHT_CTRL,     # Chromebook
    # # Left Ctrl Stays Left Ctrl
    # Key.LEFT_META: Key.LEFT_ALT,      # Chromebook
    # Key.RIGHT_ALT: Key.RIGHT_CTRL,    # Chromebook - Multi-language (Remove)
    # Key.RIGHT_CTRL: Key.RIGHT_ALT,    # Chromebook
    # # Right Meta does not exist on chromebooks

    # - Default Mac/Win
    # -- Default Win
    # Key.LEFT_ALT: Key.RIGHT_CTRL,   # WinMac
    # Key.LEFT_META: Key.LEFT_ALT,    # WinMac
    # Key.LEFT_CTRL: Key.LEFT_CTRL,   # WinMac
    # Key.RIGHT_ALT: Key.RIGHT_CTRL,  # WinMac - Multi-language (Remove)
    # Key.RIGHT_META: Key.RIGHT_ALT,  # WinMac - Multi-language (Remove)
    # Key.RIGHT_CTRL: Key.LEFT_CTRL,  # WinMac - Multi-language (Remove)

    # - Mac Only
    Key.LEFT_META: Key.RIGHT_CTRL,  # Mac
    # Left Ctrl Stays Left Ctrl
    Key.RIGHT_META: Key.RIGHT_CTRL, # Mac - Multi-language (Remove)
    Key.RIGHT_CTRL: Key.LEFT_CTRL,  # Mac - Multi-language (Remove)
}, when = lambda ctx: ctx.wm_class.casefold() in terminals)


# [Global GUI modmap] Change modifier keys as in xmodmap
modmap("General global modmap",{

    # Key.CAPSLOCK:             Key.RIGHT_CTRL,                 # Caps2Cmd
    # Key.LEFT_META:            Key.RIGHT_CTRL,                 # Caps2Cmd - Chromebook

    # - IBM
    # Key.LEFT_ALT:             Key.RIGHT_CTRL,                 # IBM
    # Key.LEFT_CTRL:            Key.LEFT_ALT,                   # IBM
    # Key.CAPSLOCK:             Key.LEFT_META,                  # IBM
    # Key.RIGHT_ALT:            Key.RIGHT_CTRL,                 # IBM - Multi-language (Remove)
    # Key.RIGHT_CTRL:           Key.RIGHT_ALT,                  # IBM - Multi-language (Remove)

    # - Chromebook
    # Key.LEFT_ALT:             Key.RIGHT_CTRL,                 # Chromebook
    # Key.LEFT_CTRL:            Key.LEFT_ALT,                   # Chromebook
    # Key.RIGHT_ALT:            Key.RIGHT_CTRL,                 # Chromebook - Multi-language (Remove)
    # Key.RIGHT_CTRL:           Key.RIGHT_ALT,                  # Chromebook - Multi-language (Remove)

    # - Default Mac/Win
    # -- Default Win
    # Key.LEFT_ALT:               Key.RIGHT_CTRL,                 # WinMac
    # Key.LEFT_META:              Key.LEFT_ALT,                   # WinMac
    # Key.LEFT_CTRL:              Key.LEFT_META,                  # WinMac
    # Key.RIGHT_ALT:              Key.RIGHT_CTRL,                 # WinMac - Multi-language (Remove)
    # Key.RIGHT_META:             Key.RIGHT_ALT,                  # WinMac - Multi-language (Remove)
    # Key.RIGHT_CTRL:             Key.RIGHT_META,                 # WinMac - Multi-language (Remove)

    # - Mac Only
    Key.LEFT_META:            Key.RIGHT_CTRL,                 # Mac
    Key.LEFT_CTRL:            Key.LEFT_META,                  # Mac
    Key.RIGHT_META:           Key.RIGHT_CTRL,                 # Mac - Multi-language (Remove)
    Key.RIGHT_CTRL:           Key.RIGHT_META,                 # Mac - Multi-language (Remove)

}, when = lambda ctx: ctx.wm_class.casefold() not in terminals)



######################################################################################################
###                                                                                                ###
###                                                                                                ###
###      ███    ███  █████   ██████     ███    ██ ██    ██ ███    ███ ██████   █████  ██████       ###
###      ████  ████ ██   ██ ██          ████   ██ ██    ██ ████  ████ ██   ██ ██   ██ ██   ██      ###
###      ██ ████ ██ ███████ ██          ██ ██  ██ ██    ██ ██ ████ ██ ██████  ███████ ██   ██      ###
###      ██  ██  ██ ██   ██ ██          ██  ██ ██ ██    ██ ██  ██  ██ ██      ██   ██ ██   ██      ###
###      ██      ██ ██   ██  ██████     ██   ████  ██████  ██      ██ ██      ██   ██ ██████       ###
###                                                                                                ###
###                                                                                                ###
######################################################################################################

# Force the numpad to always be a numpad, like a Mac keyboard on macOS
# Numlock key becomes "Clear" key for use with calculator (sends Escape)
# Toggle feature on/off with Option+Numlock (Fn+Numlock might work on Apple keyboards that have Fn key)
# Set MAC_NUMPAD_ON var to "False" (no quotes) to disable by default
MAC_NUMPAD_ON = True

def toggle_mac_numpad():
    """Toggle the value of the MAC_NUMPAD_ON variable"""
    global MAC_NUMPAD_ON
    MAC_NUMPAD_ON = not MAC_NUMPAD_ON


keymap(lambda wm_class: wm_class.casefold() not in remotes,{
    C("Alt-Numlock"):           toggle_mac_numpad,            # Turn the Mac Numpad feature on and off
    C("Fn-Numlock"):            toggle_mac_numpad,            # Turn the Mac Numpad feature on and off
},"Mac Numpad toggle")

keymap(lambda wm_class: wm_class.casefold() not in remotes and MAC_NUMPAD_ON,{
    C("Numlock"):               C("Esc"),                       # Turn Numlock key into "Clear" key for calculator apps
},"Mac Numpad - Numlock is Clear")



###################################################################################################
###                                                                                             ###
###                                                                                             ###
###                                                                                             ###
###       ██████  ██████  ████████ ███████ ██████  ███████  ██████       ██    ██ ███████       ###
###      ██    ██ ██   ██    ██    ██      ██   ██ ██      ██            ██    ██ ██            ###
###      ██    ██ ██████     ██    ███████ ██████  █████   ██      █████ ██    ██ ███████       ###
###      ██    ██ ██         ██         ██ ██      ██      ██            ██    ██      ██       ###
###       ██████  ██         ██    ███████ ██      ███████  ██████        ██████  ███████       ###
###                                                                                             ###
###                                                                                             ###
###                                                                                             ###
###################################################################################################

###########   START OF OPTION KEY SPECIAL CHARACTER ENTRY SCHEME - US LAYOUT   #############
############################################################################################
### Full list of special characters on Apple US keyboard layout:
### https://github.org/RedBearAK/optspecialchars

# Variable to enable Option Key Special Character entry scheme
_optspecialchars_US = True

# Short names for the string and Unicode processing helper functions
ST = to_US_keystrokes
UC = unicode_keystrokes

from subprocess import run


def toggle_optspecialchars_US():
    """Toggle the value of the _optspecialchars_US variable"""
    # Needs "from subprocess import run" somewhere
    def _toggle_optspecialchars_US():
        global _optspecialchars_US
        _optspecialchars_US = not _optspecialchars_US
        if _optspecialchars_US:
            run('notify-send -u critical ALERT "Kinto OptSpecialChars-US is now ENABLED.\
                \rWill interfere with Alt & Alt+Shift shortcuts!\
                \rDisable with Shift+Opt+Cmd+O."', shell=True)
            print("(DD) OptSpecialChars-US is now ENABLED.", flush=True)
        else:
            run('notify-send ALERT "Kinto OptSpecialChars-US is now DISABLED."', shell=True)
            print("(DD) OptSpecialChars-US is now DISABLED.", flush=True)

    return _toggle_optspecialchars_US


################################################################
# Set this variable to False to disable the alert that appears
# when using Apple logo shortcut (Shift+Option+K)
_applelogoalert = True


def apple_logo_alert():
    """Show a notification about needing Baskerville Old Face font for displaying Apple logo"""
    def _apple_logo_alert():
    # Needs "from subprocess import run" somewhere
        global _applelogoalert
        if _applelogoalert:
            run('notify-send -u critical ALERT "Apple logo requires Baskerville Old Face font.\
                \rTo disable warning, change \\"_applelogoalert\\" \
                \rvariable value in config file to \\"False\\"."', shell=True)

    return _apple_logo_alert


ac_Chr = None
_ac_Chr = None


def set_dead_key_char(hex_unicode_addr):
    """Set the value of the dead keys accent character variable and its alternate."""
    def fn():
        global ac_Chr
        global _ac_Chr
        if hex_unicode_addr == None or hex_unicode_addr == 0x0000:
            pass
        else:
            _ac_Chr = hex_unicode_addr
        debug(f"setDK | dead key set to: {hex_unicode_addr}")
        ac_Chr = hex_unicode_addr

    return fn


def get_dead_key_char():
    """Get the value of the alternate dead key accent character variable, and print/type the character."""
    def fn():
        global _ac_Chr
        return UC(_ac_Chr)

    return fn


setDK = set_dead_key_char
getDK = get_dead_key_char

deadkeys_US = [
    0x0060,                     # Dead Keys Accent: Grave
    0x00B4,                     # Dead Keys Accent: Acute
    0x00A8,                     # Dead Keys Accent: Umlaut
    0x02C6,                     # Dead Keys Accent: Circumflex
    0x02DC,                     # Dead Keys Accent: Tilde
]

keymap("DK - Grave", {
    C("Grave"):                [UC(0x0060),UC(0x0060)],         # `` Output two Graves if Grave is next key (special case)
    C("A"):                     UC(0x00E0),                     # à Latin Small a with Grave
    C("E"):                     UC(0x00E8),                     # è Latin Small e with Grave
    C("I"):                     UC(0x00EC),                     # ì Latin Small i with Grave
    C("O"):                     UC(0x00F2),                     # ò Latin Small o with Grave
    C("U"):                     UC(0x00F9),                     # ù Latin Small u with Grave
    C("Shift-A"):               UC(0x00C0),                     # À Latin Capital A with Grave
    C("Shift-E"):               UC(0x00C8),                     # È Latin Capital E with Grave
    C("Shift-I"):               UC(0x00CC),                     # Ì Latin Capital I with Grave
    C("Shift-O"):               UC(0x00D2),                     # Ò Latin Capital O with Grave
    C("Shift-U"):               UC(0x00D9),                     # Ù Latin Capital U with Grave
}, when = lambda _: ac_Chr == 0x0060)
keymap("DK - Acute", {
    C("A"):                     UC(0x00E1),                     # á Latin Small a with Acute
    C("E"):                     UC(0x00E9),                     # é Latin Small e with Acute
    C("I"):                     UC(0x00ED),                     # í Latin Small i with Acute
    C("O"):                     UC(0x00F3),                     # ó Latin Small o with Acute
    C("U"):                     UC(0x00FA),                     # ú Latin Small u with Acute
    C("Shift-A"):               UC(0x00C1),                     # Á Latin Capital A with Acute
    C("Shift-E"):               UC(0x00C9),                     # É Latin Capital E with Acute
    C("Shift-I"):               UC(0x00CD),                     # Í Latin Capital I with Acute
    C("Shift-O"):               UC(0x00D3),                     # Ó Latin Capital O with Acute
    C("Shift-U"):               UC(0x00DA),                     # Ú Latin Capital U with Acute
}, when = lambda _: ac_Chr == 0x00B4)
keymap("DK - Umlaut", {
    C("A"):                     UC(0x00E4),                     # ä Latin Small a with Umlaut
    C("E"):                     UC(0x00EB),                     # ë Latin Small e with Umlaut
    C("I"):                     UC(0x00EF),                     # ï Latin Small i with Umlaut
    C("O"):                     UC(0x00F6),                     # ö Latin Small o with Umlaut
    C("U"):                     UC(0x00FC),                     # ü Latin Small u with Umlaut
    C("Y"):                     UC(0x00FF),                     # ÿ Latin Small y with Umlaut
    C("Shift-A"):               UC(0x00C4),                     # Ä Latin Capital A with Umlaut
    C("Shift-E"):               UC(0x00CB),                     # Ë Latin Capital E with Umlaut
    C("Shift-I"):               UC(0x00CF),                     # Ï Latin Capital I with Umlaut
    C("Shift-O"):               UC(0x00D6),                     # Ö Latin Capital O with Umlaut
    C("Shift-U"):               UC(0x00DC),                     # Ü Latin Capital U with Umlaut
    C("Shift-Y"):               UC(0x0178),                     # Ÿ Latin Capital Y with Umlaut
}, when = lambda _: ac_Chr == 0x00A8)
keymap("DK - Circumflex", {
    C("A"):                     UC(0x00E2),                     # â Latin Small a with Circumflex
    C("E"):                     UC(0x00EA),                     # ê Latin Small e with Circumflex
    C("I"):                     UC(0x00EE),                     # î Latin Small i with Circumflex
    C("O"):                     UC(0x00F4),                     # ô Latin Small o with Circumflex
    C("U"):                     UC(0x00FB),                     # û Latin Small u with Circumflex
    C("Shift-A"):               UC(0x00C2),                     # Â Latin Capital A with Circumflex
    C("Shift-E"):               UC(0x00CA),                     # Ê Latin Capital E with Circumflex
    C("Shift-I"):               UC(0x00CE),                     # Î Latin Capital I with Circumflex
    C("Shift-O"):               UC(0x00D4),                     # Ô Latin Capital O with Circumflex
    C("Shift-U"):               UC(0x00DB),                     # Û Latin Capital U with Circumflex
}, when = lambda _: ac_Chr == 0x02C6)
keymap("DK - Tilde", {
    C("A"):                     UC(0x00E3),                     # ã Latin Small a with Tilde
    C("N"):                     UC(0x00F1),                     # ñ Latin Small n with Tilde
    C("O"):                     UC(0x00F5),                     # õ Latin Small o with Tilde
    C("Shift-A"):               UC(0x00C3),                     # Ã Latin Capital A with Tilde
    C("Shift-N"):               UC(0x00D1),                     # Ñ Latin Capital N with Tilde
    C("Shift-O"):               UC(0x00D5),                     # Õ Latin Capital O with Tilde
}, when = lambda _: ac_Chr == 0x02DC)

keymap("Escape actions for dead keys", {
    C("Esc"):                   [getDK(),setDK(None)],                              # Leave accent char if dead keys Escaped
    C("Space"):                 [getDK(),setDK(None)],                              # Leave accent char if user hits Space
    C("Delete"):                [getDK(),setDK(None)],                              # Leave accent char if user hits Delete
    C("Backspace"):             [getDK(),C("Backspace"),setDK(None)],               # Delete character if user hits Backspace
    C("Tab"):                   [getDK(),C("Tab"),setDK(None)],                     # Leave accent char, insert Tab
    C("Enter"):                 [getDK(),C("Enter"),setDK(None)],                   # Leave accent char, Enter key
    C("Up"):                    [getDK(),C("Up"),setDK(None)],                      # Leave accent char, up arrow
    C("Down"):                  [getDK(),C("Down"),setDK(None)],                    # Leave accent char, down arrow
    C("Left"):                  [getDK(),C("Left"),setDK(None)],                    # Leave accent char, left arrow
    C("Right"):                 [getDK(),C("Right"),setDK(None)],                   # Leave accent char, right arrow
    C("RC-Tab"):                [getDK(),bind,C("Alt-Tab"),setDK(None)],            # Leave accent char, task switch
    C("Shift-RC-Tab"):          [getDK(),bind,C("Shift-Alt-Tab"),setDK(None)],      # Leave accent char, task switch (reverse)
    C("RC-Grave"):              [getDK(),bind,C("Alt-Grave"),setDK(None)],          # Leave accent char, in-app window switch
    C("Shift-RC-Tab"):          [getDK(),bind,C("Shift-Alt-Grave"),setDK(None)],    # Leave accent char, in-app window switch (reverse)

    C("RC-z"):                  [getDK(),C("RC-z"),setDK(None)],                    # Leave accent char, undo
    C("RC-x"):                  [getDK(),C("RC-x"),setDK(None)],                    # Leave accent char, cut
    C("RC-c"):                  [getDK(),C("RC-c"),setDK(None)],                    # Leave accent char, copy
    C("RC-v"):                  [getDK(),C("RC-v"),setDK(None)],                    # Leave accent char, paste

    C("Alt-Grave"):             [getDK(),UC(0x0060),C("Shift-Left"),setDK(0x0060)], # Dead Key Accent: Grave
    C("Alt-E"):                 [getDK(),UC(0x00B4),C("Shift-Left"),setDK(0x00B4)], # Dead Key Accent: Acute
    C("Alt-U"):                 [getDK(),UC(0x00A8),C("Shift-Left"),setDK(0x00A8)], # Dead Key Accent: Umlaut
    C("Alt-I"):                 [getDK(),UC(0x02C6),C("Shift-Left"),setDK(0x02C6)], # Dead Key Accent: Circumflex
    C("Alt-N"):                 [getDK(),UC(0x02DC),C("Shift-Left"),setDK(0x02DC)], # Dead Key Accent: Tilde

    # Number keys row
    C("Key_1"):                 [getDK(),C("Key_1"),setDK(None)],
    C("Key_2"):                 [getDK(),C("Key_2"),setDK(None)],
    C("Key_3"):                 [getDK(),C("Key_3"),setDK(None)],
    C("Key_4"):                 [getDK(),C("Key_4"),setDK(None)],
    C("Key_5"):                 [getDK(),C("Key_5"),setDK(None)],
    C("Key_6"):                 [getDK(),C("Key_6"),setDK(None)],
    C("Key_7"):                 [getDK(),C("Key_7"),setDK(None)],
    C("Key_8"):                 [getDK(),C("Key_8"),setDK(None)],
    C("Key_9"):                 [getDK(),C("Key_9"),setDK(None)],
    C("Key_0"):                 [getDK(),C("Key_0"),setDK(None)],
    C("Minus"):                 [getDK(),C("Minus"),setDK(None)],
    C("Equal"):                 [getDK(),C("Equal"),setDK(None)],

    # Number keys row with Shift
    C("Shift-Grave"):           [getDK(),C("Shift-Grave"),setDK(None)],
    C("Shift-Key_1"):           [getDK(),C("Shift-Key_1"),setDK(None)],
    C("Shift-Key_2"):           [getDK(),C("Shift-Key_2"),setDK(None)],
    C("Shift-Key_3"):           [getDK(),C("Shift-Key_3"),setDK(None)],
    C("Shift-Key_4"):           [getDK(),C("Shift-Key_4"),setDK(None)],
    C("Shift-Key_5"):           [getDK(),C("Shift-Key_5"),setDK(None)],
    C("Shift-Key_6"):           [getDK(),C("Shift-Key_6"),setDK(None)],
    C("Shift-Key_7"):           [getDK(),C("Shift-Key_7"),setDK(None)],
    C("Shift-Key_8"):           [getDK(),C("Shift-Key_8"),setDK(None)],
    C("Shift-Key_9"):           [getDK(),C("Shift-Key_9"),setDK(None)],
    C("Shift-Key_0"):           [getDK(),C("Shift-Key_0"),setDK(None)],
    C("Shift-Minus"):           [getDK(),C("Shift-Minus"),setDK(None)],
    C("Shift-Equal"):           [getDK(),C("Shift-Equal"),setDK(None)],

    C("a"):                     [getDK(),C("a"),setDK(None)],
    C("b"):                     [getDK(),C("b"),setDK(None)],
    C("c"):                     [getDK(),C("c"),setDK(None)],
    C("d"):                     [getDK(),C("d"),setDK(None)],
    C("e"):                     [getDK(),C("e"),setDK(None)],
    C("f"):                     [getDK(),C("f"),setDK(None)],
    C("g"):                     [getDK(),C("g"),setDK(None)],
    C("h"):                     [getDK(),C("h"),setDK(None)],
    C("i"):                     [getDK(),C("i"),setDK(None)],
    C("j"):                     [getDK(),C("j"),setDK(None)],
    C("k"):                     [getDK(),C("k"),setDK(None)],
    C("l"):                     [getDK(),C("l"),setDK(None)],
    C("m"):                     [getDK(),C("m"),setDK(None)],
    C("n"):                     [getDK(),C("n"),setDK(None)],
    C("o"):                     [getDK(),C("o"),setDK(None)],
    C("p"):                     [getDK(),C("p"),setDK(None)],
    C("q"):                     [getDK(),C("q"),setDK(None)],
    C("r"):                     [getDK(),C("r"),setDK(None)],
    C("s"):                     [getDK(),C("s"),setDK(None)],
    C("t"):                     [getDK(),C("t"),setDK(None)],
    C("u"):                     [getDK(),C("u"),setDK(None)],
    C("v"):                     [getDK(),C("v"),setDK(None)],
    C("w"):                     [getDK(),C("w"),setDK(None)],
    C("x"):                     [getDK(),C("x"),setDK(None)],
    C("y"):                     [getDK(),C("y"),setDK(None)],
    C("z"):                     [getDK(),C("z"),setDK(None)],

    C("Shift-a"):               [getDK(),C("Shift-a"),setDK(None)],
    C("Shift-b"):               [getDK(),C("Shift-b"),setDK(None)],
    C("Shift-c"):               [getDK(),C("Shift-c"),setDK(None)],
    C("Shift-d"):               [getDK(),C("Shift-d"),setDK(None)],
    C("Shift-e"):               [getDK(),C("Shift-e"),setDK(None)],
    C("Shift-f"):               [getDK(),C("Shift-f"),setDK(None)],
    C("Shift-g"):               [getDK(),C("Shift-g"),setDK(None)],
    C("Shift-h"):               [getDK(),C("Shift-h"),setDK(None)],
    C("Shift-i"):               [getDK(),C("Shift-i"),setDK(None)],
    C("Shift-j"):               [getDK(),C("Shift-j"),setDK(None)],
    C("Shift-k"):               [getDK(),C("Shift-k"),setDK(None)],
    C("Shift-l"):               [getDK(),C("Shift-l"),setDK(None)],
    C("Shift-m"):               [getDK(),C("Shift-m"),setDK(None)],
    C("Shift-n"):               [getDK(),C("Shift-n"),setDK(None)],
    C("Shift-o"):               [getDK(),C("Shift-o"),setDK(None)],
    C("Shift-p"):               [getDK(),C("Shift-p"),setDK(None)],
    C("Shift-q"):               [getDK(),C("Shift-q"),setDK(None)],
    C("Shift-r"):               [getDK(),C("Shift-r"),setDK(None)],
    C("Shift-s"):               [getDK(),C("Shift-s"),setDK(None)],
    C("Shift-t"):               [getDK(),C("Shift-t"),setDK(None)],
    C("Shift-u"):               [getDK(),C("Shift-u"),setDK(None)],
    C("Shift-v"):               [getDK(),C("Shift-v"),setDK(None)],
    C("Shift-w"):               [getDK(),C("Shift-w"),setDK(None)],
    C("Shift-x"):               [getDK(),C("Shift-x"),setDK(None)],
    C("Shift-y"):               [getDK(),C("Shift-y"),setDK(None)],
    C("Shift-z"):               [getDK(),C("Shift-z"),setDK(None)],

    # Other punctuation keys
    C("Left_Brace"):            [getDK(),C("Left_Brace"),setDK(None)],
    C("Right_Brace"):           [getDK(),C("Right_Brace"),setDK(None)],
    C("Backslash"):             [getDK(),C("Backslash"),setDK(None)],

    C("Semicolon"):             [getDK(),C("Semicolon"),setDK(None)],
    C("Apostrophe"):            [getDK(),C("Apostrophe"),setDK(None)],

    C("Comma"):                 [getDK(),C("Comma"),setDK(None)],
    C("Dot"):                   [getDK(),C("Dot"),setDK(None)],
    C("Slash"):                 [getDK(),C("Slash"),setDK(None)],

    C("Shift-Left_Brace"):      [getDK(),C("Shift-Left_Brace"),setDK(None)],
    C("Shift-Right_Brace"):     [getDK(),C("Shift-Right_Brace"),setDK(None)],
    C("Shift-Backslash"):       [getDK(),C("Shift-Backslash"),setDK(None)],

    C("Shift-Semicolon"):       [getDK(),C("Shift-Semicolon"),setDK(None)],
    C("Shift-Apostrophe"):      [getDK(),C("Shift-Apostrophe"),setDK(None)],

    C("Shift-Comma"):           [getDK(),C("Shift-Comma"),setDK(None)],
    C("Shift-Dot"):             [getDK(),C("Shift-Dot"),setDK(None)],
    C("Shift-Slash"):           [getDK(),C("Shift-Slash"),setDK(None)],

}, when = lambda _: ac_Chr in deadkeys_US)


keymap("Disable Dead Keys",{
    # Nothing needs to be here. Tripwire keymap to disable active dead keys keymap(s)
}, when = lambda _: setDK(None)())

keymap(lambda wm_class: wm_class.casefold() not in remotes,{
    C("Shift-Alt-RC-o"):        toggle_optspecialchars_US(),       # Turn the Option key special character scheme on and off
},"OptSpecialChars toggle")

keymap("Option key special characters US", {

    # Number keys row with Option
    ######################################################
    C("Alt-Grave"): [UC(0x0060), C("Shift-Left"), setDK(0x0060)],       # Dead Key Accent: Grave

    C("Alt-1"):                     UC(0x00A1),                 # ¡ Inverted Exclamation Mark
    C("Alt-2"):                     UC(0x2122),                 # ™ Trade Mark Sign Emoji
    C("Alt-3"):                     UC(0x00A3),                 # £ British Pound currency symbol
    C("Alt-4"):                     UC(0x00A2),                 # ¢ Cent currency symbol
    C("Alt-5"):                     UC(0x221E),                 # ∞ Infinity mathematical symbol
    C("Alt-6"):                     UC(0x00A7),                 # § Section symbol
    C("Alt-7"):                     UC(0x00B6),                 # ¶ Paragraph mark (Pilcrow) symbol
    C("Alt-8"):                     UC(0x2022),                 # • Bullet Point symbol (solid)
    C("Alt-9"):                     UC(0x00AA),                 # ª Feminine Ordinal Indicator
    C("Alt-0"):                     UC(0x00BA),                 # º Masculine Ordinal Indicator
    C("Alt-Minus"):                 UC(0x2013),                 # – En Dash punctuation mark
    C("Alt-Equal"):                 UC(0x2260),                 # ≠ Not Equal To symbol

    # Number keys row with Shift+Option
    ######################################################
    C("Shift-Alt-Grave"):           UC(0x0060),                 # ` Grave Accent (non-combining)
    C("Shift-Alt-1"):               UC(0x2044),                 # ⁄ Fraction Slash
    C("Shift-Alt-2"):               UC(0x20AC),                 # € Euro currency symbol
    C("Shift-Alt-3"):               UC(0x2039),                 # ‹ Single Left-Pointing Angle Quotation mark
    C("Shift-Alt-4"):               UC(0x203A),                 # › Single Right-Pointing Angle Quotation mark
    C("Shift-Alt-5"):               UC(0xFB01),                 # ﬁ Latin Small Ligature Fi
    C("Shift-Alt-6"):               UC(0xFB02),                 # ﬂ Latin Small Ligature Fl
    C("Shift-Alt-7"):               UC(0x2021),                 # ‡ Double dagger (cross) symbol
    C("Shift-Alt-8"):               UC(0x00B0),                 # ° Degree Sign
    C("Shift-Alt-9"):               UC(0x00B7),                 # · Middle Dot (interpunct/middot)
    C("Shift-Alt-0"):               UC(0x201A),                 # ‚ Single low-9 quotation mark
    C("Shift-Alt-Minus"):           UC(0x2014),                 # — Em Dash punctuation mark
    C("Shift-Alt-Equal"):           UC(0x00B1),                 # ± Plus Minus mathematical symbol

    # Tab key row with Option
    ######################################################
    C("Alt-Q"):                     UC(0x0153),                 # œ Small oe (oethel) ligature
    C("Alt-W"):                     UC(0x2211),                 # ∑ N-Ary Summation (sigma) notation

    C("Alt-E"): [UC(0x00B4), C("Shift-Left"), setDK(0x00B4)],   # Dead Key Accent: Acute

    C("Alt-R"):                     UC(0x00AE),                 # ® Registered Trade Mark Sign
    C("Alt-T"):                     UC(0x2020),                 # † Simple dagger (cross) symbol
    C("Alt-Y"):                     UC(0x00A5),                 # ¥ Japanese Yen currency symbol

    C("Alt-U"): [UC(0x00A8), C("Shift-Left"), setDK(0x00A8)],   # Dead Key Accent: Umlaut

    C("Alt-I"): [UC(0x02C6), C("Shift-Left"), setDK(0x02C6)],   # Dead Key Accent: Circumflex

    C("Alt-O"):                     UC(0x00F8),                 # ø Latin Small Letter o with Stroke
    C("Alt-P"):                     UC(0x03C0),                 # π Greek Small Letter Pi
    C("Alt-Left_Brace"):            UC(0x201C),                 # “ Left Double Quotation Mark
    C("Alt-Right_Brace"):           UC(0x2018),                 # ‘ Left Single Quotation Mark
    C("Alt-Backslash"):             UC(0x00AB),                 # « Left-Pointing Double Angle Quotation Mark

    # Tab key row with Shift+Option
    ######################################################
    C("Shift-Alt-Q"):               UC(0x0152),                 # Œ Capital OE (Oethel) ligature
    C("Shift-Alt-W"):               UC(0x201E),                 # „ Double Low-9 Quotation mark
    C("Shift-Alt-E"):               UC(0x00B4),                 # ´ Acute Accent diacritic (non-combining)
    C("Shift-Alt-R"):               UC(0x2030),                 # ‰ Per mille symbol (zero over zero-zero)
    C("Shift-Alt-T"):               UC(0x02C7),                 # ˇ Caron/hacek diacritic (non-combining)
    C("Shift-Alt-Y"):               UC(0x00C1),                 # Á Latin Capital Letter A with Acute
    C("Shift-Alt-U"):               UC(0x00A8),                 # ¨ Diaeresis/Umlaut (non-combining)
    C("Shift-Alt-I"):               UC(0x02C6),                 # ˆ Circumflex Accent (non-combining)
    C("Shift-Alt-O"):               UC(0x00D8),                 # Ø Latin Capital Letter O with Stroke
    C("Shift-Alt-P"):               UC(0x220F),                 # ∏ N-Ary Product mathematical symbol
    C("Shift-Alt-Left_Brace"):      UC(0x201D),                 # ” Right Double Quotation Mark
    C("Shift-Alt-Right_Brace"):     UC(0x2019),                 # ’ Right Single Quotation Mark
    C("Shift-Alt-Backslash"):       UC(0x00BB),                 # » Right-Pointing Double Angle Quotation Mark

    # CapsLock key row with Option
    ######################################################
    C("Alt-A"):                     UC(0x00E5),                 # å Small Letter a with Ring Above
    C("Alt-S"):                     UC(0x00DF),                 # ß German Eszett/beta (Sharfes/Sharp S)
    C("Alt-D"):                     UC(0x2202),                 # ∂ Partial Differential
    C("Alt-F"):                     UC(0x0192),                 # ƒ Function/florin currency symbol
    C("Alt-G"):                     UC(0x00A9),                 # © Copyright Sign
    C("Alt-H"):                     UC(0x02D9),                 # ˙ Dot Above diacritic (non-combining)
    C("Alt-J"):                     UC(0x2206),                 # ∆ Increment, laplace operator symbol
    C("Alt-K"):                     UC(0x02DA),                 # ˚ Ring Above diacritic (non-combining)
    C("Alt-L"):                     UC(0x00AC),                 # ¬ Not Sign angled dash symbol
    C("Alt-Semicolon"):             UC(0x2026),                 # … Horizontal ellipsis
    C("Alt-Apostrophe"):            UC(0x00E6),                 # æ Small ae ligature

    # CapsLock key row with Shift+Option
    ######################################################
    C("Shift-Alt-A"):               UC(0x00C5),                 # Å Capital Letter A with Ring Above
    C("Shift-Alt-S"):               UC(0x00CD),                 # Í Latin Capital Letter I with Acute
    C("Shift-Alt-D"):               UC(0x00CE),                 # Î Latin Capital Letter I with Circumflex
    C("Shift-Alt-F"):               UC(0x00CF),                 # Ï Latin Capital Letter I with Diaeresis
    C("Shift-Alt-G"):               UC(0x02DD),                 # ˝ Double Acute Accent (non-combining)
    C("Shift-Alt-H"):               UC(0x00D3),                 # Ó Latin Capital Letter O with Acute
    C("Shift-Alt-J"):               UC(0x00D4),                 # Ô Latin Capital Letter O with Circumflex
    #########################################################################################################
    # The Apple logo is at {U+F8FF} in a Unicode Private Use Area. Only at that location in Mac fonts.
    # Symbol exists at {U+F000} in Baskerville Old Face font.
    C("Shift-Alt-K"):   [apple_logo_alert(),UC(0xF000)],        #  Apple logo [req's Baskerville Old Face font]
    C("Shift-Alt-L"):               UC(0x00D2),                 # Ò Latin Capital Letter O with Grave
    C("Shift-Alt-Semicolon"):       UC(0x00DA),                 # Ú Latin Capital Letter U with Acute
    C("Shift-Alt-Apostrophe"):      UC(0x00C6),                 # Æ Capital AE ligature

    # Shift keys row with Option
    ######################################################
    C("Alt-Z"):                     UC(0x03A9),                 # Ω Greek Capital Letter Omega
    C("Alt-X"):                     UC(0x2248),                 # ≈ Almost Equal To symbol
    C("Alt-C"):                     UC(0x00E7),                 # ç Small Letter c with Cedilla
    C("Alt-V"):                     UC(0x221A),                 # √ Square Root radical sign
    C("Alt-B"):                     UC(0x222B),                 # ∫ Integral mathematical symbol

    C("Alt-N"): [UC(0x02DC), C("Shift-Left"), setDK(0x02DC)],   # Dead Key Accent: Tilde

    C("Alt-M"):                     UC(0x00B5),                 # µ Micro (mu) symbol
    C("Alt-Comma"):                 UC(0x2264),                 # ≤ Less Than or Equal To symbol
    C("Alt-Dot"):                   UC(0x2265),                 # ≥ Greater Than or Equal To symbol
    C("Alt-Slash"):                 UC(0x00F7),                 # ÷ Obelus/Division symbol

    # Shift keys row with Shift+Option
    ######################################################
    C("Shift-Alt-Z"):               UC(0x00B8),                 # ¸ Spacing Cedilla diacritic (non-combining)
    C("Shift-Alt-X"):               UC(0x02DB),                 # ˛ Ogonek diacritic (non-combining)
    C("Shift-Alt-C"):               UC(0x00C7),                 # Ç Capital Letter C with Cedilla
    C("Shift-Alt-V"):               UC(0x25CA),                 # ◊ Lozenge (diamond) shape symbol
    C("Shift-Alt-B"):               UC(0x0131),                 # ı Latin Small Letter Dotless i
    C("Shift-Alt-N"):               UC(0x02DC),                 # ˜ Small Tilde character
    C("Shift-Alt-M"):               UC(0x00C2),                 # Â Latin Capital Letter A with Circumflex
    C("Shift-Alt-Comma"):           UC(0x00AF),                 # ¯ Macron/overline/overbar (non-combining)
    C("Shift-Alt-Dot"):             UC(0x02D8),                 # ˘ Breve diacritic (non-combining)
    C("Shift-Alt-Slash"):           UC(0x00BF),                 # ¿ Inverted Question mark

}, when = lambda ctx: ctx.wm_class not in remotes and _optspecialchars_US is True)


################################################################################
############   END OF OPTION KEY SPECIAL CHARACTER ENTRY SCHEME   ##############
################################################################################



######################################################################################
###                                                                                ###
###                                                                                ###
###      ██    ██ ███████ ███████ ██████       █████  ██████  ██████  ███████      ###
###      ██    ██ ██      ██      ██   ██     ██   ██ ██   ██ ██   ██ ██           ###
###      ██    ██ ███████ █████   ██████      ███████ ██████  ██████  ███████      ###
###      ██    ██      ██ ██      ██   ██     ██   ██ ██      ██           ██      ###
###       ██████  ███████ ███████ ██   ██     ██   ██ ██      ██      ███████      ###
###                                                                                ###
###                                                                                ###
######################################################################################
### Good place for adding new custom keymaps for user applications and custom function keys

# REMOVE THE CONTENTS OF THIS FOR GENERAL USE
keymap(lambda wm_class: wm_class.casefold() not in remotes,{
    # My brightness keys on function row - BIOS set to make hardware functions require Fn key
    C("F3"):                    C("Brightnessdown"),            # Turn F3 into brightness down button
    C("F4"):                    C("Brightnessup"),              # Turn F4 into brightness up button
    # My volume keys on function row - BIOS set to make hardware functions require Fn key
    C("F9"):                    C("Mute"),                      # Turn F9 into mute button
    C("F10"):                   C("Volumedown"),                # Turn F10 into volume down button
    C("F11"):                   C("Volumeup"),                  # Turn F11 into volume up button
}, "User hardware-specific customizations")



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

keymap(re.compile("thunderbird", re.IGNORECASE),{
    C("Alt-RC-I"):              C("Shift-RC-I"),                # Dev tools
    # Enable Cmd+Option+Left/Right for tab navigation
    C("RC-Alt-Left"):           C("C-Page_Up"),                 # Go to prior tab (macOS Thunderbird tab nav shortcut)
    C("RC-Alt-Right"):          C("C-Page_Down"),               # Go to next tab (macOS Thunderbird tab nav shortcut)
}, "Thunderbird email client")

keymap(re.compile("Angry.*IP.*Scanner", re.IGNORECASE),{
    C("RC-comma"):              C("Shift-RC-P"),                # Open preferences
}, "Angry IP Scanner")

keymap(re.compile("transmission", re.IGNORECASE),{
    C("RC-i"):                  C("Alt-Enter"),                 # Open properties (Get Info) dialog
    C("RC-comma"):             [C("Alt-e"),C("p")],             # Open preferences (settings) dialog
}, "Transmission bittorrent client")

keymap(re.compile("jdownloader", re.IGNORECASE),{
    C("RC-i"):                  C("Alt-Enter"),                 # Open properties
    C("RC-Backspace"):          C("Delete"),                    # Remove download from list
    C("RC-Comma"):              C("C-P"),                       # Open preferences (settings)
}, "jDownloader")

keymap(re.compile("totem", re.IGNORECASE),{
    C("RC-dot"):                C("C-q"),                       # Stop (quit player, there is no "Stop" function)
}, "Totem video player")

keymap(re.compile("eog", re.IGNORECASE),{
    C("RC-i"):                  C("Alt-Enter"),                 # Image properties
}, "GNOME image viewer")



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

###  START OF FILE MANAGER GROUP OF KEYMAPS - FINDER MODS  ###

# Boolean variable to toggle Enter key state between F2 and Enter
# True = Enter key sends F2, False = Enter key sends Enter
_enter_is_F2 = True


def is_Enter_F2(combo_if_true, combo_if_false):
    """
    Send a different combo for Enter key depending on state of _enter_is_F2 variable,
    or latch the variable to True or False to change the Enter key state on next use.
    """
    def _is_Enter_F2():
        global _enter_is_F2
        combo_list = [combo_if_true]
        if combo_if_false is False:
            _enter_is_F2 = False
        elif combo_if_false is True:
            _enter_is_F2 = True
        elif _enter_is_F2:
            _enter_is_F2 = False
        else:
            combo_list = [combo_if_false]
            _enter_is_F2 = True
        return combo_list
    return _is_Enter_F2


# Keybindings overrides for Caja
# (overrides some bindings from general file manager code block below)
keymap(re.compile("caja", re.IGNORECASE),{
    # C("RC-Super-o"):            C("Shift-RC-Enter"),            # Open in new tab
    C("RC-Super-o"):            C("Shift-RC-W"),                # Open in new window
},"Overrides for Caja - Finder Mods")

# Keybindings overrides for DDE (Deepin) File Manager
# (overrides some bindings from general file manager code block below)
keymap(re.compile("dde-file-manager", re.IGNORECASE),{
    C("RC-i"):                  C("RC-i"),                      # File properties dialog (Get Info)
    C("RC-comma"):              None,                           # Disable preferences shortcut (no shortcut available)
    C("RC-Up"):                 C("RC-Up"),                     # Go Up dir
    C("Shift-RC-Left_Brace"):   C("C-Shift-Tab"),               # Go to prior tab
    C("Shift-RC-Right_Brace"):  C("C-Tab"),                     # Go to next tab
    C("Shift-RC-Left"):         C("C-Shift-Tab"),               # Go to prior tab
    C("Shift-RC-Right"):        C("C-Tab"),                     # Go to next tab
},"Overrides for DDE File Manager - Finder Mods")

# Keybindings overrides for Dolphin (KDE file manager)
# (overrides some bindings from general file manager code block below)
keymap(re.compile("dolphin", re.IGNORECASE),{
    C("RC-KEY_2"):              C("C-KEY_3"),                   # View as List (Detailed)
    C("RC-KEY_3"):              C("C-KEY_2"),                   # View as List (Compact)
    ##########################################################################################
    ### "Open in new window" (or new tab) requires manually setting custom shortcut of Ctrl+Shift+o
    ### in Dolphin's keyboard shortcuts. There is no default shortcut set for this function.
    ##########################################################################################
    C("RC-Super-o"):            C("Shift-RC-o"),                # Open in new window (or new tab, user's choice, see above)
    C("Shift-RC-N"):            is_Enter_F2(C("F10"), False),   # Create new folder, toggle Enter to be Enter
    C("RC-comma"):              C("Shift-RC-comma"),            # Open preferences dialog
},"Overrides for Dolphin - Finder Mods")

# Keybindings overrides for elementary OS Files (Pantheon)
# (overrides some bindings from general file manager code block below)
keymap(re.compile("io.elementary.files", re.IGNORECASE),{
    # C("RC-Super-o"):            C("Shift-Enter"),               # Open folder in new tab
    C("RC-comma"):              None,                           # Disable preferences shortcut since none available
},"Overrides for Pantheon - Finder Mods")

# Keybindings overrides for Nautilus
# (overrides some bindings from general file manager code block below)
keymap(re.compile("org.gnome.nautilus|nautilus", re.IGNORECASE),{
    C("RC-N"):                  C("C-Alt-Space"),               # macOS Finder search window shortcut Cmd+Option+Space
    # For the above shortcut to work, a custom shortcut must be set up in the Settings app in GNOME
    # to run command: "nautilus --new-window /home/USER" [ replace "USER" ]
    C("RC-KEY_1"):              C("C-KEY_2"),                   # View as Icons
    C("RC-KEY_2"):              C("C-KEY_1"),                   # View as List (Detailed)
    C("RC-Super-o"):            C("Shift-Enter"),               # Open in new window (disable line below)
    # C("RC-Super-o"):            C("RC-Enter"),                  # Open in new tab (disable line above)
    C("RC-comma"):              C("RC-comma"),                  # Overrides "Open preferences dialog" shortcut below
    C("RC-F"):                  C("RC-F"),                      # Don't toggle Enter key, pass Cmd+F
},"Overrides for Nautilus - Finder Mods")

# Keybindings overrides for PCManFM and PCManFM-Qt
# (overrides some bindings from general file manager code block below)
keymap(re.compile("pcmanfm-qt", re.IGNORECASE),{
    C("RC-Backspace"):          C("Delete"),                    # Move to Trash (delete, bypass dialog)
},"Overrides for PCManFM-Qt - Finder Mods")
keymap(re.compile("pcmanfm|pcmanfm-qt", re.IGNORECASE),{
    C("RC-KEY_2"):              C("C-KEY_4"),                   # View as List (Detailed) [Not in PCManFM-Qt]
    C("RC-Backspace"):         [C("Delete"),C("Space")],        # Move to Trash (delete, bypass dialog)
    C("RC-F"):                  C("RC-F"),                      # Don't toggle Enter key state, pass Cmd+F
},"Overrides for PCManFM - Finder Mods")

keymap(re.compile("spacefm", re.IGNORECASE),{
    C("RC-Page_Up"):            C("C-Shift-Tab"),               # Go to prior tab
    C("RC-Page_Down"):          C("C-Tab"),                     # Go to next tab
    C("Shift-RC-Left_Brace"):   C("C-Shift-Tab"),               # Go to prior tab
    C("Shift-RC-Right_Brace"):  C("C-Tab"),                     # Go to next tab
    C("Shift-RC-Left"):         C("C-Shift-Tab"),               # Go to prior tab
    C("Shift-RC-Right"):        C("C-Tab"),                     # Go to next tab
    C("Shift-RC-N"):    is_Enter_F2(C("RC-F"), False),          # Switch Enter to Enter. New folder is Ctrl+F(???)
    # Need to catch WM_NAME of "Find Files" and override Enter key state back to being Enter. See above keymap.
    C("RC-F"):                  None,                           # No direct shortcut available and menu macros don't work in SpaceFM.
    C("RC-Backspace"):         [C("Delete"),C("Space")],        # Move to Trash (delete, bypass dialog)
    C("RC-comma"):             [C("Alt-V"),C("p")],             # Overrides "Open preferences dialog" shortcut below
    # This shortcut ^^^^^^^^^^^^^^^ is not fully working in SpaceFM. Opens "View" menu but not Preferences.
    # SpaceFM is doing some nasty binding that blocks all shortcuts, including Alt+Tab, while any menu is open.
},"Overrides for SpaceFM - Finder Mods")

# Keybindings overrides for Thunar
# (overrides some bindings from general file manager code block below)
keymap(re.compile("thunar", re.IGNORECASE),{
    C("RC-Super-o"):            C("Shift-RC-P"),                # Open in new tab
    C("RC-comma"):             [C("Alt-E"),C("E")],             # Overrides "Open preferences dialog" shortcut below
    C("RC-F"):                  C("RC-F"),                      # Don't toggle Enter key, pass Cmd+F
},"Overrides for Thunar - Finder Mods")

############################################################
##  Keybindings for Linux general file managers group:
##
##  Currently supported Linux file managers (file browsers):
##
##  Caja File Browser (MATE file manager, fork of Nautilus)
##  DDE File Manager (Deepin Linux file manager)
##  Dolphin (KDE file manager)
##  Nautilus (GNOME file manager, may be named "Files")
##  Nemo (Cinnamon file manager, fork of Nautilus, may be named "Files")
##  Pantheon Files (elementary OS file manager, may be named "Files")
##  PCManFM (LXDE file manager)
##  PCManFM-Qt (LXQt file manager)
##  SpaceFM (Fork of PCManFM file manager)
##  Thunar File Manager (Xfce file manager)
##
##  GNOME XDG file dialogs ("Open File" and "Save As" windows in apps like Firefox)
##
##############################################

# Keybindings overrides for GNOME XDG "Save As" and "Open File" dialogs in Firefox
keymap("XDG file dialogs", {
    C("RC-Left"):               C("Alt-Left"),                  # Go Back
    C("RC-Right"):              C("Alt-Right"),                 # Go Forward
    C("RC-Up"):                 C("Alt-Up"),                    # Go Up dir
    C("RC-Down"):               C("Enter"),                     # Go Down dir (open folder/file) [universal]
}, when = lambda ctx: ctx.wm_class == "xdg-desktop-portal-gnome" and (ctx.wm_name == "Open File" or ctx.wm_name == "Save As"))


keymap(re.compile(filemanStr, re.IGNORECASE),{
    ###########################################################################################################
    ###  Show Properties (Get Info) | Open Settings/Preferences | Show/Hide hidden files                    ###
    ###########################################################################################################
    C("RC-i"):                  C("Alt-Enter"),                 # File properties dialog (Get Info)
    C("RC-comma"):             [C("Alt-E"),C("N")],             # Open preferences dialog
    C("Shift-RC-dot"):          C("RC-H"),                      # Show/hide hidden files ("dot" files)
    ###########################################################################################################
    ###  Navigation                                                                                         ###
    ###########################################################################################################
    C("RC-Left_Brace"):         C("Alt-Left"),                  # Go Back
    C("RC-Right_Brace"):        C("Alt-Right"),                 # Go Forward
    C("RC-Left"):               C("Alt-Left"),                  # Go Back
    C("RC-Right"):              C("Alt-Right"),                 # Go Forward
    C("RC-Up"):                 C("Alt-Up"),                    # Go Up dir
    # C("RC-Down"):               C("Alt-Down"),                  # Go Down dir (only works on folders) [not universal]
    # C("RC-Down"):               C("RC-O"),                      # Go Down dir (open folder/file) [not universal]
    C("RC-Down"):               C("Enter"),                     # Go Down dir (open folder/file) [universal]
    C("Shift-RC-Left_Brace"):   C("C-Page_Up"),                 # Go to prior tab
    C("Shift-RC-Right_Brace"):  C("C-Page_Down"),               # Go to next tab
    C("Shift-RC-Left"):         C("C-Page_Up"),                 # Go to prior tab
    C("Shift-RC-Right"):        C("C-Page_Down"),               # Go to next tab
    ###########################################################################################################
    ###  Open in New Window | Move to Trash | Duplicate file/folder                                         ###
    ###########################################################################################################
    C("RC-Super-o"):            C("Shift-RC-o"),                # Open in new window (or tab, depends) [not universal]
    C("RC-Backspace"):          C("Delete"),	                # Move to Trash (delete)
    C("RC-Delete"):             None,                           # Block Ctrl+Delete from performing any action (error in macOS)
    ###########################################################################################################
    ###  ENTER KEY TO RENAME CUSTOM FUNCTION SHORTCUTS                                                      ###
    ###########################################################################################################
    C("Enter"):                 is_Enter_F2(C("F2"),C("Enter")),        # Send F2 to rename files, unless var is False
    C("Shift-RC-N"):            is_Enter_F2(C("Shift-RC-N"), False),    # New folder, set Enter to Enter
    C("RC-L"):                  is_Enter_F2(C("RC-L"), False),          # Set Enter to Enter for Location field
    C("RC-F"):                  is_Enter_F2(C("RC-F"), False),          # Set Enter to Enter for Find field
    C("Esc"):                   is_Enter_F2(C("Esc"), True),            # Send Escape, make sure Enter is back to F2
    C("Shift-RC-Enter"):        C("Enter"),                             # alternative "Enter" key for unusual cases
},"General File Managers - Finder Mods")

############################################
### END OF FILE MANAGER GROUP OF KEYMAPS ###
############################################



###################################  BROWSERS  #####################################
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
keymap(re.compile("Firefox", re.IGNORECASE),{
    C("C-comma"):              [C("C-t"),usleep(5),ST("about"),C("Shift-SEMICOLON"),ST("preferences"),C("Enter")],
    C("Shift-RC-N"):            C("Shift-RC-P"),                # Open private window with Cmd+Shift+N like other browsers
})

keymap(re.compile(chromeStr, re.IGNORECASE),{
    C("C-comma"):              [C("Alt-e"), C("s"),C("Enter")], # Open preferences
    C("RC-q"):                  C("Alt-F4"),                    # Quit Chrome(s) browsers with Cmd+Q
    # C("RC-Left"):               C("Alt-Left"),                  # Page nav: Back to prior page in history (conflict with wordwise)
    # C("RC-Right"):              C("Alt-Right"),                 # Page nav: Forward to next page in history (conflict with wordwise)
    C("RC-Left_Brace"):         C("Alt-Left"),                  # Page nav: Back to prior page in history
    C("RC-Right_Brace"):        C("Alt-Right"),                 # Page nav: Forward to next page in history
}, "Chrome Browsers")
# Opera C-F12

# Keybindings for General Web Browsers
keymap(re.compile(browserStr, re.IGNORECASE),{
    C("RC-Q"):                  C("RC-Q"),                      # Close all browsers Instances
    C("Alt-RC-I"):              C("Shift-RC-I"),                # Dev tools
    # C("Alt-RC-J"):              C("Shift-RC-J"),                # Dev tools
    C("RC-Key_1"):              C("Alt-Key_1"),                 # Jump to Tab #1-#8
    C("RC-Key_2"):              C("Alt-Key_2"),
    C("RC-Key_3"):              C("Alt-Key_3"),
    C("RC-Key_4"):              C("Alt-Key_4"),
    C("RC-Key_5"):              C("Alt-Key_5"),
    C("RC-Key_6"):              C("Alt-Key_6"),
    C("RC-Key_7"):              C("Alt-Key_7"),
    C("RC-Key_8"):              C("Alt-Key_8"),
    C("RC-Key_9"):              C("Alt-Key_9"),                 # Jump to last tab
    # Enable Cmd+Shift+Braces for tab navigation
    C("Shift-RC-Left_Brace"):   C("C-Page_Up"),                 # Go to prior tab
    C("Shift-RC-Right_Brace"):  C("C-Page_Down"),               # Go to next tab
    # Enable Cmd+Option+Left/Right for tab navigation
    C("RC-Alt-Left"):           C("C-Page_Up"),                 # Go to prior tab
    C("RC-Alt-Right"):          C("C-Page_Down"),               # Go to next tab
    # Enable Ctrl+PgUp/PgDn for tab navigation
    C("Super-Page_Up"):         C("C-Page_Up"),                 # Go to prior tab
    C("Super-Page_Down"):       C("C-Page_Down"),               # Go to next tab
    # Use Cmd+Braces keys for tab navigation instead of page navigation
    # C("C-Left_Brace"):        C("C-Page_Up"),
    # C("C-Right_Brace"):       C("C-Page_Down"),
}, "General Web Browsers")



##########################################################################################################
###                                                                                                    ###
###                                                                                                    ###
###       ██████  ██████  ██████  ███████     ███████ ██████  ██ ████████  ██████  ██████  ███████     ###
###      ██      ██    ██ ██   ██ ██          ██      ██   ██ ██    ██    ██    ██ ██   ██ ██          ###
###      ██      ██    ██ ██   ██ █████       █████   ██   ██ ██    ██    ██    ██ ██████  ███████     ###
###      ██      ██    ██ ██   ██ ██          ██      ██   ██ ██    ██    ██    ██ ██   ██      ██     ###
###       ██████  ██████  ██████  ███████     ███████ ██████  ██    ██     ██████  ██   ██ ███████     ###
###                                                                                                    ###
###                                                                                                    ###
##########################################################################################################

# Keybindings for IntelliJ
keymap(re.compile("^jetbrains-(?!.*toolbox).*$", re.IGNORECASE),{
    # General
    C("C-Key_0"):               C("Alt-Key_0"),                 # Open corresponding tool window
    C("C-Key_1"):               C("Alt-Key_1"),                 # Open corresponding tool window
    C("C-Key_2"):               C("Alt-Key_2"),                 # Open corresponding tool window
    C("C-Key_3"):               C("Alt-Key_3"),                 # Open corresponding tool window
    C("C-Key_4"):               C("Alt-Key_4"),                 # Open corresponding tool window
    C("C-Key_5"):               C("Alt-Key_5"),                 # Open corresponding tool window
    C("C-Key_6"):               C("Alt-Key_6"),                 # Open corresponding tool window
    C("C-Key_7"):               C("Alt-Key_7"),                 # Open corresponding tool window
    C("C-Key_8"):               C("Alt-Key_8"),                 # Open corresponding tool window
    C("C-Key_9"):               C("Alt-Key_9"),                 # Open corresponding tool window
    C("Super-Grave"):           C("C-Grave"),                   # Quick switch current scheme
    C("C-Comma"):               C("C-Alt-s"),                   # Open Settings dialog
    C("C-Semicolon"):           C("C-Alt-Shift-s"),             # Open Project Structure dialog
    # Debugging
    C("C-Alt-r"):               C("F9"),                        # Resume program
    # Search/Replace
    C("C-g"):                   C("F3"),                        # Find next
    C("C-Shift-F3"):            C("Shift-F3"),                  # Find previous
    C("Super-g"):               C("Alt-j"),                     # Select next occurrence
    C("C-Super-g"):             C("C-Alt-Shift-j"),             # Select all occurrences
    C("Super-Shift-g"):         C("Alt-Shift-j"),               # Unselect occurrence
    # Editing
    C("Super-Space"):           C("LC-Space"),                  # Basic code completion
    C("Super-Shift-Space"):     C("Shift-LC-Space"),            # Smart code completion
    C("Super-j"):               C("C-q"),                       # Quick documentation lookup
    C("C-n"):                   C("Alt-Insert"),                # Generate code...
    C("Super-o"):               C("C-o"),                       # Override methods
    C("Super-i"):               C("C-i"),                       # Implement methods
    C("Alt-Up"):                C("C-w"),                       # Extend selection
    C("Alt-Down"):              C("C-Shift-w"),                 # Shrink selection
    C("Super-Shift-q"):         C("Alt-q"),                     # Context info
    C("Super-Alt-o"):           C("C-Alt-o"),                   # Optimize imports
    C("Super-Alt-i"):           C("C-Alt-i"),                   # Auto-indent line(s)
    C("C-Backspace"):           C("C-y"),                       # Delete line at caret
    C("Super-Shift-j"):         C("C-Shift-j"),                 # Smart line join
    C("Alt-Delete"):            C("C-Delete"),                  # Delete to word end
    C("Alt-Backspace"):         C("C-Backspace"),               # Delete to word start
    C("C-Shift-Equal"):         C("C-KPPLUS"),                  # Expand code block
    C("C-Minus"):               C("C-KPMINUS"),                 # Collapse code block
    C("C-Shift-Equal"):         C("C-Shift-KPPLUS"),            # Expand all
    C("C-Shift-Minus"):         C("C-Shift-KPMINUS"),           # Collapse all
    C("C-w"):                   C("C-F4"),                      # Close active editor tab
    # Refactoring
    C("C-Delete"):              C("Alt-Delete"),                # Safe Delete
    C("C-T"):                   C("C-Alt-Shift-t"),             # Refactor this
    # Navigation
    C("C-o"):                   C("C-n"),                       # Go to class
    C("C-Shift-o"):             C("C-Shift-n"),                 # Go to file
    C("C-Alt-o"):               C("C-Alt-Shift-n"),             # Go to symbol
    C("Super-Right"):           C("Alt-Right"),                 # Go to next editor tab
    C("Super-Left"):            C("Alt-Left"),                  # Go to previous editor tab
    C("C-l"):                   C("C-g"),                       # Go to line
    C("Alt-Space"):             C("C-Shift-i"),                 # Open quick definition lookup
    C("C-Y"):                   C("C-Shift-i"),                 # Open quick definition lookup
    C("Super-Shift-b"):         C("C-Shift-b"),                 # Go to type declaration
    C("Super-Up"):              C("Alt-Up"),                    # Go to previous
    C("Super-Down"):            C("Alt-Down"),                  # Go to next method
    C("Super-h"):               C("C-h"),                       # Type hierarchy
    C("Super-Alt-h"):           C("C-Alt-h"),                   # Call hierarchy
    C("C-Down"):                C("C-Enter"),                   # Edit source/View source
    C("Alt-Home"):              C("Alt-Home"),                  # Show navigation bar
    C("F2"):                    C("F11"),                       # Toggle bookmark
    C("Super-F3"):              C("C-F11"),                     # Toggle bookmark with mnemonic
    C("Super-Key_0"):           C("C-Key_0"),                   # Go to numbered bookmark
    C("Super-Key_1"):           C("C-Key_1"),                   # Go to numbered bookmark
    C("Super-Key_2"):           C("C-Key_2"),                   # Go to numbered bookmark
    C("Super-Key_3"):           C("C-Key_3"),                   # Go to numbered bookmark
    C("Super-Key_4"):           C("C-Key_4"),                   # Go to numbered bookmark
    C("Super-Key_5"):           C("C-Key_5"),                   # Go to numbered bookmark
    C("Super-Key_6"):           C("C-Key_6"),                   # Go to numbered bookmark
    C("Super-Key_7"):           C("C-Key_7"),                   # Go to numbered bookmark
    C("Super-Key_8"):           C("C-Key_8"),                   # Go to numbered bookmark
    C("Super-Key_9"):           C("C-Key_9"),                   # Go to numbered bookmark
    C("C-F3"):                  C("Shift-F11"),                 # Show bookmarks
    # Compile and Run
    C("Super-Alt-r"):           C("Alt-Shift-F10"),             # Select configuration and run
    C("Super-Alt-d"):           C("Alt-Shift-F9"),              # Select configuration and debug
    C("Super-r"):               C("Shift-F10"),                 # Run
    C("Super-d"):               C("Shift-F9"),                  # Debug
    C("Super-Shift-r"):         C("C-Shift-F10"),               # Run context configuration from editor
    C("Super-Shift-d"):         C("C-Shift-F9"),                # Debug context configuration from editor
    # VCS/Local History
    C("Super-v"):               C("Alt-Grave"),                 # VCS quick popup
    C("Super-c"):               C("LC-c"),                      # Sigints - interrupt
},"Jetbrains")

keymap(lambda wm_class: wm_class.casefold() not in mscodes,{
    # Wordwise remaining - for Everything but VS Code
    C("Alt-Left"):              C("C-Left"),                    # Left of Word
    C("Alt-Shift-Left"):        C("C-Shift-Left"),              # Select Left of Word
    C("Alt-Right"):             C("C-Right"),                   # Right of Word
    C("Alt-Shift-Right"):       C("C-Shift-Right"),             # Select Right of Word
    C("Alt-Shift-g"):           C("C-Shift-g"),                 # View source control
    # ** VS Code fix **
    #   Electron issue precludes normal keybinding fix.
    #   Alt menu auto-focus/toggle gets in the way.
    #
    #   refer to ./xkeysnail-config/vscode_keybindings.json
    # **
    #
    # ** Firefox fix **
    #   User will need to set "ui.key.menuAccessKeyFocuses"
    #   under about:config to false.
    #
    #   https://superuser.com/questions/770301/pentadactyl-how-to-disable-menu-bar-toggle-by-alt
    # **
    #
}, "Wordwise - not vscode")

# Keybindings for VS Code
keymap(re.compile(codeStr, re.IGNORECASE),{
    C("Super-Space"):           C("LC-Space"),                  # Basic code completion
    # Wordwise remaining - for VS Code
    # Alt-F19 hack fixes Alt menu activation
    C("Alt-Left"):             [C("Alt-F19"),C("C-Left")],          # Left of Word
    C("Alt-Right"):            [C("Alt-F19"),C("C-Right")],         # Right of Word
    C("Alt-Shift-Left"):       [C("Alt-F19"),C("C-Shift-Left")],    # Select Left of Word
    C("Alt-Shift-Right"):      [C("Alt-F19"),C("C-Shift-Right")],   # Select Right of Word

    # C("C-PAGE_DOWN"):           ignore_key,                     # cancel next_view
    # C("C-PAGE_UP"):             ignore_key,                     # cancel prev_view
    C("C-Alt-Left"):            C("C-PAGE_UP"),                 # next_view
    C("C-Alt-Right"):           C("C-PAGE_DOWN"),               # prev_view
    C("Shift-RC-Left_Brace"):   C("C-PAGE_UP"),                 # next_view
    C("Shift-RC-Right_Brace"):  C("C-PAGE_DOWN"),               # prev_view

    # VS Code Shortcuts
    C("C-g"):                   ignore_key,                     # cancel Go to Line...
    C("Super-g"):               C("C-g"),                       # Go to Line...
    C("F3"):                    ignore_key,                     # cancel Find next
    C("C-h"):                   ignore_key,                     # cancel replace
    C("C-Alt-f"):               C("C-h"),                       # replace
    C("C-Shift-h"):             ignore_key,                     # cancel replace_next
    C("C-Alt-e"):               C("C-Shift-h"),                 # replace_next
    C("f3"):                    ignore_key,                     # cancel find_next
    C("C-g"):                   C("f3"),                        # find_next
    C("Shift-f3"):              ignore_key,                     # cancel find_prev
    C("C-Shift-g"):             C("Shift-f3"),                  # find_prev
    # C("Super-c"):               C("LC-c"),                      # Default - Terminal - Sigint
    # C("Super-x"):               C("LC-x"),                      # Default - Terminal - Exit nano
    # C("Alt-c"):                 C("LC-c"),                      #  Chromebook/IBM - Terminal - Sigint
    # C("Alt-x"):                 C("LC-x"),                      #  Chromebook/IBM - Terminal - Exit nano
    # C("Super-C-g"):             C("C-f2"),                      # Default - Sublime - find_all_under
    # C("C-Alt-g"):               C("C-f2"),                      # Chromebook/IBM - Sublime - find_all_under
    # C("Super-Shift-up"):        C("Alt-Shift-up"),              # multi-cursor up - Sublime
    # C("Super-Shift-down"):      C("Alt-Shift-down"),            # multi-cursor down - Sublime
    # C(""):                      ignore_key,                     # cancel
    # C(""):                      C(""),                          #
}, "Code")

# Keybindings for Sublime Text
keymap(re.compile("Sublime_text", re.IGNORECASE),{
    # C("Super-c"):               C("LC-c"),                      # Default - Terminal - Sigint
    # C("Super-x"):               C("LC-x"),                      # Default - Terminal - Exit nano
    # C("Alt-c"):                 C("LC-c"),                      #  Chromebook/IBM - Terminal - Sigint
    # C("Alt-x"):                 C("LC-x"),                      #  Chromebook/IBM - Terminal - Exit nano
    C("Super-Space"):           C("C-Space"),                   # Basic code completion
    C("C-Super-up"):            C("Alt-o"),                     # Switch file
    C("Super-RC-f"):            C("f11"),                       # toggle_full_screen
    C("C-Alt-v"):              [C("C-k"), C("C-v")],            # paste_from_history
    C("C-up"):                  ignore_key,                     # cancel scroll_lines up
    C("C-Alt-up"):              C("C-up"),                      # scroll_lines up
    C("C-down"):                ignore_key,                     # cancel scroll_lines down
    C("C-Alt-down"):            C("C-down"),                    # scroll_lines down
    C("Super-Shift-up"):        C("Alt-Shift-up"),              # multi-cursor up
    C("Super-Shift-down"):      C("Alt-Shift-down"),            # multi-cursor down
    C("C-PAGE_DOWN"):           ignore_key,                     # cancel next_view
    C("C-PAGE_UP"):             ignore_key,                     # cancel prev_view
    C("C-Shift-left_brace"):    C("C-PAGE_DOWN"),               # next_view
    C("C-Shift-right_brace"):   C("C-PAGE_UP"),                 # prev_view
    C("C-Alt-right"):           C("C-PAGE_DOWN"),               # next_view
    C("C-Alt-left"):            C("C-PAGE_UP"),                 # prev_view
    C("insert"):                ignore_key,                     # cancel toggle_overwrite
    C("C-Alt-o"):               C("insert"),                    # toggle_overwrite
    C("Alt-c"):                 ignore_key,                     # cancel toggle_case_sensitive
    C("C-Alt-c"):               C("Alt-c"),                     # toggle_case_sensitive
    C("C-h"):                   ignore_key,                     # cancel replace
    C("C-Alt-f"):               C("C-h"),                       # replace
    C("C-Shift-h"):             ignore_key,                     # cancel replace_next
    C("C-Alt-e"):               C("C-Shift-h"),                 # replace_next
    C("f3"):                    ignore_key,                     # cancel find_next
    C("C-g"):                   C("f3"),                        # find_next
    C("Shift-f3"):              ignore_key,                     # cancel find_prev
    C("C-Shift-g"):             C("Shift-f3"),                  # find_prev
    C("C-f3"):                  ignore_key,                     # cancel find_under
    C("Super-Alt-g"):           C("C-f3"),                      # find_under
    C("C-Shift-f3"):            ignore_key,                     # cancel find_under_prev
    C("Super-Alt-Shift-g"):     C("C-Shift-f3"),                # find_under_prev
    C("Alt-f3"):                ignore_key,                     # Default - cancel find_all_under
    # C("Alt-Refresh"):           ignore_key,                     # Chromebook/IBM - cancel find_all_under
    # C("Alt-C-g"):               C("Alt-Refresh"),               # Chromebook/IBM - find_all_under
    C("Super-C-g"):             C("Alt-f3"),                    # Default - find_all_under
    C("C-Shift-up"):            ignore_key,                     # cancel swap_line_up
    C("Super-Alt-up"):          C("C-Shift-up"),                # swap_line_up
    C("C-Shift-down"):          ignore_key,                     # cancel swap_line_down
    C("Super-Alt-down"):        C("C-Shift-down"),              # swap_line_down
    C("C-Pause"):               ignore_key,                     # cancel cancel_build
    C("Super-c"):               C("C-Pause"),                   # cancel_build
    C("f9"):                    ignore_key,                     # cancel sort_lines case_s false
    C("f5"):                    C("f9"),                        # sort_lines case_s false
    C("Super-f9"):              ignore_key,                     # cancel sort_lines case_s true
    C("Super-f5"):              C("Super-f9"),                  # sort_lines case_s true
    C("Alt-Shift-Key_1"):       ignore_key,                     # cancel set_layout
    C("C-Alt-Key_1"):           C("Alt-Shift-Key_1"),           # set_layout
    C("Alt-Shift-Key_2"):       ignore_key,                     # cancel set_layout
    C("C-Alt-Key_2"):           C("Alt-Shift-Key_2"),           # set_layout
    C("Alt-Shift-Key_3"):       ignore_key,                     # cancel set_layout
    C("C-Alt-Key_3"):           C("Alt-Shift-Key_3"),           # set_layout
    C("Alt-Shift-Key_4"):       ignore_key,                     # cancel set_layout
    C("C-Alt-Key_4"):           C("Alt-Shift-Key_4"),           # set_layout
    C("Alt-Shift-Key_8"):       ignore_key,                     # cancel set_layout
    C("C-Alt-Shift-Key_2"):     C("Alt-Shift-Key_8"),           # set_layout
    C("Alt-Shift-Key_9"):       ignore_key,                     # cancel set_layout
    C("C-Alt-Shift-Key_3"):     C("Alt-Shift-Key_9"),           # set_layout
    C("Alt-Shift-Key_5"):       ignore_key,                     # cancel set_layout
    C("C-Alt-Shift-Key_5"):     C("Alt-Shift-Key_5"),           # set_layout
    # C(""):                    ignore_key,                     # cancel
    # C(""):                    C(""),                          #
}, "Sublime Text")



###########################  DIALOG FIXES  ###########################
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
### Fixes for the problem of modal dialogs and other "child" windows failing to close with Cmd+W
### Many dialogs respond to the Escape key, others may require Alt+F4 to close
### If main window has unique WM_NAME pattern, use 'and not ctx.wm_name == "Exact Pattern"'
### This section of fixes will probably grow quite large eventually

keymap("Modal dialog fix - GNOME Settings child windows",{
    C("RC-W"):                  C("Alt-F4"),
}, when = lambda ctx: ctx.wm_class == "Gnome-control-center" and not ctx.wm_name == "Settings")

keymap("Modal dialog fix - Transmission child windows",{
    C("RC-W"):                  C("Esc"),                       # preferences and Alt+F4 causes main Transmission window to crash?
}, when = lambda ctx: ctx.wm_class == "Transmission-gtk" and not ctx.wm_name == "Transmission")

keymap("Modal dialog fix - Totem child windows",{
    C("RC-W"):                  C("Alt-F4"),
}, when = lambda ctx: ctx.wm_class == "Totem" and not ctx.wm_name == "Videos")


###########################  TAB NAV FIXES  #############################
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
### Various fixes for supporting tab navigation shortcuts like Shift+Cmd+Braces

# Tab navigation overrides for tabbed UI apps that use Ctrl+Shift+Tab/Ctrl+Tab instead of Ctrl+PgUp/PgDn
keymap(re.compile("org.gnome.Console|Kgx|deepin-terminal|Angry*IP*Scanner|jDownloader", re.IGNORECASE),{
    ### Tab navigation
    C("Shift-RC-Left_Brace"):   C("C-Shift-Tab"),               # Tab nav: Go to prior tab (left)
    C("Shift-RC-Right_Brace"):  C("C-Tab"),                     # Tab nav: Go to next tab (right)
    C("Shift-RC-Left"):         C("C-Shift-Tab"),               # Tab nav: Go to prior tab (left)
    C("Shift-RC-Right"):        C("C-Tab"),                     # Tab nav: Go to next tab (right)
},"Tab Nav fix for apps that use Ctrl+Shift+Tab/Ctrl+Tab")

# Tab navigation overrides for tabbed UI apps that use Ctrl+Alt+PgUp/PgDn instead of Ctrl+PgUp/PgDn
keymap(re.compile("gedit", re.IGNORECASE),{
    C("Shift-RC-Left_Brace"):   C("C-Alt-Page_Up"),             # Go to prior tab (Left)
    C("Shift-RC-Right_Brace"):  C("C-Alt-Page_Down"),           # Go to next tab (Right)
},"Tab Nav fix for apps that use Ctrl+Alt+PgUp/PgDn")

keymap(re.compile("konsole", re.IGNORECASE),{
    # Ctrl Tab - In App Tab Switching
    C("LC-Tab") :               C("Shift-Right"),
    C("Shift-LC-Tab") :         C("Shift-Left"),
    C("LC-Grave") :             C("Shift-Left"),
}, "Konsole tab switching")

keymap(re.compile("Io.elementary.terminal", re.IGNORECASE),{
    # Ctrl Tab - In App Tab Switching
    C("LC-Tab") :               C("Shift-LC-Right"),
    C("Shift-LC-Tab") :         C("Shift-LC-Left"),
    C("LC-Grave") :             C("Shift-LC-Left"),
}, "Elementary Terminal tab switching")


##########################################################################################
###                                                                                    ###
###                                                                                    ###
###      ████████ ███████ ██████  ███    ███ ██ ███    ██  █████  ██      ███████      ###
###         ██    ██      ██   ██ ████  ████ ██ ████   ██ ██   ██ ██      ██           ###
###         ██    █████   ██████  ██ ████ ██ ██ ██ ██  ██ ███████ ██      ███████      ###
###         ██    ██      ██   ██ ██  ██  ██ ██ ██  ██ ██ ██   ██ ██           ██      ###
###         ██    ███████ ██   ██ ██      ██ ██ ██   ████ ██   ██ ███████ ███████      ###
###                                                                                    ###
###                                                                                    ###
##########################################################################################

keymap(re.compile("deepin-terminal", re.IGNORECASE),{
    C("RC-w"):                  C("Alt-w"),                     # Close only current tab, instead of all other tabs
    C("RC-j"):                  None,                           # Block Cmd+J from remapping to vertical split (Ctrl+Shift+J)
    C("RC-minus"):              C("C-minus"),                   # Decrease font size/zoom out
    C("RC-equal"):              C("C-equal"),                   # Increase font size/zoom in
},"Deepin Terminal fixes")

keymap(re.compile(termStr, re.IGNORECASE),{
    ### wordwise overrides of general GUI block
    C("Alt-Backspace"):         C("Alt-Shift-Backspace"),       # Wordwise delete word left of cursor in terminals
    C("Alt-Delete"):           [C("Esc"),C("d")],               # Wordwise delete word right of cursor in terminals
    C("RC-Backspace"):          C("C-u"),                       # Wordwise delete line left of cursor in terminals
    C("RC-Delete"):             C("C-k"),                       # Wordwise delete line right of cursor in terminals
    ### Tab navigation
    C("Shift-RC-Left"):         C("C-Page_Up"),                 # Tab nav: Go to prior tab (Left)
    C("Shift-RC-Right"):        C("C-Page_Down"),               # Tab nav: Go to next tab (Right)
    ### Keyboard input source (language/layout) switching in GNOME
    C("LC-Space"):              C("Super-Space"),               # keyboard input source (language) switching
    C("Shift-LC-Space"):        C("Shift-Super-Space"),         # keyboard input source (language) switching (reverse)
    # C("Alt-Backspace"):         C("Alt-Shift-Backspace"),       # Wordwise - delete word left of cursor in terminals
    # C("Alt-Delete"): [          C("Esc"),C("d")],               # Wordwise - delete word right of cursor in terminals
    C("LC-RC-f"):               C("Alt-F10"),                   # Toggle window maximized state
    # C("RC-Grave"):              C("Super-Tab"),                 # xfce4 Switch within app group
    # C("Shift-RC-Grave"):        C("Super-Shift-Tab"),           # xfce4 Switch within app group
    # C("LC-Right"):              C("C-Alt-Right"),               # Default SL - Change workspace (budgie)
    # C("LC-Left"):               C("C-Alt-Left"),                # Default SL - Change workspace (budgie)
    # C("LC-Left"):               C("C-Alt-End"),                 # SL - Change workspace xfce4
    # C("LC-Left"):               C("Super-Left"),                # SL - Change workspace eos
    # C("LC-Right"):              C("C-Alt-Home"),                # SL - Change workspace xfce4
    # C("LC-Right"):              C("Super-Right"),               # SL - Change workspace eos
    # C("LC-Right"):              C("Super-Page_Up"),             # SL - Change workspace (ubuntu/fedora)
    # C("LC-Left"):               C("Super-Page_Down"),           # SL - Change workspace (ubuntu/fedora)
    # C("LC-Right"):              C("Super-C-Up"),                # SL - Change workspace (popos)
    # C("LC-Left"):               C("Super-C-Down"),              # SL - Change workspace (popos)
    # Ctrl Tab - In App Tab Switching
    C("LC-Tab") :               C("LC-PAGE_DOWN"),
    C("Shift-LC-Tab") :         C("LC-PAGE_UP"),
    C("LC-Grave") :             C("LC-PAGE_UP"),
    # C("Alt-Tab"):               ignore_key,                     # Default - Cmd Tab - App Switching Default
    # C("RC-Tab"):                C("Alt-Tab"),                   # Default - Cmd Tab - App Switching Default
    # C("Shift-RC-Tab"):          C("Alt-Shift-Tab"),             # Default - Cmd Tab - App Switching Default
    # Converts Cmd to use Ctrl-Shift
    C("RC-MINUS"):              C("C-MINUS"),
    C("RC-EQUAL"):              C("C-Shift-EQUAL"),
    C("RC-BACKSPACE"):          C("C-Shift-BACKSPACE"),
    C("RC-W"):                  C("C-Shift-W"),
    C("RC-E"):                  C("C-Shift-E"),
    C("RC-R"):                  C("C-Shift-R"),
    C("RC-T"):                  C("C-Shift-t"),
    C("RC-Y"):                  C("C-Shift-Y"),
    C("RC-U"):                  C("C-Shift-U"),
    C("RC-I"):                  C("C-Shift-I"),
    C("RC-O"):                  C("C-Shift-O"),
    C("RC-P"):                  C("C-Shift-P"),
    C("RC-LEFT_BRACE"):         C("C-Shift-LEFT_BRACE"),
    C("RC-RIGHT_BRACE"):        C("C-Shift-RIGHT_BRACE"),
    C("RC-A"):                  C("C-Shift-A"),
    C("RC-S"):                  C("C-Shift-S"),
    C("RC-D"):                  C("C-Shift-D"),
    C("RC-F"):                  C("C-Shift-F"),
    C("RC-G"):                  C("C-Shift-G"),
    C("RC-H"):                  C("C-Shift-H"),
    C("RC-J"):                  C("C-Shift-J"),
    C("RC-K"):                  C("C-Shift-K"),
    C("RC-L"):                  C("C-Shift-L"),
    C("RC-SEMICOLON"):          C("C-Shift-SEMICOLON"),
    C("RC-APOSTROPHE"):         C("C-Shift-APOSTROPHE"),
    C("RC-GRAVE"):              C("C-Shift-GRAVE"),
    C("RC-Z"):                  C("C-Shift-Z"),
    C("RC-X"):                  C("C-Shift-X"),
    C("RC-C"):                  C("C-Shift-C"),
    C("RC-V"):                  C("C-Shift-V"),
    C("RC-B"):                  C("C-Shift-B"),
    C("RC-N"):                  C("C-Shift-N"),
    C("RC-M"):                  C("C-Shift-M"),
    C("RC-COMMA"):              C("C-Shift-COMMA"),
    C("RC-Dot"):                C("LC-c"),                      # Mimic macOS Cmd+Dot to cancel command
    C("RC-SLASH"):              C("C-Shift-SLASH"),
    C("RC-KPASTERISK"):         C("C-Shift-KPASTERISK"),

}, "terminals")


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

# Note: terminals extends to remotes as well
keymap(lambda wm_class: wm_class.casefold() not in terminals,{
    C("RC-Dot"):                C("Esc"),                       # Mimic macOS Cmd+dot = Escape key (not in terminals)
})

# None referenced here originally
# - but remote clients and VM software ought to be set here
# These are the typical remaps for ALL GUI based apps
keymap(lambda wm_class: wm_class.casefold() not in remotes,{
    C("Shift-RC-Left_Brace"):   C("C-Page_Up"),                 # Tab nav: Go to prior (left) tab
    C("Shift-RC-Right_Brace"):  C("C-Page_Down"),               # Tab nav: Go to next (right) tab
    C("RC-Space"):              C("Alt-F1"),                    # Default SL - Launch Application Menu (gnome/kde)
    C("RC-F3"):                 C("Super-d"),                   # Default SL - Show Desktop (gnome/kde,eos)
    C("RC-Super-f"):            C("Alt-F10"),                   # Default SL - Maximize app (gnome/kde)
    # C("RC-Super-f"):            C("Super-Page_Up"),             # SL - Toggle maximized window state (kde_neon)
    # C("Super-Right"):           C("C-Alt-Right"),               # Default SL - Change workspace (budgie)
    # C("Super-Left"):            C("C-Alt-Left"),                # Default SL - Change workspace (budgie)
    C("RC-Q"):                  C("Alt-F4"),                    # Default SL - not-popos
    C("RC-H"):                  C("Super-h"),                   # Default SL - Minimize app (gnome/budgie/popos/fedora) not-deepin
    # C("RC-H"):                  C("Super-n"),                   # Default SL - Minimize app (deepin)
    C("Alt-Tab"):               ignore_key,                     # Default - Cmd Tab - App Switching Default
    C("RC-Tab"):               [bind, C("Alt-Tab")],            # Default - Cmd Tab - App Switching Default
    C("Shift-RC-Tab"):         [bind, C("Alt-Shift-Tab")],      # Default - Cmd Tab - App Switching Default
    C("RC-Grave"):             [bind, C("Alt-Grave")],          # Default not-xfce4 - Cmd ` - Same App Switching
    C("Shift-RC-Grave"):       [bind, C("Alt-Shift-Grave")],    # Default not-xfce4 - Cmd ` - Same App Switching
    # C("RC-Grave"):              C("Super-Tab"),                 # xfce4 Switch within app group
    # C("Shift-RC-Grave"):        C("Super-Shift-Tab"),           # xfce4 Switch within app group
    # C("Super-Right"):           C("Super-Page_Up"),             # SL - Change workspace (ubuntu/fedora)
    # C("Super-Left"):            C("Super-Page_Down"),           # SL - Change workspace (ubuntu/fedora)
    # C("Super-Right"):           C("Super-C-Up"),                # SL - Change workspace (popos)
    # C("Super-Left"):            C("Super-C-Down"),              # SL - Change workspace (popos)
    # C("RC-Q"):                  C("Super-q"),                   # SL - Close Apps (popos)
    # C("RC-Space"):              C("Super-Space"),               # SL - Launch Application Menu (eos)
    # C("RC-H"):                  C("Super-Page_Down"),           # SL - Minimize app (kde_neon)
                                                                  # SL - Default SL - Change workspace (kde_neon)
    # C("RC-Space"):              C("LC-Esc"),                    # SL- Launch Application Menu xfce4
    # C("RC-F3"):                 C("C-Alt-d"),                   # SL- Show Desktop xfce4
    # C("RC-LC-f"):               C("Super-Up"),                  # SL- Maximize app eos
    # C("RC-LC-f"):               C("Super-PAGE_UP"),             # SL- Maximize app manjaro

    # Basic App hotkey functions
    # C("RC-H"):                  C("Alt-F9"),                    # SL - Minimize app xfce4
    # C("RC-LC-f"):               C("Super-PAGE_DOWN"),           # SL - Minimize app manjaro

    # In-App Tab switching
    # C("Alt-Tab"):               C("C-Tab"),                     # Chromebook/IBM - In-App Tab switching
    # C("Alt-Shift-Tab"):         C("C-Shift-Tab"),               # Chromebook/IBM - In-App Tab switching
    # C("Alt-Grave") :            C("C-Shift-Tab"),               # Chromebook/IBM - In-App Tab switching
    C("Super-Tab"):             C("LC-Tab"),                    # Default not-chromebook
    C("Super-Shift-Tab"):       C("Shift-LC-Tab"),              # Default not-chromebook

    # Fn to Alt style remaps
    C("RAlt-Enter"):            C("insert"),                    # Insert

    # emacs style
    C("Super-a"):               C("Home"),                      # Beginning of Line
    C("Super-e"):               C("End"),                       # End of Line
    C("Super-b"):               C("Left"),
    C("Super-f"):               C("Right"),
    C("Super-n"):               C("Down"),
    C("Super-p"):               C("Up"),
    C("Super-k"):              [C("Shift-End"), C("Backspace")],
    C("Super-d"):               C("Delete"),

    # C("Alt-RC-Space"):          C(""),                          # Open Finder - Placeholder not-deepin
    # C("Alt-RC-Space"):          C("Super-e"),                   # Open Finder - Placeholder (deepin)

    # Wordwise
    C("RC-Left"):               C("Home"),                      # Beginning of Line
    C("Shift-RC-Left"):         C("Shift-Home"),                # Select all to Beginning of Line
    C("RC-Right"):              C("End"),                       # End of Line
    C("Shift-RC-Right"):        C("Shift-End"),                 # Select all to End of Line
    # C("RC-Left"):               C("C-LEFT_BRACE"),              # Firefox-nw - Back
    # C("RC-Right"):              C("C-RIGHT_BRACE"),             # Firefox-nw - Forward
    # C("RC-Left"):               C("Alt-LEFT"),                  # Chrome-nw - Back
    # C("RC-Right"):              C("Alt-RIGHT"),                 # Chrome-nw - Forward
    C("RC-Up"):                 C("C-Home"),                    # Beginning of File
    C("Shift-RC-Up"):           C("C-Shift-Home"),              # Select all to Beginning of File
    C("RC-Down"):               C("C-End"),                     # End of File
    C("Shift-RC-Down"):         C("C-Shift-End"),               # Select all to End of File
    # C("RAlt-Backspace"):        C("Delete"),                    # Chromebook/IBM - Delete
    C("Super-Backspace"):       C("C-Backspace"),               # Delete Left Word of Cursor
    C("Super-Delete"):          C("C-Delete"),                  # Delete Right Word of Cursor
    # C("LAlt-Backspace"):        C("C-Backspace"),               # Chromebook/IBM - Delete Left Word of Cursor
    C("Alt-Backspace"):         C("C-Backspace"),               # Default not-chromebook
    C("RC-Backspace"):          C("C-Shift-Backspace"),         # Delete Entire Line Left of Cursor
    C("Alt-Delete"):            C("C-Delete"),                  # Delete Right Word of Cursor
    # C(""):                      ignore_key,                     # cancel
    # C(""):                      C(""),                          #

}, "General GUI")
