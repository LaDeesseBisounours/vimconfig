#!/usr/bin/bash
scrot $1 '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/screens/'
