#!/usr/bin/env zsh
# Author: Jonathan Wren <jonathan@nowandwren.com>
# License: WTFPL (http://www.wtfpl.net/about/)

hostname="$(hostname)"
echo -n "💻 ${(U)hostname%%.*}"
