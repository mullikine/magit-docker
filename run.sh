#!/bin/bash
export TTY

cd "$(vc get-top-level)"

docker \
    run \
    --rm \
    -v \
    "$(pwd):/$(pwd | slugify)" \
    -w \
    "/$(pwd | slugify)" \
    -ti \
    --entrypoint= \
    vlandeiro-magit-docker-030d5134:1.0 \
    /bin/sh -c "eval \`resize\` && emacs --no-window-system --eval '(progn (load \"/theme.el\") (enable-theme (intern \"magonyx\")) (magit-status) (delete-other-windows))'"