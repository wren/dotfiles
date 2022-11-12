ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# these files are loaded in this order
my_dotfiles=(
  xdg
  env
  path
  motd
  prompt
  options
  completion
  plugins
  theme
  aliases
  keymap
)

# config files
for my_file in $my_dotfiles; do
  source "$ZDOTDIR/$my_file"
done

# functions
for file in "$ZDOTDIR"/functions/*; do
  autoload -Uz "$file"
done

export DOTFILES_LOADED=1
