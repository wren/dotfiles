#!/usr/bin/env zsh

hostname="$(hostname)"
echo -n "💻 ${(U)hostname%%.*}"
