[ -f ~/.profile ] && source ~/.profile
export DOTFILES_DIR="$(dirname "$(dirname "$(readlink "${BASH_SOURCE[0]}")")")"

# Determine which host we're on, if possible
my_name="$(echo $HOSTNAME)"
my_hostname="default"
for i in $(find ~/.config/hosts -name 'test.sh'); do
  . "$i"
  [[ "${my_hostname}" =~ ^default$ ]] || break
done

# Make sure my_hostname directory exists, or set it back to default
[ -d ~/.config/hosts/${my_hostname} ] || my_hostname="default"

# Enable bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

for file in ~/.config/hosts/${my_hostname}/{envvars,sig}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Enable some Bash 4 features when possible:
# * nocaseglob: Case-insensitive globbing (used in pathname expansion)
# * histappend: Append to the Bash history file, rather than overwriting it
# * cdspell: Autocorrect typos in path names when using `cd`
# * autocd: e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * globstar: Recursive globbing, e.g. `echo **/*.txt`
for option in {nocaseglob,histappend,cdspell,autocd,globstar}; do
  shopt -s "$option" 2> /dev/null
done
unset option

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && \
complete -o "default" -o "nospace" -W "$(grep "^[Hh]ost" ~/.ssh/configs/* | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" \
scp sftp ssh rsync ssh.hostinfo ssh.clearknownhost ssh.hostname

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

