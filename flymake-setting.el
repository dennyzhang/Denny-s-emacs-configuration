;; -*- coding: utf-8 -*-
;; File: flymake-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-30 11:09:18>
;;
;; --8<-------------------------- separator ------------------------>8--
(require 'flymake)
;; Display flymake error msg in minibuffer after delay
(load-file (concat EMACS_VENDOR "/flymake-cursor/flymake-cursor.el"))
;; Change the default colors
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")
;;set flymake log level
(setq flymake-log-level 1)
;; Prefer to display errors/warnings in the way of minibuffer, instead of pop up a menu
(defun flymake-display-error-minibuffer-for-current-line ()
  "Display minibuffer with errors/warnings for current line if it has errors and/or warnings."
  (interactive)
  (when flymake-mode ;; Just check when `flymake-mode' is enable.
    (let (msg)
      ;; It's possible that current line has errors/warnings, but current point has no complains.
      ;; Thus we move the point to the end of the line, then move one character backward.
      (save-excursion
        (move-end-of-line 1)
        (backward-char 1)
        (setq msg (get-char-property (point) 'help-echo)))
      ;; Remove blank lines form information.
      (if msg (setq msg (replace-regexp-in-string "^[ \t]*\n" "" msg)))
      ;; Show information.
      (if msg (message msg))
      )))
;;Invoke flymake-display-error-minibuffer-for-current-line,
;; instead of flymake-display-err-menu-for-current-line
(define-key global-map (kbd "C-c d") 'flymake-display-error-minibuffer-for-current-line)
(define-key global-map (kbd "C-c p") 'flymake-goto-prev-error)
(define-key global-map (kbd "C-c n") 'flymake-goto-next-error)

;; show errors and warnings of flymake with different fringe bitmaps
(load-file (concat EMACS_VENDOR "/fringe-helper/fringe-helper.el"))

(defvar flymake-fringe-overlays nil)
(make-variable-buffer-local 'flymake-fringe-overlays)

(defadvice flymake-make-overlay (after add-to-fringe first
                                       (beg end tooltip-text face mouse-face)
                                       activate compile)
  (push (fringe-helper-insert-region
         beg end
         (fringe-lib-load (if (eq face 'flymake-errline)
                              fringe-lib-exclamation-mark
                            fringe-lib-question-mark))
         'left-fringe 'font-lock-warning-face)
        flymake-fringe-overlays))

(defadvice flymake-delete-own-overlays (after remove-from-fringe activate compile)
  (mapc 'fringe-helper-remove flymake-fringe-overlays)
  (setq flymake-fringe-overlays nil))
;; --8<-------------------------- separator ------------------------>8--
;;flymake for php mode
;; a standalone check file, leverage "php -l" and php_codesniffer
(setq my-php-check-file (concat DENNY_CONF "emacs_data/php_lint.sh"))
(defun flymake-php-init ()
  "Use php and phpcs to check the syntax and code compliance of the current file."
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list my-php-check-file (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.php$\\|\\.module$|\\.install$|\\.inc$|\\.engine$"
               flymake-php-init))

;; Pear coding standards : http://pear.php.net/manual/en/standards.indenting.php
(defun pear/php-mode-init ()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0))
(add-hook 'php-mode-hook 'pear/php-mode-init)

(defun my-php-hook-function ()
  (set (make-local-variable 'compile-command)
       (format "%s %s" my-php-check-file (buffer-file-name))))

(add-hook 'php-mode-hook
          '(lambda ()
             (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
             (my-php-hook-function)
             (make-local-variable 'flymake-err-line-patterns)
             (setq flymake-err-line-patterns
                   '(;; This is the error format for: php -f somefile.php -l
                     ("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2)
                     ;;This is the error format for: phpcs --standard=PEAR --report=emacs somefile.php
                     ("\\(.*?\\):\\([0-9]+\\):\\([0-9]+\\): +\\(.*?\\)$" 1 2 3 4))
                   )))
;; --8<-------------------------- separator ------------------------>8--
;; ;;flymake for html mode
;; (defun flymake-html-init ()
;; (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 'flymake-create-temp-inplace))
;; (local-file (file-relative-name
;; temp-file
;; (file-name-directory buffer-file-name))))
;; (list "tidy" (list local-file))))
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.html$\\|\\.ctp" flymake-html-init))
;; (add-hook 'html-mode-hook
;; (lambda ()
;; (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
;; (make-local-variable 'flymake-err-line-patterns)
;; (setq flymake-err-line-patterns '(("line \\([0-9]+\\) column \\([0-9]+\\) - \\(.*\\)" nil 1 2 3)))))
;; --8<-------------------------- separator ------------------------>8--
;;flymake for shell mode
(defun flymake-shell-init ()
  (unless (tramp-file-name-p buffer-file-name)
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "/bin/bash" (append (list "-n") (list local-file))))))

(defun my-shell-hook-function ()
  (set (make-local-variable 'compile-command)
       (format "/bin/bash -c %s" (buffer-file-name))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.sh$" flymake-shell-init))
(add-hook 'sh-mode-hook
          '(lambda()
             (unless (tramp-file-name-p buffer-file-name)
               (flymake-mode t)
               (my-shell-hook-function)
               (make-local-variable 'flymake-err-line-patterns)
               (setq flymake-err-line-patterns
                     '(("^\\(.+\\): line \\([0-9]+\\): \\(.+\\)$" 1 2 nil 3))))))
;; --8<-------------------------- separator ------------------------>8--
;;flymake for elisp mode
(defun flymake-elisp-init ()
  (unless (string-match "^ " (buffer-name))
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list
       (expand-file-name invocation-name invocation-directory)
       (list
        "-Q" "--batch" "--eval"
        (prin1-to-string
         (quote
          (dolist (file command-line-args-left)
            (with-temp-buffer
              (insert-file-contents file)
              (condition-case data
                  (scan-sexps (point-min) (point-max))
                (scan-error
                 (goto-char(nth 2 data))
                 (princ (format "%s:%s: error: Unmatched bracket or quote\n"
                                file (line-number-at-pos)))))))
          )
         )
        local-file)))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.el$" flymake-elisp-init))
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
             ))

(add-hook 'lisp-mode-hook
          '(lambda ()
             (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
             ))
;; --8<-------------------------- separator ------------------------>8--
;;flymake for css mode
(defun flymake-css-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "cssparse" (list local-file))))

(defun my-css-hook-function ()
  (set (make-local-variable 'compile-command)
       (format "cssparse %s" (buffer-file-name))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.css$" flymake-css-init))
(add-hook 'css-mode-hook
          '(lambda ()
             (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
             (my-css-hook-function)
             (make-local-variable 'flymake-err-line-patterns)
             (setq flymake-err-line-patterns
                   '("\\(.*\\) \\[\\([0-9]+\\):\\([0-9]+\\): \\(.*\\)\\]" nil 2 3 1))))
;; --8<-------------------------- separator ------------------------>8--
;;flymake for javascript mode
;;TODO, problematic
(defun flymake-jslint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "rhino" (list (expand-file-name
                         (concat EMACS_VENDOR "nonelisp-tool/jslint/jslint.js") local-file)))))

(defun my-js-hook-function ()
  (set (make-local-variable 'compile-command)
       (format "rhino %s %s" (concat EMACS_VENDOR "nonelisp-tool/jslint/jslint.js") (buffer-file-name))))

(setq flymake-allowed-file-name-masks
      (cons '(".+\\.js$"
              flymake-jslint-init
              flymake-simple-cleanup
              flymake-get-real-file-name)
            flymake-allowed-file-name-masks))
(add-hook 'javascript-mode-hook
          '(lambda ()
             (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
             (my-js-hook-function)
             (make-local-variable 'flymake-err-line-patterns)
             (setq flymake-err-line-patterns
                   '("^Lint at line \\([[:digit:]]+\\) character \\([[:digit:]]+\\): \\(.+\\)$" nil 1 2 3))))
;; --8<-------------------------- separator ------------------------>8--
;;flymake for ruby
;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(defun my-ruby-hook-function ()
  (set (make-local-variable 'compile-command)
       (format "ruby -c %s" (buffer-file-name))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.rb$\\|\\.Rakefile$" flymake-ruby-init))
(add-hook 'ruby-mode-hook
          '(lambda ()
             ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
             (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
                 (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
               )
             (my-ruby-hook-function)
             (make-local-variable 'flymake-err-line-patterns)
             (setq flymake-err-line-patterns '(("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)))))
;; --8<-------------------------- separator ------------------------>8--
;; C mode.
(defun flymake-c-init ()
  (flymake-simple-make-init-impl 'flymake-create-temp-inplace t t
                                 (file-name-nondirectory buffer-file-name) 'flymake-get-c-cmdline))

(defun flymake-get-c-cmdline (source base-dir)
  (list "gcc" (list "-Wall" (concat base-dir source))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.c$\\|\\.h$" flymake-c-init))

;; C++ mode.
(defun flymake-c++-init ()
  (flymake-simple-make-init-impl 'flymake-create-temp-inplace t t
                                 (file-name-nondirectory buffer-file-name) 'flymake-get-c++-cmdline))

(defun flymake-get-c++-cmdline (source base-dir)
  (list "g++" (list "-Wall" (concat base-dir source))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.cpp$" flymake-c++-init))
;; --8<-------------------------- separator ------------------------>8--
;; Java mode.
(defun flymake-java-init ()
  (flymake-simple-make-init-impl
   'flymake-create-temp-inplace
   t
   t
   (file-name-nondirectory buffer-file-name)
   'flymake-get-java-cmdline))

(defun flymake-get-java-cmdline (source base-dir)
  (list "javac" (list "-g" (concat base-dir source))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.java$" flymake-java-init))
;; --8<-------------------------- separator ------------------------>8--
;; python mode
(setq my-python-check-file (concat DENNY_CONF "emacs_data/python_lint.py"))
(defun flymake-python-init ()
  "Use python and pythoncs to check the syntax and code compliance of the current file."
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list my-python-check-file (list "-p pylint,pyflakes,pep8" local-file))))
(add-to-list 'flymake-allowed-file-name-masks '("\\.py$" flymake-python-init))

(defun my-python-hook-function ()
  (set (make-local-variable 'compile-command)
       (format "%s -p pylint,pyflakes,pep8 %s" my-python-check-file (buffer-file-name))))

(add-hook 'python-mode-hook
          '(lambda ()
             ;; Activate flymake unless buffer is a tmp buffer for the interpreter
             (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
             (my-python-hook-function)
             (make-local-variable 'flymake-err-line-patterns)
             (setq flymake-err-line-patterns
                   '(;; This is the error format for: php -f somefile.php -l
                     ("\\(.*\\) at \\(.*\\) line \\(.*\\)." 2 3 nil 1)
                     ))))
;; --8<-------------------------- separator ------------------------>8--
(setq my-erlang-check-file (concat DENNY_CONF "emacs_data/erlang_lint.erl"))
(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name temp-file
                                         (file-name-directory buffer-file-name))))
    (list my-erlang-check-file (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

(defun my-erlang-hook-function ()
  (set (make-local-variable 'compile-command)
       (format "%s %s" my-erlang-check-file (buffer-file-name))))

(add-hook 'erlang-mode-hook
          '(lambda ()
             (unless (or (null buffer-file-name) (tramp-file-name-p buffer-file-name)) (flymake-mode t))
             (my-erlang-hook-function)
             (make-local-variable 'flymake-err-line-patterns)
             (setq flymake-err-line-patterns
                   '(
                     ("\\(.*\\):\\([0-9]+\\): \\(.*\\)" 1 2 nil 3)
                     ))))
;; --8<-------------------------- separator ------------------------>8--
;; Disable flymake for html and xml files as this is handled by nxml mode.
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.xml?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
;; --8<-------------------------- separator ------------------------>8--
;; File: flymake-setting.el ends here
