#!/usr/bin/env zsh

# variables:
# -u none
# headless
# 5/6
# {empty}/./filename

# -L rc ',-u NORC,-u NONE,--clean' \
# -L cmd nvim,nvim-6 \
# -L head ',--headless' \

hyperfine --warmup 5 \
  -L cmd 'nvim,nvim-nightly' \
  -L file ',init.lua' \
  -L rc '--clean,,-i NONE' \
  '{cmd} +qa {rc} {file}' \
