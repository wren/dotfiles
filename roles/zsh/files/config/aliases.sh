# One-liners of various flavors (aliases, functions, etc)

#--- System ---#
alias mv="mv -iv"
alias cp="cp -ivr"
alias mkdir="mkdir -pv"
function cdp(){ mkdir -p "$@"; cd "$@"; }
# alias rm='trash -v' # or: rm="rm -rv"
alias plist-to-xml='plutil -convert xml1'
alias top='bpytop'
alias h='run-help'
alias l='less-with-pipe'
alias ll='exa --time-style=long-iso --color=always --icons -la'
function lg(){ l ${2:-.} | rg --max-columns=999 --color=always -i $1; }
function lt(){ ll --tree --icons --ignore-glob=".git|Alfred.alfredpreferences|node_modules" $@ | less; }
alias ssh.init='eval `ssh-agent`;ssh-add'
alias files.show='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias files.hide='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias ping='prettyping --nolegend'
alias sudo.with.env='sudo --preserve-env --shell'
function rmds(){ fd -HI '^\.DS_Store' ${@:-.} --type file --exec trash -v; }
function man(){ local max=88; COLUMNS=$(( $COLUMNS < $max ? $COLUMNS : $max )) command man "$@"; }
function show-all(){ cat -A $1 | sed 's/ /␠/g' | cat -n; }

#--- Git ---#
alias g='git'
alias gar="git ls-files -z -d | xargs -0 git rm"
alias gblame="git ls-files | grep -E '\.(py|php|html|htm|css|js|md|sql|htaccess|xml|txt)$' | xargs -n1 git blame --line | grep -E '^author '|sort|uniq -c|sort -nr"
alias yolo='git commit -am "DEAL WITH IT" && git push -f'

#--- Diff ---#
alias dsf='diff-so-fancy'
function df(){ diff -ru $@ | diff-so-fancy | less -F; }
compdef _files df

#--- Docker ---#
alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'
alias ds='docker-sync'
alias d.rmall.containers='docker rm $(docker ps -a -q)'
alias d.rmall.images='docker rmi $(docker images -q)'
alias d.stop.containers='docker stop $(docker ps -aq)'
alias d.start='eval $(docker-machine env default)'
alias d.exec='func{docker exec -it "$@";}; func'

#--- Apps ---#
alias f='fd --hidden' # find including hidden
alias ff='fd -HI' # find all
alias fp='printf ''%s\n'' "${path[@]}" | rg --passthru' # find in path
alias fe='env | rg -v ''^(PATH|(LS|EXA)_?COLORS)='' | rg' # find in env
alias fa='alias | rg' # find an alias
alias size='ff -d 1 -x du -sh -- ''{/}'' | sort -hr | l'
alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
alias poetry.shell='source "$(dirname $(poetry run which python))/activate"'

# jrnl
alias j='jrnl notes'
alias jn='jrnl notes'
alias je='jn --edit'
alias js='jn --short'
function jt(){ jn "$@\n+todo"; }
alias jte='je +todo -and'
alias jts='js +todo -and'
function jp() {
  my_root="$(git root 2>/dev/null || echo ".")"
  my_template_file="${my_root}/notes-template.jrnl"

  jrnl \
    --config-override journals.default "${my_root}/project-notes.jrnl" \
    $([[ -f $my_template_file ]] && echo "--config-override template '$my_template_file'") \
    "$@"
}
alias jpe='jp --edit'
alias jps='jp --short'
alias j.business='jn --config-override template ~/.config/jrnl/templates/business-times.jrnl'
alias j.hwt='jn --config-override template ~Dotfiles/config/jrnl/templates/hwt.jrnl'
alias j.test='jrnl --config-file ~/Projects/Jrnl/test-journals/test.yaml'
alias je.test='j.test --edit'

alias py='python'
alias speedtest='speed-test --verbose'
alias ta='tmux-attach-fzf'
alias tk='tmux kill-server'
alias tn='tmux new'
alias v='lvim'
alias wh='which -a'
alias pack='pretty-packer pack'
alias unpack='pretty-packer unpack'
alias encrypt='age --recipient $SOPS_AGE_RECIPIENTS --encrypt'
alias decrypt='age --identity $SOPS_AGE_KEY_FILE --decrypt'
alias enc='encrypt'
alias dec='decrypt'
