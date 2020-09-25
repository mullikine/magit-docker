(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
(package-refresh-contents)
(package-install 'magit nil)
(package-install 'magithub nil)
(package-install 'docker nil)
(package-install 'xclip nil)
(package-install 'shackle nil)
(package-install 'helm nil)
