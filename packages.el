;; -*- coding: utf-8 -*-
;; File: packages.el --- Maintain 3rd packages by ELPA
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2015-01-21 11:03:47>
;; --8<-------------------------- separator ------------------------>8--
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (package-install package)
       ))
   packages))
;; --8<-------------------------- separator ------------------------>8--
;; activate installed packages
(package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'iedit 'magit 'weblogger 'emms 'jabber 'screenshot 
                          'yasnippet 'http-post-simple 'graphviz-dot-mode
                          'goto-last-change 'fold-dwim 'anything 'elscreen
                          'kill-ring-search 'hide-lines 'rainbow-mode 'highlight-tail
                          'company 'hide-region 'color-moccur 'cursor-chg 'loccur 
                          'cal-china-x 'boxquote 'whitespace 'highlight-symbol
                          'bm 'frame-cmds 'frame-fns 'color-theme 'hide-comnt 
                          'dired+ 'screenshot 'openwith 'erlang 'google-maps
                          'swift-mode
                          )
;; --8<-------------------------- separator ------------------------>8--
;; File: packages.el ends here
