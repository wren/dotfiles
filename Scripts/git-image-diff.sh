#!/bin/bash

# printf '$1: %s\n$2: %s\n$3: %s\n$4: %s\n$5: %s\n$6: %s\n$7: %s\n\n' "$1" "$2" "$3" "$4" "$5" "$6" "$7"

# Some functions
exif() {
  mkdir -p "${tmp_dir}/${2}"
  local temp_file="${tmp_dir}/${2}/${name}"
  exiftool "$1" -@ ~/Dotfiles/Git/misc/exiftool-args > "$temp_file"
  echo "$temp_file"
}

# Set some variables we'll need
name="$1"
file1="$2"
file2="$5"
tmp_dir="$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')"
bn="$(basename "$file1")"

# Check for exif (required for text part of diff)
if ! command -v exiftool >/dev/null 2>&1; then
  printf '\ndiff --git a/%s b/%s\nindex 000000..000000 %s\n--- a/%s\n+++ b/%s\n@@ -1,1 +1,1 @@\n\n%s\n'  \
    "$name" "$name" "$5" "$name" "$name" \
    'Error: Exiftool required to use diff-image driver!'
  exit 0
fi

# The text part of the diff
git diff "$(exif "$file1" 'a')" "$(exif "$file2" 'b')" | sed -e "s!${tmp_dir}/[ab]!!;s!${2}!${name}!" | diff-so-fancy

# Check requirements for image part of diff
if [ -z "${IMAGE_DIFF}" ] || \
  diff "$file1" "$file2" > /dev/null || \
  ! command -v compare >/dev/null 2>&1 || \
  ! command -v montage >/dev/null 2>&1 || \
  compare "$file1" "$file2" /dev/null
then
  exit 0
fi

# Special cases
args='-quiet'

# JPGs can be a bit fuzzy
if [[ $name =~ \.jpe?g$ ]]; then
  args="${args} -fuzz 7%"
fi

# Do the image part of the diff
destfile="${tmp_dir}.${bn}.png"
compare $args "$file1" "$file2" png:- | \
  montage -geometry +4+4 "$file1" - "$file2" png:"$destfile" 2>/dev/null || true

# Output the diff montage to the stdin
imgcat "$destfile"
