# --- MISC COMPLETIONS --- #

# @TODO: Fix these for zsh
# # Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && \
# complete -o "default" -o "nospace" -W "$(grep "^[Hh]ost" ~/.ssh/configs/* | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" \
# scp sftp ssh rsync ssh.hostinfo ssh.clearknownhost ssh.hostname
#
# # Add tab completion for `defaults read|write NSGlobalDomain`
# # You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults
#
# # Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# pipx
{ register-python-argcomplete && eval "$(register-python-argcomplete pipx)" } &>/dev/null

# case insensitive completion (only if there is no case sensitive match)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_PATH/zsh"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# Fast Completion Cache
# Adapted from the various iterations at this url:
# https://gist.github.com/ctechols/ca1035271ad134841284
() {
  setopt local_options
  setopt extendedglob
  autoload -Uz compinit
  local compdump="$ZSH_COMPDUMP"
  local last_updated="${compdump}.updated"

  if [[ -e $last_updated && -f $last_updated(#qN.md-1) ]]; then
    compinit -C -d $compdump
  else
    compinit -d $compdump
    touch $last_updated
  fi

  # Regenerate if zcompdump exists and is older than the compiled file
  if [[ -s $compdump && (! -s $compdump.zwc || $compdump -nt $compdump.zwc) ]]; then
    # Don't delete (only move it) since current shells might still use it
    [[ -e $compdump.zwc ]] && mv -f $compdump.zwc $compdump.zwc.old
    # Compile it in the background
    zcompile -M $compdump &!
  fi
}
autoload -Uz bashcompinit && bashcompinit

