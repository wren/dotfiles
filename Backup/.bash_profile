export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
profile="${XDG_CONFIG_HOME}/bash/profile"
[ -r "$profile" ] && [ -f "$profile" ] && source "$profile"
