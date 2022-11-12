ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# these files are loaded in this order
my_dotfiles=(
  xdg
  env
  path
  motd
  prompt
  shell_config
  completion
  plugin_manager
  theme
  aliases
  keys
)

for my_file in $my_dotfiles; do
  source "$ZDOTDIR/$my_file"
done

export DOTFILES_LOADED=1
