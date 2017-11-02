#!/usr/bin/env bash

curl -L https://github.com/jonathanwren/dotfiles/archive/master.zip -o /tmp/dotfiles.zip
unzip /tmp/dotfiles.zip -d ~ && mv ~/dotfiles-master ~/Dotfiles && cd ~/Dotfiles && ./scripts/init.sh && rm /tmp/dotfiles.zip

