FROM silex/emacs:27.0-alpine

RUN apk update
RUN apk add git

# RUN apt-get update
# RUN apt-get install -y \
#   git \
#   emacs-nox \
#   elpa-magit \
#   locales

# RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV EMACS_BRANCH="master"
ENV EMACS_VERSION="master"
ENV TERM=screen-256color

COPY startup.el /startup.el
COPY theme.el /theme.el
COPY .emacs /root/.emacs
COPY .bashrc /root/.bashrc

RUN emacs --batch -l /startup.el -l /theme.el
RUN rm /startup.el
RUN mkdir /.ssh

CMD eval `resize` && emacs --no-window-system --eval '(progn (load "/theme.el") (enable-theme (intern "magonyx")) (magit-status) (delete-other-windows))'