;; -*- coding: utf-8 -*-
;; File: linux-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-06-27 17:03:42>
;;
;; --8<-------------------------- separator ------------------------>8--
;; (create-fontset-from-fontset-spec
;; "-unknown-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-fontset-startup")
(setq default-frame-alist
      (append
       '(
         ;;(font . "fontset-startup")
         (foreground-color . "Wheat")
         (background-color . "DarkSlateGray")
         (cursor-color . "Orchid")
         )
       default-frame-alist))

 (create-fontset-from-fontset-spec
    "-unknown-Ubuntu Mono-normal-normal-normal-*-18-*-*-*-m-0-fontset-startup")
(setq default-frame-alist
      (append
       '(
         (font . "fontset-startup"))
                default-frame-alist))
;; --8<-------------------------- separator ------------------------>8--
(defun fullscreen-toggle ()
  "Toggle fullscreen status."
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   ;; if first parameter is '2', can toggle fullscreen status. Otherwise, can't toggle.
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] 'fullscreen-toggle)
;; --8<-------------------------- separator ------------------------>8--
;;gnuplot
(add-to-list 'load-path (concat EMACS_VENDOR "/gnuplot-mode.0.6.0"))
(load-file (concat EMACS_VENDOR "/org-plot/org-plot.el"))
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))
;;(global-set-key [(f9)] 'gnuplot-make-buffer)
;; --8<-------------------------- separator ------------------------>8--
;;alt+p r: root edit current file
(define-key global-map (kbd "M-p r") 'open-current-file-as-root)
(defun open-current-file-as-root ()
  "Open the current buffer as unix root. This command works on unixes only."
  (interactive)
  (when buffer-file-name
    (if (string-match "/sudo:root@localhost.*" buffer-file-name)
        ;; If the file is already opened as root priveledge, revert the buffer
        (revert-buffer nil t)
      (if buffer-read-only
          ;; open file in root priveledge, if necessary
          (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))
        (revert-buffer nil t))
      )
    )
  )
;; --8<-------------------------- separator ------------------------>8--
;; (set-default-font "-bitstream-Bitstream Charter-normal-normal-normal-*-17-*-*-*-*-0-iso10646-1")
;; (setq sl/x-font-en "DejaVu Sans Mono"
;; sl/x-font-zh "文泉驿正黑"
;; ;;sl/x-font-zh "WenQuanYi Micro Hei"
;; sl/x-font-zh-size 13.5)

;; (defun sl/set-x-font ()
;; (interactive)
;; (let ((fontset "fontset-default")
;; (zh-font (font-spec :family sl/x-font-zh :size sl/x-font-zh-size)))
;; (set-default-font sl/x-font-en)
;; (set-fontset-font fontset
;; 'nil '("Courier New" . "unicode-bmp"))
;; (set-fontset-font fontset
;; 'nil '("Baekmuk Dotum" . "unicode-bmp"))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;; (set-fontset-font fontset charset zh-font))))

;; (sl/set-x-font)
;; --8<-------------------------- separator ------------------------>8--
;; show file size and free space left in device
;;(load-file (concat EMACS_VENDOR "/df-mode/df-mode.el"))
;;(df-mode 1)
;; --8<-------------------------- separator ------------------------>8--
;; ;;Usage:M-x ascii-on RET
;; (load-file (concat EMACS_VENDOR "/ascii/ascii.el"))
;; (require 'ascii)
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/ess-5.14/lisp"))
(require 'ess-site) ;; TODO, it will always popup a *ESS* buffer
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(add-to-list 'auto-mode-alist '("\\.stata$" . stata-mode))
;;(org-defkey org-mode-map [(control meta ,)] 'org-shiftmetaleft)
;; --8<-------------------------- separator ------------------------>8--
;; File: linux-setting.el
