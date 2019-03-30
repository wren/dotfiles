[ -n "$PS1" ] && source ~/.bash_profile
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then source "$(brew --prefix)/etc/bash_completion"; fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
