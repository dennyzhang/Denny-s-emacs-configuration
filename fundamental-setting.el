;; -*- coding: utf-8 -*-
;; File: fundamental-setting.el -- most important setting, excluding third party packages
;;
;; Author: DennyZhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-02-12 11:33:32>
;; --8<-------------------------- separator ------------------------>8--
(setq debug-on-error t)
(set-language-environment 'utf-8)
;;support copy/paste among emacs and other programs
(setq x-select-enable-clipboard t)
(setq major-mode 'text-mode) ;;Text-mode is default mode
(setq tab-width 4);;tab take 4 space
;;force Emacs to indent with spaces, never with TABs
(setq-default indent-tabs-mode nil)
(global-font-lock-mode t) ;;highlight synatx
(show-paren-mode t)
(setq scroll-margin 3
      scroll-conservatively 10000)
(setq-default fill-column 70)
(setq default-major-mode 'text-mode
      column-number-mode t ;;show column number
      line-number-mode t ;;show line number in mode line
      save-abbrevs nil
      line-spacing 0.2
      indicate-empty-lines t
      )
;; --8<-------------------------- separator ------------------------>8--
(require 'generic-x)
(transient-mark-mode t)
;; --8<-------------------------- separator ------------------------>8--
(autoload 'thumbs "thumbs" "Preview images in a directory." t)
;;Make sure default splitting is vertical splitting
(set-default 'split-width-threshold 165)
(set-default 'text-scale-mode-step 1.1);;Set the zoom rate
(iswitchb-mode 1);;interactive buffer switching
(setq undo-limit 1000) ;;Increase number of undo
(setq kill-do-not-save-duplicates t)
(blink-cursor-mode 0) ;; prevent cursor blinking
(set-fringe-mode (cons 6 0))
(size-indication-mode t)
(setq redisplay-dont-pause t)
(setq tooltip-use-echo-area t)
(setq byte-compile-dynamic t)
;;(setq special-display-buffer-names '("*Help*" "*Apropos*"))
;; --8<-------------------------- separator ------------------------>8--
;; adjust emacs behaviour with normal editor, if selecting region then type
(delete-selection-mode t)
;; TODO: doesn't work, 调用C-d删除时， kill-ring的头部总是有一个""
(put 'delete-char 'delete-selection 'kill)
;; --8<-------------------------- separator ------------------------>8--
;; enable fancy features of emacs
(put 'narrow-to-region 'disabled nil);;enable narraow editing
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)
;; --8<-------------------------- separator ------------------------>8--
(put 'tetris 'disabled t) ;; disable the game of tetris, to prevent wasting time
(defalias 'tetris nil) ;; Don't waste time to play this game
;; --8<-------------------------- separator ------------------------>8--
;;specify coding system when creating a new file
(set-default-coding-systems 'utf-8-unix)
(set-face-attribute 'mode-line nil :height 0.9) ;;Make the mode-line a little lower
(setq display-time-interval 60) ;;update of time in the mode line
;; auto depress, when opening archived files
(auto-compression-mode 1)
;;Allow minibuffer commands while in the minibuffer
(setq enable-recursive-minibuffers t)
;; enable scrolling during incremental search
(setq isearch-allow-scroll t)
(setq-default ispell-program-name "aspell")
(setq ispell-personal-dictionary
      (concat DENNY_CONF "emacs_data/filebat.ispell_english"))
;;(setq-default show-trailing-whitespace 't)
;; --8<-------------------------- separator ------------------------>8--
;;(global-auto-revert-mode t) ;; auto-refresh all buffers, when files change on disk
(auto-image-file-mode t)
(setq resize-mini-windows t)
(setq message-log-max 8192) ;; Set the *Message* log to something higher
(when (fboundp 'winner-mode) (winner-mode 1)) ;;Restore old window configurations
(setq trash-directory "~/trash"
      ;; When deletion in emacs, uses system’s trash
      delete-by-moving-to-trash t)
;; --8<-------------------------- separator ------------------------>8--
(defalias 'qrr 'query-replace-regexp);;regexp query and replace
(defalias 'rr 'replace-regexp)
(defalias 'yes-or-no-p 'y-or-n-p)
;; --8<-------------------------- separator ------------------------>8--
;; prevent to press backspace, which is pretty far
(global-set-key [(control x) (control k)] 'backward-kill-word)
;; --8<-------------------------- separator ------------------------>8--
;;never quit by mistake...
(global-set-key [(control x) (control c)]
                (function
                 (lambda () (interactive)
                   (cond ((y-or-n-p "Quit editor? ")
                          (save-buffers-kill-emacs))))))
;;never hide by mistake...
(global-set-key [(control x) (control z)]
                (function
                 (lambda () (interactive)
                   (cond ((y-or-n-p "Hide editor? ")
                          (iconify-or-deiconify-frame))))))
;; --8<-------------------------- separator ------------------------>8--
(global-set-key [f1] 'describe-function) ;;elisp help
(global-set-key [f6] 'calc);;calc
(global-set-key [C-f12] 'comment-or-uncomment-region);comment region
(global-set-key [f12] 'c-indent-line-or-region)
(setq outline-minor-mode-prefix (kbd "C-o"))
;; --8<-------------------------- separator ------------------------>8--
(defvar programming-mode-list (list
                               'c-mode 'c++-mode
                               'emacs-lisp-mode 'lisp-mode
                               'shel-mode
                               ;;'ruby-mode
                               'java-mode
                               'perl-mode
                               'php-mode
                               'sgml-mode
                               'erlang-mode
                               ))
(defvar programming-mode-name-list (list
                                    "C/l" "C++/l"
                                    "Emacs-Lisp" "Lisp"
                                    "Shell"
                                    "Python"
                                    ;;"Ruby"
                                    "Java/l"
                                    "Perl"
                                    "PHP"
                                    '(sgml-xml-mode "XML" "SGML")
                                    "Erlang"
                                    ))
(defvar programming-hook-list (list
                               'c-mode-hook 'c++-mode-hook
                               'emacs-lisp-mode-hook 'lisp-mode-hook
                               'shel-mode-hook
                               'python-mode-hook
                               ;;'ruby-mode-hook
                               'java-mode-hook
                               'perl-mode-hook
                               'php-mode-hook
                               'erlang-mode-hook
                               ))
(defvar readonly-mode-list '("Image[jpeg]" "Image[gif]"))
;; --8<-------------------------- separator ------------------------>8--
(defun my-open-file (filename)
  (interactive)
  (find-file filename))
(defalias 'tmp (lambda() (interactive) (my-open-file "~/tmp")))
(defalias 'bank (lambda() (interactive) (my-open-file (concat DENNY_CONF "/bank/filebat.ledger"))))
(defalias 'filebat (lambda() (interactive) (my-open-file (concat DENNY_CONF "/filebat.txt"))))
(defalias 'wealth (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/wealth.org"))))
(defalias 'cloud (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/cloud.org"))))
(defalias 'skill (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/skill.org"))))
(defalias 'life (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/life.org"))))
(defalias 'linux (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/linux.org"))))
(defalias 'motto (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/motto.org"))))
(defalias 'career (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/career.org"))))
(defalias 'work (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/work.org"))))
(defalias 'often (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/often.org"))))
(defalias 'top (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/top.org"))))
(defalias 'project (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/project.org"))))
(defalias 'current (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/current.org"))))
(defalias 'wish (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/wish.org"))))
(defalias 'career (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/career.org"))))
(defalias 'career (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/career.org"))))
(defalias 'learn (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/learn.org"))))
(defalias 'mydiary (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/diary.org"))))
(defalias 'career (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/career.org"))))
(defalias 'password (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/password.org.gpg"))))
(defalias 'contact (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/contacts.org"))))
(defalias 'communication (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/communication.org"))))
(defalias 'programming (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/programming.org"))))
(defalias 'language (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/language.org"))))
(defalias 'connection (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/connection.org"))))
(defalias 'question (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/question.org"))))
(defalias 'myself (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/myself.org"))))
(defalias 'topic (lambda() (interactive) (my-open-file (concat DENNY_CONF "/org_data/org_share/topic.org"))))
;; --8<-------------------------- separator ------------------------>8--
;;highlight lines that are longer than 80
(dolist (hook programming-hook-list)
  (font-lock-add-keywords hook '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t))))
;; --8<-------------------------- separator ------------------------>8--
;; set time-stamp-format, when auto saving
(setq time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S")
;; Hook emacs behaviour, before saving
(add-hook 'before-save-hook
          '(lambda ()
             ;; If the file path doesn't exist, create it, including any parent directories.
             (or (file-exists-p (file-name-directory buffer-file-name))
                 (make-directory (file-name-directory buffer-file-name) t))
             ;; ;; Remove trailing whitespace  ;; TODO
             ;; (unless (member mode-name readonly-mode-list)
             ;;   (delete-trailing-whitespace))
             ;; Auto update timestamp for some specific files
             (unless (member (file-name-extension (buffer-name)) '("org"))
               (time-stamp))
             ))
;; --8<-------------------------- separator ------------------------>8--
(global-set-key (kbd "C-SPC") 'nil);;set control+space to nill
(global-set-key (kbd "C-M-SPC") 'set-mark-command);;set Ctrl+Alt+space to set-mark
(global-set-key [(meta p)(c)] 'count-lines-region)
(global-set-key [(control = )] 'text-scale-increase);;zoom out/in font
(global-set-key [(control -)] 'text-scale-decrease)
;; --8<-------------------------- separator ------------------------>8--
;; set alias for eshell
(setq eshell-aliases-file (concat DENNY_CONF "emacs_data/filebat.alias"))
(setq bookmark-default-file (concat DENNY_CONF "emacs_data/filebat.bmk"))
(setq bookmark-save-flag 1) ;;save bookmark whether we change it
(setq-default line-spacing 0.15);; set line spacing
(setq frame-title-format "%* - %p - Keep your mind running, Denny! - %b - %f")
;; --8<-------------------------- separator ------------------------>8--
;; set grep-find-command, which ask grep-find to filter out some files specified by filter-name-list
(let (filter-name-list)
  (setq filter-name-list '(".git" ".svn" "*~" "#*#" "*.elc" "*.pyc" "worklog.org"))
  (setq grep-find-command "find .")
  (dolist (filter-file-name filter-name-list)
    (setq grep-find-command
          (format "%s -name \"%s\" -prune -o" grep-find-command filter-file-name)))
  (setq grep-find-command
        (concat grep-find-command " -type f -print0 | xargs -0 -e grep -inH -e ")))

(global-set-key [(super .)] 'my-occur)
(defun my-occur (invokeoccur)
  "Invoke super-. to perform occur.
 Invoke C-u super-. to perform dmoccur of color-moccur.el package"
  (interactive "P")
  (let (occur-regexp)
    (if invokeoccur
        (progn
          (setq occur-regexp
                (read-regexp "List lines matching regexp in current directory"
                             (car regexp-history)))
          (setq dmoccur-mask-internal dmoccur-mask)
          (dmoccur default-directory occur-regexp current-prefix-arg))
      (setq occur-regexp (read-regexp "List lines matching regexp" (car regexp-history)))
      (occur-1 occur-regexp list-matching-lines-default-context-lines
               (list (current-buffer))))
    ))

(global-set-key (kbd "C-.") 'grep-find-with-querystring-quoted)
;; C-u C-.: grep-find with current word as the default search key
(defun grep-find-with-querystring-quoted (obtain-current-word)
  "Enhance grep-find by the following points
 - auto quoting query string
 - preventing show the lengthy grep-find-command in minibuffer
 - set the word at cursor as the default search keyword"
  (interactive "P")
  (let (command-args search-keyword (initial-conent nil)
                     (bounds (bounds-of-thing-at-point 'word)))
    (if (and obtain-current-word bounds)
        (setq initial-conent (buffer-substring-no-properties (car bounds) (cdr bounds))))
    (setq search-keyword (read-shell-command "Run find in current directory: "
                                             initial-conent 'grep-find-history))
    ;; ;; escape \" in the search keyword
    (setq search-keyword (replace-regexp-in-string "\\\"" "\\\\\"" search-keyword))
    ;; quote search-keyword with ""
    (setq command-args (concat grep-find-command "\"" search-keyword "\""))
    (grep command-args)))

;; TODO, enhance by sync or async query, instead of stub sleep
;; show how many matches, when grep-find
(defadvice grep-find (after show-grep())
  (let ((sleep_interval 2))
    (set-buffer "*grep*")
    (sleep-for sleep_interval)
    (message
     "%d matches found"
     (- (count-lines (point-min) (point-max)) 6))
    ))
(ad-activate 'grep-find)
;; --8<-------------------------- separator ------------------------>8--
(global-set-key (kbd "C-c .") 'my-find-file-in-parent-dir)
(defun my-find-file-in-parent-dir ()
  (interactive)
  (let (filename (bounds (bounds-of-thing-at-point 'word)))
    (setq filename (buffer-substring-no-properties
                    (car bounds) (cdr bounds)))
    (setq filename (read-shell-command
                    "Run find in parent directory: "
                    filename 'grep-find-history))
    (find-file-in-parent-dir filename)
    )
  )
(defun find-file-in-parent-dir (file-regexp)
  "Find files by a given regexp in the parent directory"
  (interactive)
  (let ((sleep_interval 2)
        find-output line-count)
    (find-dired "../" (format "-name %s " file-regexp))
    (sleep-for sleep_interval)
    (switch-to-buffer "*Find*")
    (setq line-count (count-lines (point-min) (point-max)))
    (if (eq line-count 5)
        ;; if only exactly one match, open the file
        (progn
          (move-end-of-line 1)
          (find-file-existing (dired-file-name-at-point))
          )
      (message
       (format "Matched count of file is not 1. Line count is %d not 5" line-count))
      )
    ))
;; --8<-------------------------- separator ------------------------>8--
(setq search-highlight t ; highlight when searching...
      query-replace-highlight t) ; ...and replacing
;; --8<-------------------------- separator ------------------------>8--
(dolist (hook programming-hook-list)
  (unless (member hook '(c-mode-hook c++-mode-hook lisp-mode-hook python-mode-hook
                                     emacs-lisp-mode-hook erlang-mode-hook))
    (add-hook hook '(lambda () (view-mode 1)))))

(defun global-view-on ()
  (interactive)
  (add-hook 'find-file-hook 'enable-view-for-programmer)
  )
(defun global-view-off ()
  (interactive)
  (remove-hook 'find-file-hook 'enable-view-for-programmer)
  )
(defun enable-view-for-programmer ()
  (if (member mode-name programming-mode-name-list)
      (view-mode t))
  )

(define-key global-map (kbd "M-p RET") 'my-view-mode)
(defun my-view-mode (globalp)
  "Invoke, enable view-mode.
 Invoke with C-u, enable view-mode for global wise"
  (interactive "P")
  (if globalp
      (progn
        (global-view-on)
        (view-mode))
    (view-mode)
    ))
;; --8<-------------------------- separator ------------------------>8--
(setq auto-save-default nil) ;; disable auto save, like files of #XXX#
(setq kept-old-versions 2)
(setq kept-new-versions 3)
(setq delete-old-versions t)
;; Put backup files (ie foo~) in one place
(let ((backup-directory-var "~/auto-save-list/"))
  ;; make backup directory, if it doesn't exist
  (unless (file-exists-p backup-directory-var)
    (make-directory backup-directory-var t))
  ;; set backup location
  (setq backup-directory-alist (list (cons "." backup-directory-var))))
(defun make-backup (backup_dir)
  "Make a backup copy of current buffer's file.
The new file name is the old file name with “~” added at the end.
If such a file already exist, append more “~”.
If the current buffer is not associated with a file, its a error.

backup_dir specify where the backup copy shall go"
  (interactive "Dbackup_dir: ")
  (let (cfile cfile_full bfilename)
    (setq cfile (buffer-name))
    (setq cfile_full (buffer-file-name))
    (setq bfilename (format "%s/%s~" backup_dir cfile))
    (while (file-exists-p bfilename)
      (setq bfilename (concat bfilename "~")))
    (copy-file cfile_full bfilename t)
    (message (concat "Backup saved as: " (file-name-nondirectory bfilename)))
    ))

;; --8<-------------------------- separator ------------------------>8--
(defun notify-popup (title msg &optional icon sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title
of the message, MSG is the context. Optionally, you can provide an ICON and
a sound to be played"
  (interactive)
  (when sound (shell-command
               (concat "mplayer -really-quiet " sound " 2> /dev/null")))
  (if (eq window-system 'x)
      (shell-command (concat "notify-send "
                             (if icon (concat "-i " icon) "")
                             " '" title "' '" msg "'"))
    ;; text only version
    (message (concat title ": " msg))))
;; --8<-------------------------- separator ------------------------>8--
;; Visually indicate buffer boundaries and scrolling.
(setq-default indicate-buffer-boundaries 'left)
;; --8<-------------------------- separator ------------------------>8--
(defun flush-words (regexp &optional rstart rend interactive)
  "Delete words containing matches for REGEXP.

If REGEXP contains upper case characters (excluding those preceded by `\\')
and `search-upper-case' is non-nil, the matching is case-sensitive.

Second and third arg RSTART and REND specify the region to operate on.
Lines partially contained in this region are deleted if and only if
they contain a match entirely contained in it.

Interactively, in Transient Mark mode when the mark is active, operate
on the contents of the region. Otherwise, operate from point to the
end of (the accessible portion of) the buffer. When calling this function
from Lisp, you can pretend that it was called interactively by passing
a non-nil INTERACTIVE argument.

If a match is split across lines, all the lines it lies in are deleted.
They are deleted _before_ looking for the next match. Hence, a match
starting on the same line at which another match ended is ignored."

  (interactive
   (progn
     (barf-if-buffer-read-only)
     (list (read-regexp "Flush words containing match for regexp"
                        (thing-at-point 'word)) nil nil t)))
  (if rstart
      (progn
        (goto-char (min rstart rend))
        (setq rend (copy-marker (max rstart rend))))
    (if (and interactive transient-mark-mode mark-active)
        (setq rstart (region-beginning)
              rend (copy-marker (region-end)))
      (setq rstart (point)
            rend (point-max-marker)))
    (goto-char rstart))
  ;; remove the matching words, and add necessary whitespaces
  (setq regexp (format "%s%s%s" "[ \\n][^ \\n]*" regexp "[^ \\n]*[ \\n]"))
  (message regexp)
  (while (re-search-forward regexp nil t)
    (replace-match (list-to-string
                    (make-list (length (match-string 0)) " "))
                   nil nil))
  )
;; --8<-------------------------- separator ------------------------>8--
(global-set-key [mouse-4] 'scroll-down)
(global-set-key [mouse-5] 'scroll-up)
(global-set-key (kbd "C-x C-2") 'pop-global-mark)
;; --8<-------------------------- separator ------------------------>8--
(setq max-lisp-eval-depth 1000
      max-specpdl-size 10000
      kill-ring-max 1024
      undo-outer-limit 5000000
      mark-ring-max 1024
      )
(setq message-log-max t ;; don't truncate buffer when logging huge messages
      help-xref-following nil
      )
;; --8<-------------------------- separator ------------------------>8--
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 10 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)
    ;; (message "Buffer is set to read-only because it is large. Undo also disabled.")
    ))
(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)
;; --8<-------------------------- separator ------------------------>8--
(setq history-length 100)
;; --8<-------------------------- separator ------------------------>8--
;; also recognize the style of Chinese sentence ending
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq flyspell-sort-corrections nil)
(setq flyspell-consider-dash-as-word-delimiter-flag t)
;; don't display welcome message when flyspell started
(setq flyspell-issue-welcome-flag nil)
;; --8<-------------------------- separator ------------------------>8--
(setq gc-cons-threshold 4000000 ;; control emacs garbage collection
      password-cache-expiry nil
      history-length 250)
;; --8<-------------------------- separator ------------------------>8--
(setq read-buffer-completion-ignore-case t) ;; ignore case when reading a buffer name
(setq completion-ignore-case t) ;; do not consider case significant in completion
(size-indication-mode 1)
;; --8<-------------------------- separator ------------------------>8--
(random t) ;; Seed the random-number generator
(setq mouse-yank-at-point t) ;; mouse yank commands yank at point instead of at click.
;; --8<-------------------------- separator ------------------------>8--
(eval-when-compile (require 'cl)) ;; use CL
;; --8<-------------------------- separator ------------------------>8--
;; only warn me, when file is larger than 25 MB
(setq large-file-warning-threshold 26214400)
;; --8<-------------------------- separator ------------------------>8--
(defun current-buffer-name-extension ()
  (let ((buffer-fname (buffer-file-name)))
    (if (null buffer-fname) "" (file-name-extension buffer-fname)
    )))

(defun current-mode-str ()
  (cond
   ((listp mode-name) (list-to-string mode-name))
   (t mode-name)
   ))
;; --8<-------------------------- separator ------------------------>8--
(global-set-key [(meta p)(b)] 'backup-current-file)
(defun backup-current-file (&optional backup_dir)
  (interactive)
  (let ((bfilename (file-name-nondirectory (buffer-file-name))))
    (if (null backup_dir) (setq backup_dir "/tmp/"))
    (write-region (point-min) (point-max)
                  (format "%s/%d-%s" backup_dir (random 10000) bfilename))
    ))
;; --8<-------------------------- separator ------------------------>8--
;; File: fundamental-setting.el ends here
