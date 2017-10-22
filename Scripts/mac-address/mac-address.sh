#!/usr/bin/env bash
#
# Script to change mac address of computer to another random, but valid, mac address.
#
# Based on http://www.zdziarski.com/blog/?p=2738
# Optimized by Jonathan Wren <jonathan@nowandwren.com>

INTERFACE=en0
OUI="$(dirname "${BASH_SOURCE[0]}")/oui.txt"
OUI_LEN=$(cat $OUI | wc -l)

# only do anything if not already connected
if [ "inactive" = "`ifconfig ${INTERFACE} | grep status: | awk '{print $2}'`" ]; then
    VENDOR=$(sed "$(shuf -i1-${OUI_LEN} -n1)q;d" $OUI)
    ID=$(openssl rand -hex 3)
    MAC="$(printf '%s%s' "$VENDOR" "$ID" | sed -e 's/..\B/&:/g')"
    eval "$(printf 'ifconfig %s ether %s' "$INTERFACE" "$MAC")"
fi
