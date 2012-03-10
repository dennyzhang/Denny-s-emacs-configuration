;; -*- coding: utf-8 -*-
;; File: programming-setting.el --- utilities for developers
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-03-11 00:56:51>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;;在html和css模式下将#XXXXXX按所代表的颜色着色
(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property (match-beginning 0)
                           (match-end 0)
                           'face (list :background
                                       (match-string-no-properties 0)))))))
(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))

(dolist (hook (list
               'html-mode-hook
               'css-mode-hook
               ))
  (add-hook hook 'hexcolour-add-to-font-lock))
;; --8<-------------------------- §separator§ ------------------------>8--
(define-skeleton skeleton-c-mode-main-func
  "generate int main(int argc, char * argv[]) automatic" nil
  "int main (int argc, char * argv[]) \n{\n"
  > _ "\n" > "return 0;"
  "\n}")
(define-abbrev-table 'c-mode-abbrev-table '(("main" "" skeleton-c-mode-main-func 1)))
(define-abbrev-table 'c++-mode-abbrev-table '(("main" "" skeleton-c-mode-main-func 1)))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun my-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist '(
                              (?\( _ ")")
                              (?\[ _ "]")
                              (?\" _ "\"")
                              (?\' _ "\'")
                              (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;;show current function name
(defun enable-which-function()
  (which-function-mode t))
;; --8<-------------------------- §separator§ ------------------------>8--
(dolist (hook programming-hook-list)
  (add-hook hook 'my-auto-pair)
  (add-hook hook 'hs-minor-mode)
  ;; (add-hook hook 'subword-mode) ;; TODO
  (add-hook hook 'enable-which-function))
;; --8<-------------------------- §separator§ ------------------------>8--
;;switch between .h and .cpp
(defun switch-head2source-file ()
  "if current file is a header file, then open the
 corresponding source file or vice versa."
  (interactive)
  (let ((f (buffer-file-name))
        (headers '("h" "hpp" "hxx"))
        (sources '("c" "cxx" "cpp" "cc")))
    (if f
        (let* ((b (file-name-sans-extension f))
               (x (file-name-extension f))
               (s (cond
                   ((member x headers) sources)
                   ((member x sources) headers)
                   (t nil)))
               (return-value nil))
          (while s
            (let ((try-file (concat b "." (car s))))
              (cond
               ((find-buffer-visiting try-file)
                (switch-to-buffer (find-buffer-visiting
                                   try-file))
                (setq s nil
                      return-value t))
               ((file-readable-p try-file)
                (find-file try-file)
                (setq s nil
                      return-value t))
               (t (setq s (cdr s))))))
          return-value))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; Get etags file intelligently
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "etags-extend/"))
(require 'etags-select)
(require 'etags-table)
(setq etags-table-search-up-depth 10)
;; --8<-------------------------- §separator§ ------------------------>8--
(defun create-tags (directory)
  "Create tags file."
  (interactive "DDirectory: ")
  (let ((code-file-extension-list '("*.py" "*.sh" "*.rb" "*.pl"
                                    "*.h" "*.cpp" "*.c" "*.cxx"
                                    "*.erl" "*.java" "*.el")))
    (dolist (code-file code-file-extension-list)
      (shell-command (format "find %s -name \"%s\" | etags -a -"
                             directory code-file)))
    ))
;;(global-set-key "\M-." 'etags-select-find-tag)
;; --8<-------------------------- §separator§ ------------------------>8--
;; vb programming
(load-file (concat CONTRIBUTOR_CONF "visual-basic/visual-basic-mode.el"))
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.\\(frm\\|bas\\|cls\\|rvb\\)$" . visual-basic-mode))
;; --8<-------------------------- §separator§ ------------------------>8--
;; C# programming
(load-file (concat CONTRIBUTOR_CONF "csharp/csharp-mode-0.4.0.el"))
;; --8<-------------------------- §separator§ ------------------------>8--
;; php programming
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/php-mode-1.5.0/"))
(require 'php-mode)
;; debug php
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/geben-0.26"))
(autoload 'geben "geben" "PHP Debugger on Emacs" t)
;; --8<-------------------------- §separator§ ------------------------>8--
;;ruby programming
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/ruby-mode"))
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
;; better code indenting in ruby
(defadvice ruby-indent-line (after line-up-args activate)
  (let (indent prev-indent arg-indent)
    (save-excursion
      (back-to-indentation)
      (when (zerop (car (syntax-ppss)))
        (setq indent (current-column))
        (skip-chars-backward " \t\n")
        (when (eq ?, (char-before))
          (ruby-backward-sexp)
          (back-to-indentation)
          (setq prev-indent (current-column))
          (skip-syntax-forward "w_.")
          (skip-chars-forward " ")
          (setq arg-indent (current-column)))))
    (when prev-indent
      (let ((offset (- (current-column) indent)))
        (cond ((< indent prev-indent)
               (indent-line-to prev-indent))
              ((= indent prev-indent)
               (indent-line-to arg-indent)))
        (when (> offset 0) (forward-char offset))))))
;; ;;inf-ruby
;; (autoload 'run-ruby "inf-ruby"
;; "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;; "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;; '(lambda ()
;; (inf-ruby-keys)))
;; --8<-------------------------- §separator§ ------------------------>8--
;; elisp programming
(require 'eldoc) ;; helper of elisp
(setq eldoc-idle-delay 0) ;显示延迟
(dolist (hook (list
               'ielm-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'message-mode-hook
               'Info-mode-hook
               'erc-mode-hook
               ))
  (add-hook hook 'turn-on-eldoc-mode))
;; --8<-------------------------- §separator§ ------------------------>8--
;;Make script files executable automatically
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; --8<-------------------------- §separator§ ------------------------>8--
;; http post test
(load-file (concat CONTRIBUTOR_CONF "http-post-simple/http-post-simple.el"))
;; --8<-------------------------- §separator§ ------------------------>8--
(global-set-key (kbd "<f8>") 'smart-compile)
(defun smart-compile()
  "If makefile exists, compile with it. Otherwise build compile instructions"
  (interactive)
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (not (null
              (find t candidate-make-file-name :key
                    '(lambda (f) (file-readable-p f)))))
        (setq command "make -k ")
      ;; Makefile doesn't exist
      (if (null (buffer-file-name (current-buffer)))
          (message "Buffer not attached to a file, won't compile!")
        (if (eq major-mode 'c-mode)
            (setq command
                  (concat "gcc -Wall -o "
                          (file-name-sans-extension
                           (file-name-nondirectory buffer-file-name))
                          " "
                          (file-name-nondirectory buffer-file-name)
                          " -g -lm "))
          (if (eq major-mode 'c++-mode)
              (setq command
                    (concat "g++ -Wall -o "
                            (file-name-sans-extension
                             (file-name-nondirectory buffer-file-name))
                            " "
                            (file-name-nondirectory buffer-file-name)
                            " -g -lm "))
            (message "Unknow mode, won't compile!")))))
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command)))
          (compile command)))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; --8<-------------------------- §separator§ ------------------------>8--
;; erlang
;; setup erlang mode
;; TODO, enhance as a more dedicated way
;; add the location of the elisp files to the load-path
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/erlang-emacs/"))
;; set the location of the man page hierarchy
(setq erlang-root-dir "/usr/lib/erlang")
;; add the home of the erlang binaries to the exec-path
(add-to-list 'exec-path "/usr/lib/erlang/bin")
;; load and eval the erlang-start package to set up everything else
(require 'erlang-start)
(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-hook 'erlang-mode-hook
          (lambda ()
            ;; when starting an Erlang shell in Emacs, default in the node name
            (setq inferior-erlang-machine-options '("-sname" "emacs"))
            ;; add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))

;; distel: an add-on to the erlang-mode
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/distel/elisp"))
(require 'distel)
(distel-setup)
;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i" erl-complete)
    ("\M-?" erl-complete)
    ("\M-." erl-find-source-under-point)
    ("\M-," erl-find-source-unwind)
    ("\M-*" erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: programming-setting.el ends here
