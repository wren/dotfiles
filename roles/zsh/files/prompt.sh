# Enable Powerlevel10k instant prompt.
# NOTE: Anything requiring user input (prompts, etc), should go before this.
instant_prompt="$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r $instant_prompt ]] && source "$instant_prompt"
