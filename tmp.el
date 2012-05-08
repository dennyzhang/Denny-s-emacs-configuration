;; -*- coding: utf-8 -*-
;; File: tmp.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-05-04 15:06:31>
;; --8<-------------------------- separator ------------------------>8--
(defun save-information ()
  (dolist (func kill-emacs-hook)
    (unless (memq func '(exit-gnus-on-exit server-force-stop))
      (funcall func)))
  (unless (eq 'listen (process-status server-process))
    (server-start)))

(run-with-idle-timer 300 t 'save-information)
;; --8<-------------------------- separator ------------------------>8--
(size-indication-mode 1)
;; --8<-------------------------- separator ------------------------>8--
(defun eshell-spawn-external-command (beg end)
   "Parse and expand any history references in current input."
   (save-excursion
     (goto-char end)
     (when (looking-back "&!" beg)
       (delete-region (match-beginning 0) (match-end 0))
       (goto-char beg)
       (insert "spawn "))))

(add-hook 'eshell-expand-input-functions 'eshell-spawn-external-command)
;; --8<-------------------------- separator ------------------------>8--
(defun elint-current-buffer ()
  (interactive)
  (elint-initialize)
  (elint-current-buffer))

(eval-after-load "elint"
  '(progn
     (add-to-list 'elint-standard-variables 'current-prefix-arg)
     (add-to-list 'elint-standard-variables 'command-line-args-left)
     (add-to-list 'elint-standard-variables 'buffer-file-coding-system)
     (add-to-list 'elint-standard-variables 'emacs-major-version)
     (add-to-list 'elint-standard-variables 'window-system)))
;; --8<-------------------------- separator ------------------------>8--
(defun my-elisp-indent-or-complete (&optional arg)
  (interactive "p")
  (call-interactively 'lisp-indent-line)
  (unless (or (looking-back "^\\s-*")
              (bolp)
              (not (looking-back "[-A-Za-z0-9_*+/=<>!?]+")))
    (call-interactively 'lisp-complete-symbol)))

(defun my-lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
    (call-interactively 'slime-indent-and-complete-symbol)))

(defvar slime-mode nil)

(defun my-lisp-mode-hook (&optional emacs-lisp-p)
  (auto-fill-mode 1)
  ;;(paredit-mode 1)
  ;;(redshank-mode 1)

  ;;(column-marker-1 79)
  (let (mode-map)
    (if emacs-lisp-p
        (progn
          (require 'edebug)

          (setq mode-map emacs-lisp-mode-map)

          (define-key mode-map [(meta return)] 'outline-insert-heading)
          (define-key mode-map [tab] 'my-elisp-indent-or-complete)
          (define-key mode-map [tab] 'yas/expand))

      ;;(turn-on-cldoc-mode)

      (setq mode-map lisp-mode-map)

      (define-key mode-map [tab] 'my-lisp-indent-or-complete)
      (define-key mode-map [(meta ?q)] 'slime-reindent-defun)
      (define-key mode-map [(meta ?l)] 'slime-selector))))

(mapc (lambda (hook)
        (add-hook hook 'my-lisp-mode-hook))
      '(lisp-mode-hook inferior-lisp-mode-hook slime-repl-mode-hook))

(add-hook 'emacs-lisp-mode-hook (function (lambda () (my-lisp-mode-hook t))))
;; --8<-------------------------- separator ------------------------>8--
(defun tidy-xml-buffer ()
  (interactive)
  (save-excursion
    (call-process-region (point-min) (point-max) "tidy" t t nil
                         "-xml" "-i" "-wrap" "0" "-omit" "-q")))

(eval-after-load "nxml-mode"
  '(define-key nxml-mode-map [(control shift ?h)] 'tidy-xml-buffer))
;; --8<-------------------------- separator ------------------------>8--
(defun ido-smart-select-text ()
  "Select the current completed item.  Do NOT descend into directories."
  (interactive)
  (when (and (or (not ido-require-match)
                 (if (memq ido-require-match
                           '(confirm confirm-after-completion))
                     (if (or (eq ido-cur-item 'dir)
                             (eq last-command this-command))
                         t
                       (setq ido-show-confirm-message t)
                       nil))
                 (ido-existing-item-p))
             (not ido-incomplete-regexp))
    (when ido-current-directory
      (setq ido-exit 'takeprompt)
      (unless (and ido-text (= 0 (length ido-text)))
        (let ((match (ido-name (car ido-matches))))
          (throw 'ido
                 (setq ido-selected
                       (if match
                           (replace-regexp-in-string "/\\'" "" match)
                         ido-text)
                       ido-text ido-selected
                       ido-final-text ido-text)))))
    (exit-minibuffer)))

(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (define-key ido-file-completion-map "\C-m"
              'ido-smart-select-text)))
;; --8<-------------------------- separator ------------------------>8--
;; (eval-after-load "magit"
;;   '(progn
;;      (require 'magit-topgit)
;;      (require 'rebase-mode)

;;      (defun start-git-monitor ()
;;        (interactive)
;;        (start-process "git-monitor" (current-buffer) "~/bin/git-monitor"))

;;      ;;(add-hook 'magit-status-mode-hook 'start-git-monitor)
;;      ))
;; (require 'inf-ruby)
;; (require 'ruby-electric)
;; (require 'yari)

;; (defun my-ruby-smart-return ()
;;   (interactive)
;;   (when (memq (char-after) '(?\| ?\" ?\'))
;;     (forward-char))
;;   (call-interactively 'newline-and-indent))

;; (defun my-ruby-mode-hook ()
;;   (ruby-electric-mode)
;;   (inf-ruby-keys)

;;   (define-key ruby-mode-map [return] 'my-ruby-smart-return)
;;   (define-key ruby-mode-map [(control ?h) (control ?i)] 'yari-anything)

;;   (set (make-local-variable 'yas/fallback-behavior)
;;        '(apply ruby-indent-command . nil))
;;   (define-key ruby-mode-map [tab] 'yas/expand-from-trigger-key))

;; (add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
;; --8<-------------------------- separator ------------------------>8--
;;(add-hook 'mail-citation-hook 'sc-cite-original)
;; --8<-------------------------- separator ------------------------>8--
(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
      (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
;; --8<-------------------------- separator ------------------------>8--
(defun sort-lines-random (beg end)
  "Sort lines in region randomly."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hbs.erb$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jst$" . html-mode))
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
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
"
  (interactive)
  (let ((path-from-shell (string-rtrim (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
;; --8<-------------------------- separator ------------------------>8--
;;(add-hook 'sh-set-shell-hook 'flymake-shell-load)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
;; --8<-------------------------- separator ------------------------>8--
;; File: tmp.el ends here
