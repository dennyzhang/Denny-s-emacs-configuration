;; -*- coding: utf-8 -*-
;; File: largeessentialpackage-setting.el --- org-mode export css
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-03-11 12:03:00>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;; (add-to-list 'load-path (concat EMACS_VENDOR "/cedet-1.0pre7/common"))
;; (add-to-list 'load-path (concat EMACS_VENDOR "/cedet-1.0pre7/ede"))
;; (add-to-list 'load-path (concat EMACS_VENDOR "/cedet-1.0pre7/semantic"))
;; (add-to-list 'load-path (concat EMACS_VENDOR "/cedet-1.0pre7/srecode"))
;; (add-to-list 'load-path (concat EMACS_VENDOR "/cedet-1.0pre7/cogre"))
;; (add-to-list 'load-path (concat EMACS_VENDOR "/cedet-1.0pre7/eieio"))
;; (add-to-list 'load-path (concat EMACS_VENDOR "/cedet-1.0pre7/contrib"))
;; (load-file (concat EMACS_VENDOR "/cedet-1.0pre7/common/cedet.el"))
;; (load-file (concat EMACS_VENDOR "/cedet-1.0pre7/ede/ede.el"))
;; (require 'cedet)
;; (require 'ede)
;; (require 'srecode)
;; (require 'cogre)
;; (require 'cedet-contrib)
;; (require 'semantic-ia)
;; ;;(semantic-mode 1)
;; (global-ede-mode 1) ; Enable the Project management system
;; ;;(ede-cpp-root-project "NAME" :file "~/cm/Makefile")
;; (global-srecode-minor-mode 1)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)
;; (semantic-load-enable-code-helpers) ; Enable prototype help and smart completion
;; ;;(global-srecode-minor-mode 1) ; Enable template insertion menu
;; ;;(global-set-key [(meta p)(n)] 'semantic-ia-complete-symbol)
;; ;; --8<-------------------------- §separator§ ------------------------>8--
;; (custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(global-semantic-decoration-mode nil nil (semantic-decorate-mode))
;; '(global-semantic-highlight-edits-mode nil nil (semantic-util-modes))
;; '(global-semantic-highlight-func-mode nil nil (semantic-util-modes))
;; '(global-semantic-idle-completions-mode nil nil (semantic-idle))
;; '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
;; '(global-semantic-idle-summary-mode t nil (semantic-idle))
;; '(global-semantic-idle-tag-highlight-mode nil nil (semantic-idle))
;; '(global-semantic-mru-bookmark-mode t nil (semantic-util-modes))
;; '(global-semantic-show-parser-state-mode nil nil (semantic-util-modes))
;; '(global-semantic-show-unmatched-syntax-mode t nil (semantic-util-modes))
;; '(global-semantic-stickyfunc-mode nil nil (semantic-util-modes))
;; '(global-senator-minor-mode t nil (senator))
;; '(semanticdb-global-mode t nil (semanticdb))
;; '(which-function-mode t))
;; (custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )
;; ;; --8<-------------------------- §separator§ ------------------------>8--
;; (require 'semantic-c nil 'noerror)
;; (semantic-add-system-include "d:/work/maui_svn/trunk/src/mgmt/pylib/" 'python-mode)
;; (semantic-add-system-include "d:/work/maui_svn/trunk/include/mgmt/cm/" 'c++-mode)
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: largeessentialpackage-setting.el ends here
