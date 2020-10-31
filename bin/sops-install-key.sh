#! /bin/sh

loc="${keyfile_location/#\~/$HOME}"
mkdir -vp "$loc"
echo "$keyfile_contents" > "$loc/$keyfile_name"
