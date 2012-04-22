;; -*- coding: utf-8 -*-
;; File: shell-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-04-22 14:13:37>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
(defun open-shell-of-current-file ()
  "If current file doesn't open a shell, generate one.
 Otherwise, switch to related shell.
 "
  (interactive)
  (let* ((file-name (buffer-name)) shell-buffer-name
         current-hostname prefix-regexp prefix)
    (with-temp-buffer
      (shell-command "hostname" (current-buffer))
      (setq current-hostname (replace-regexp-in-string "\n" "" (buffer-string))))
    (setq prefix-regexp (format "\\*shell\\*-%s-" current-hostname))
    (setq prefix (format "*shell*-%s-" current-hostname))
    (if (string= mode-name "Shell")
        ;; if current buffer is a shell, switch to related file
        (pop-to-buffer (replace-regexp-in-string prefix-regexp "" file-name))
      ;; if current buffer is not a shell, create a related shell buffer
      (setq shell-buffer-name (concat prefix file-name))
      (if (get-buffer shell-buffer-name)
          (pop-to-buffer shell-buffer-name)
        (shell shell-buffer-name)
        ;; insert shell history
        (load-shell-history file-name)
        ;; send default input
        (comint-previous-matching-input "." -1)))
    ))

(defun open-shell-of-current-directory ()
  "If any file of current directory already have a related shell, switch to it
 "
  (interactive)
  (let* ((file-name (buffer-name))
         current-hostname prefix-regexp prefix
         shell-buffer-name
         (directory-name default-directory))
    (with-temp-buffer
      (shell-command "hostname" (current-buffer))
      (setq current-hostname (replace-regexp-in-string "\n" "" (buffer-string))))
    (setq prefix-regexp (format "\\*shell\\*-%s-" current-hostname))
    (setq prefix (format "*shell*-%s-" current-hostname))
    (setq shell-buffer-name (concat prefix file-name))
    (if (string= mode-name "Shell")
        ;; if current buffer is a shell, switch to related file
        (pop-to-buffer (replace-regexp-in-string prefix-regexp "" file-name))
      ;; if current buffer is not a shell, check
      ;; whether there is any shell opened by files in the directory
      (unless (get-buffer shell-buffer-name)
        (dolist (file-var (directory-files default-directory))
          (if (get-buffer (concat prefix file-var))
              (setq shell-buffer-name (concat prefix file-var))
            ))
        )
      (if (get-buffer shell-buffer-name)
          (pop-to-buffer shell-buffer-name)
        (shell shell-buffer-name)
        ;; insert shell history
        (load-shell-history file-name)
        ;; send default input
        (comint-previous-matching-input "." -1))))
  )
(defvar shell-history-alist
  '(;; erlang files
    (".*erl" . (("make && ./start.sh")
                ("erlc ./%f && erl -noshell -s %s start_link")
                ("sudo rabbitmqctl list_queues")
                ("mnesia:info().")
                ("mnesia:start().")
                ("mnesia:stop().")
                ("erl -mnesia dir '\"data/mnesia/\"' -name crontab_generator_app@ubuntu")
                ("erl -noshell -s mnesia start -s tv start")
                ("sudo rabbitmqctl list_queues name messages_ready messages_unacknowledged")
                ))
    ;; ledger files
    (".*ledger" . (("bankbal")))
    ;; default value for any files
    (".*" . ())
    )
  " For the shell of one file, append user defined commands to the shell history
Each element looks like (REGEXP . COMMAND-LIST).
REGEXP is a regexp which filter filename.
COMMAND-LIST is a list of commands, which will be inserted to shell history one by one.
COMMAND is either a plain string or a string of %-constructs.
%f -- print visited file name.
%s -- print short file name, with posfix removed

Sample:
- For any files of *.erl, append two commands to related shell history
 (\"*.erl\" . ((\"make && ./start.sh\") (\"erlc ./%f && erl -noshell -s %s start_link\")))

- For any files whose filename match the regexp of bak, append one command to shell history
 (\"*.bak.*\" . ((\"rm -rf ./%f\")))
")

(defun load-shell-history(file-name)
  (let (shell-command shell-command-list)
    ;; add command list to shell historyp
    (make-local-variable 'comint-input-ring)
    (setq shell-command-list (assoc-default file-name shell-history-alist 'string-match))
    (if shell-command-list
        (progn
          ;; reverse the list
          (setq shell-command-list (nreverse shell-command-list))
          (dolist (command shell-command-list)
            (setq shell-command (car command))
            ;; replace the %-construct with the runtime value
            (setq shell-command (replace-regexp-in-string "%f" file-name shell-command))
            (setq shell-command
                  (replace-regexp-in-string "%s"
                                            (file-name-sans-extension file-name)
                                            shell-command))
            (ring-insert-at-beginning comint-input-ring shell-command))
          (move-beginning-of-line nil)
          )
      ))
  )
(global-set-key [f9] 'open-related-shell)
;; f9.: only spawn one shell for files in the same directory
;; C-u f9.: shell is spawn by file, instead of by directory
(defun open-related-shell(&optional arg)
  "By default, if current file doesn't open a shell, generate one.
Otherwise, switch to related shell.

If arg is given, only open a shell for one direcotry.
 "
  (interactive "P")
  (if (null arg) (open-shell-of-current-directory)
    (open-shell-of-current-file)
    ))

;; --8<-------------------------- §separator§ ------------------------>8--
;; When killing a file, also kill related shell buffer
;;(add-hook 'kill-buffer-hook 'kill-shell-buffer)
(defun kill-shell-buffer()
  "When killing a file, also kill related shell buffer."
  (let* ((file-name (buffer-name)) shell-buffer-name prefix current-hostname)
    (with-temp-buffer
      (shell-command "hostname" (current-buffer))
      (setq current-hostname (replace-regexp-in-string "\n" "" (buffer-string))))
    (setq prefix (format "*shell*-%s-" current-hostname))
    (setq shell-buffer-name (concat prefix file-name))
    (if (get-buffer shell-buffer-name)
        (kill-buffer shell-buffer-name))
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(dolist (mode-hook-var '(shell-mode-hook eshell-mode-hook))
  (add-hook mode-hook-var
            '(lambda ()(local-set-key (kbd "C-l") 'clear-shell))))
(defun clear-shell ()
  "Remove content of shell/eshell, with the prompt lines reserved"
  (interactive)
  (cond
   ((string-equal mode-name "Shell")
    ;; In shell buffer, leverage comint
    (let ((comint-buffer-maximum-size 0))
      (comint-truncate-buffer)))
   ((string-equal mode-name "EShell")
    ;; In eshell buffer, simply delete content of region
    (let ((inhibit-read-only t))
      (goto-char (point-min))
      (forward-line 2)
      (eval-after-load 'eshell
        '(eshell-bol))
      (kill-region (point) (point-max))))
   ))
;; --8<-------------------------- §separator§ ------------------------>8--
;;eshell
(global-set-key (kbd "<C-f9>") 'eshell-toggle)
;; quickly switch to eshell, and do buffer toggle things
(load-file (concat EMACS_VENDOR "/eshell-toggle/eshell-toggle.el"))
(autoload 'eshell-toggle "eshell-toggle"
  "Toggles between the *eshell* buffer and whatever buffer you are editing."
  t)
(autoload 'eshell-toggle-cd "eshell-toggle"
  "Pops up a eshell-buffer and insert a \"cd <file-dir>\" command." t)
;; --8<-------------------------- §separator§ ------------------------>8--
(eval-after-load 'eshell
  (setq eshell-cmpl-cycle-completions nil
        eshell-save-history-on-exit t
        eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'"))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun python-shell()
  "make a python shell"
  (interactive)
  (switch-to-buffer (make-comint "python" "python" nil "-i")))
(defun perl-shell()
  "make a perl db shell"
  (interactive)
  (switch-to-buffer (make-comint "perl" "perl" nil "-d -e''")))
;; setup environments
(setenv "PAGER" "cat")
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'shell)
(require 'term)
(define-key term-raw-map (kbd "C-j") 'term-switch-to-shell-mode)
(defun term-switch-to-shell-mode ()
  (interactive)
  (if (equal major-mode 'term-mode)
      (progn
        (shell-mode)
        (set-process-filter (get-buffer-process (current-buffer)) 'comint-output-filter )
        (local-set-key (kbd "C-j") 'term-switch-to-shell-mode)
        (compilation-shell-minor-mode 1)
        (comint-send-input)
        )
    (progn
      (compilation-shell-minor-mode -1)
      (font-lock-mode -1)
      (set-process-filter (get-buffer-process (current-buffer)) 'term-emulate-terminal)
      (term-mode)
      (term-char-mode)
      (term-send-raw-string (kbd "C-l"))
      )))
;; --8<-------------------------- §separator§ ------------------------>8--
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; --8<-------------------------- §separator§ ------------------------>8--
(eval-after-load 'esh-opt
  '(progn
     (require 'em-prompt)
     (require 'em-term)
     (require 'em-cmpl)
     (set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
     (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
               '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
     (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
     (setq eshell-cmpl-cycle-completions nil)
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))))
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'tramp)
(setq tramp-default-method "sshx")
(remove-hook 'find-file-hook 'tramp-set-auto-save) ;; when tramp, don't auto save files
(setq tramp-remote-path
      '(tramp-default-remote-path
        "/usr/sbin" "/usr/local/bin"
        "/local/bin" "/local/freeware/bin" "/local/gnu/bin"
        "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin"))
(setq tramp-default-method-alist
      '(("\\`localhost\\'" "\\`root\\'" "su")
        (nil "%" "smb")
        ("" "\\`\\(anonymous\\|ftp\\)\\'" "ftp")
        ("\\`ftp\\." "" "ftp")))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: shell-setting.el