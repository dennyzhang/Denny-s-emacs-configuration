;; -*- coding: utf-8 -*-
;; File: packages.el --- Maintain 3rd packages by ELPA
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2016-07-31 18:27:49>
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

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

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
                          'swift-mode 'htmlize
                          )
;; --8<-------------------------- separator ------------------------>8--
;; File: packages.el ends here
