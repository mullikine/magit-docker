#!/bin/sh

ic="$1"
: "${ic:="magit-status"}"

eval `resize`
emacs --no-window-system --eval "(progn ($ic) (delete-other-windows))"
