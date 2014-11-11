;; -*- coding: utf-8 -*-
;; File: set-file-mode-setting.el
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2014-11-10 22:26:30>
;;
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/actionscript/actionscript-mode.el"))
;; (add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("^filebat.txt$" . (company-mode 1))) ;; TODO doesn't work
(add-to-list 'auto-mode-alist '("^filebat.txt$" . (rainbow-mode 1)))
(add-to-list 'auto-mode-alist '("^tmp$" . (company-mode 1)))
(add-to-list 'auto-mode-alist '("^tmp$" . (rainbow-mode 1)))
(add-to-list 'auto-mode-alist '("^tmp$" . (flyspell-mode 1)))

;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'auto-mode-alist '("filebat.splashscreen" . (iimage-mode 1)))
;;(add-to-list 'auto-mode-alist '("filebat.splashscreen" . (enriched-mode 1)))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("\\.groovy$" . java-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . html-mode));;rhtml
(add-to-list 'auto-mode-alist '("\\.mm$" . objc-mode))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("\\.mxml$" . nxml-mode))
(setq nxml-mode-hook
      #'(lambda ()
         (setq tab-width 2
               indent-tabs-mode nil)
         (set-variable 'nxml-child-indent 2)
         (set-variable 'nxml-attribute-indent 2)
         ))
;; --8<-------------------------- separator ------------------------>8--
;; crontab
(load-file (concat EMACS_VENDOR "crontab-mode/crontab-mode.el"))
(add-to-list 'auto-mode-alist '("\\.cron$" .crontab-mode))
(add-to-list 'auto-mode-alist '("\\.tab$" .crontab-mode))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "systemtap-mode/systemtap-mode.el"))
(add-to-list 'auto-mode-alist '("\\.stp$" . systemtap-mode))
;; --8<-------------------------- separator ------------------------>8--
;;ledger
;;(add-to-list 'load-path (concat EMACS_VENDOR "/ledger"))
(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("\\.erb$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . (c++-mode 1)))
(add-to-list 'auto-mode-alist '("\\.h$" . (c++-mode 1)))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "google-go/go-mode.el"))
;;(load-file (concat EMACS_VENDOR "google-go/go-mode-load.el"))
;;(require 'go-mode-load)
(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "puppet-mode/puppet-mode.el"))
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("^rholog.txt$" . (log4j-mode 1)))
(add-to-list 'auto-mode-alist '("\\.app$" . (conf-mode 1)))
(add-to-list 'auto-mode-alist '("\\.thrift$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.conf$" . (conf-mode 1)))
(add-to-list 'auto-mode-alist '("\\.py$" . (python-mode 1)))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hbs.erb$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jst$" . html-mode))
;; --8<-------------------------- separator ------------------------>8--
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; --8<-------------------------- separator ------------------------>8--
(defun hide-trailing-whitespace (mode-hook)
  (add-hook mode-hook (lambda ()
                        (set (make-local-variable 'trailing-whitespace) nil))))

(mapcar 'hide-trailing-whitespace
        '(comint-mode-hook
          ibuffer-mode-hook
          compilation-mode-hook
          shell-mode-hook
          eshell-mode-hook
          dired-mode-hook
          erc-mode-hook))
;; --8<-------------------------- separator ------------------------>8--
;; File: set-file-mode-setting.el
