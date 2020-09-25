#!/bin/bash
export TTY

docker \
    run \
    --rm \
    -v \
    "$(pwd):/$(pwd | slugify)" \
    -w \
    "/$(pwd | slugify)" \
    -ti \
    --entrypoint= \
    vlandeiro/magit:latest \
    /bin/sh -c "emacs --no-window-system --eval '(progn (magit-status) (delete-other-windows))'"
