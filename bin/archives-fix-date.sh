#!/bin/bash

# Copyright © 2020 Jonathan Wren <jonathan@nowandwren.com>
# MIT License (more info at https://opensource.org/licenses/MIT)
# https://github.com/wren/dotfiles/blob/main/bin/archives-fix-date.sh
#
# Changes the date of a pile of zipped files to match their contents

IFS=$'\n'
for file in $(find . -type f -name '*.7z'); do
  cd "$(dirname "$file")"
  ARCHIVE="$(basename "$file")"
  BASE="${ARCHIVE%.7z}"
  7z x "$ARCHIVE" && rm "$ARCHIVE"
  touch -d "$(find "$BASE" -type f -exec stat \{} --printf="%y\n" \; | sort -n -r | head -n 1)" "$BASE"
  7z a -stl -sdel -mx=9 "$ARCHIVE" "$BASE"
  cd -
  sleep 1
done
