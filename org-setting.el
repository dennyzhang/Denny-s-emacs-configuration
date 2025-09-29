;; -*- coding: utf-8 -*-
;; File: org-setting.el
;;
;; Author: Denny Zhang (https://www.dennyzhang.com/contact)
;; Created: 2008-10-01
;; Updated: <2025-08-30>
;; --8<-------------------------- separator ------------------------>8--

(require 'org)
(require 'ox-md)
(require 'org-tempo) ;; enable <e TAB expansions for example, src, quote

;; Set Org file associations
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Set org-agenda files
(setq org-agenda-files (list
                        (concat CONF-SHARE-DIR "/org_data/current.org")))

;; General Org-mode settings
(setq-default org-log-done t
              org-agenda-include-diary t
              org-src-fontify-natively t
              org-time-stamp-custom-formats '("<%Y-%m-%d>" . "<%Y-%m-%d %H:%M>"))

;; Agenda customization
(setq org-agenda-repeating-timestamp-show-all nil
      org-agenda-restore-windows-after-quit t)

;; Todo keyword faces
(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("DEFERRED" . shadow)
        ("CANCELED" . (:foreground "CornflowerBlue" :weight bold))))

;; Custom commands
(setq org-agenda-custom-commands
      '(("h" "Daily habits"
         ((agenda ""))
         ((org-agenda-show-log t)
          (org-agenda-ndays 7)
          (org-agenda-log-mode-items '(state))
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'notregexp ":Habit:"))))
        ("X" agenda ""
         ((ps-number-of-columns 2)
          (ps-landscape-mode t)
          (org-agenda-prefix-format " [ ] ")
          (org-agenda-with-colors nil)
          (org-agenda-remove-tags t))
         ("theagenda.ps"))))

;; Enable org-habit
(require 'org-habit)
(setq org-habit-graph-column 80)

;; Org directory & MobileOrg
(setq org-directory (concat CONF-SHARE-DIR "/org_data/")
      org-default-notes-file "current.org"
      org-mobile-inbox-for-pull (concat CONF-SHARE-DIR "/org_data/frommobile.org"))

;; Keybindings for org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (setq word-wrap t
                  truncate-lines t)))

;; Custom meta-return behavior for example blocks
(defun my-org-meta-return ()
  "Insert a new heading or #+BEGIN_EXAMPLE block depending on context."
  (interactive)
  (if (org-in-item-p)
      (org-meta-return)
    (org-meta-return)
    (insert "\n#+BEGIN_EXAMPLE\n\n#+END_EXAMPLE")
    (forward-line -3)
    (org-end-of-line)))

(org-defkey org-mode-map (kbd "M-RET") 'my-org-meta-return)

;; Jump to org-agenda
(defun jump-to-org-agenda ()
  (interactive)
  (unless (featurep 'org-agenda)
    (require 'org-agenda))
  (let ((buf (get-buffer "*Org Agenda*")))
    (if buf
        (select-window (display-buffer buf))
      (call-interactively 'org-agenda-list))))

;; Automatically copy DONE tasks to diary
(setq copylog-monitor-orgfiles '("current.org" "top.org"))
(setq copylog-dest-orgfile (concat CONF-SHARE-DIR "/org_data/life/diary.org"))

(defun copy-done-to-diary (orig-fun &rest args)
  "Advice to copy DONE tasks to diary after killing a line."
  (apply orig-fun args)
  (when (and (member (buffer-name) copylog-monitor-orgfiles)
             (string-match-p "^\\*+ DONE" (org-no-properties (car kill-ring))))
    (let ((entry (replace-regexp-in-string
                  "\\* DONE"
                  (concat "** " (format-time-string "%Y-%m-%d:"))
                  (car kill-ring))))
      (with-current-buffer (find-file-noselect copylog-dest-orgfile)
        (goto-char (point-max))
        (insert "\n" entry)
        (save-buffer)))))

(advice-add 'org-kill-line :around #'copy-done-to-diary)

;; Org-mime settings
(require 'org-mime)
(setq org-mime-library 'mml
      org-export-with-special-strings nil
      org-export-with-sub-superscripts nil)

;; Message mode hooks for HTML mail
(add-hook 'message-mode-hook
          (lambda ()
            (local-set-key "\C-c\M-o" 'org-mime-htmlize)
            (local-set-key "\C-c\C-h" 'message-html-send)))

(defun message-html-send ()
  (interactive)
  (org-mime-htmlize nil)
  (message-send))

;; Export settings
(require 'ox-md)
(load-file (concat CONF-DENNY-EMACS "/patch-src-code/ox-md-patch.el"))

;; Optional: use org-bullets
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Custom faces
(custom-set-faces
 '(org-checkbox ((t (:inherit bold))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo :foreground "DarkKhaki"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "LimeGreen"))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "YellowGreen"))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "SeaGreen3"))))
 '(org-todo ((t (:weight bold))))
 '(org-warning ((t (:inherit font-lock-warning-face :foreground "LightGoldenrod")))))

(require 'ox-md)

;; Load org-ox
(load-file (concat CONF-DENNY-EMACS "org-ox-hugo-setting.el"))

;; set shortcut
(define-key org-mode-map (kbd "M->") 'org-do-demote)
(provide 'org-setting)
