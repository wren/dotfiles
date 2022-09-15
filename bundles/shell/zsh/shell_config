
# Make sure some directories exist (zsh doesn't create them)
[[ -r "$XDG_DATA_HOME/zsh" ]]  || mkdir -p "$XDG_DATA_HOME/zsh"
[[ -r "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# Larger (allow 32⁴ entries) and cleaner history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTORY_IGNORE="(l|l *|lt|lt *|wh *|jt *|pwd|jobs|fg|jfg|* --version)"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt MENU_COMPLETE             # Autoselect the first completion entry instead of beeping.
setopt AUTO_LIST                 # Automatically list choices on an ambiguous completion. 
# setopt HIST_BEEP

setopt AUTO_CD                  # try to cd to entries that aren't valid commands
setopt RC_QUOTES                # Allow escaping quotes in strings by doubling i.e.' foo ''bar'' baz' (good for aliases)
setopt globdots                 # Include files/dirs that start with dots (e.g. .config) in globbing and completion


#--- Autoload ---#

# We have our own run-help in functions
unalias run-help &> /dev/null

# Functions
for file in "$ZDOTDIR"/functions/*; do
  autoload -Uz "$file"
done
