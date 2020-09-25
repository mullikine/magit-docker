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
    vlandeiro-magit-docker-030d5134:1.0 \
    /bin/sh -c "eval \`resize\` && emacs --no-window-system --eval '(progn (magit-status) (delete-other-windows))'"

# vlandeiro/magit:latest \
# /bin/sh -c "emacs --no-window-system --eval '(progn (magit-status) (delete-other-windows))'"
# docker run --rm -v "$(pwd):/$(pwd | slugify)" -w "/$(pwd | slugify)" -ti --entrypoint= vlandeiro-magit-docker-030d5134:1.0 /bin/sh -c "eval `resize` && emacs --no-window-system --eval '(progn (magit-status) (delete-other-windows))'"
# nvt docker exec -it rstudio_s 