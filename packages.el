;; -*- coding: utf-8 -*-
;; File: packages.el --- Maintain 3rd packages by ELPA
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2025-08-25 20:52:28>
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
                          ("melpa stable" . "https://stable.melpa.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")
                          ;; ("org" . "http://orgmode.org/elpa/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed ;; 'iedit
                           'magit 'weblogger 'emms
			  ;;'Screenshot
                          'org-mime 
			  ;;'org-bullets
                          'yasnippet 'http-post-simple 'graphviz-dot-mode
                          'goto-last-change 'fold-dwim
			  ;; 'anything
			  'elscreen
                          'kill-ring-search 'rainbow-mode
			  ;; 'highlight-tail
                          'company
                          ;; http://melpa.org/#/rust-mode
			  ;; TODO enable rust
                          ;; 'rust-mode
			  ;; 'hide-region
			  ;; 'color-moccur
			  ;; 'cursor-chg
			  'loccur 
                          ;; 'cal-china-x
                          'boxquote 'whitespace 'highlight-symbol
                          'bm
			  ;; 'frame-cmds
			  ;; 'frame-fns
			  ;;'color-theme
			  ;;'hide-comnt 
                          ;;'dired+
			  ;; 'openwith
			  'erlang 'google-maps 'swift-mode 'htmlize
                          'popup
                          ;; 'winpoint
			  ;;'rect-mark
			  'ansi 'sr-speedbar 'minimap
                          'flycheck 'flymake-cursor 
                          'fringe-helper 'exec-path-from-shell 
			  ;; 'ascii
			  ;; 'command-frequency
                          'sr-speedbar
			  ;;'keywiz
			  'log4j-mode 'sl 'keyfreq 
                          'csharp-mode 'actionscript-mode
			  ;;'crontab-mode
                          ;; 'systemtap-mode
			  'go-mode 'puppet-mode
			  ;;'multi-term
			  ;; 'second-sel
                          ;; 'journal
                          ;; 'org-bullets
			  ;; 'tea-time
                          'ox-hugo
                          )
;; --8<-------------------------- separator ------------------------>8--
;; File: packages.el ends here
