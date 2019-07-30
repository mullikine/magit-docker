FROM alpine:3.9

COPY startup.el /startup.el
COPY .emacs /root/.emacs

RUN apk add --no-cache \
        git \
        emacs

ENV EMACS_BRANCH="master"
ENV EMACS_VERSION="master"

RUN emacs --batch -l /startup.el
RUN rm /startup.el
RUN mkdir /gitrepo; cd gitrepo

CMD cd /gitrepo; emacs --no-window-system --eval '(progn (magit-status) (delete-other-windows))'