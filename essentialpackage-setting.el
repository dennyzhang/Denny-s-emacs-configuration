;; -*- coding: utf-8 -*-
;; File: essentialpackage-setting.el
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2017-09-08 22:15:38>
;; --8<-------------------------- separator ------------------------>8--
;;color-theme
;;(load-file (concat EMACS_VENDOR "/color-theme/color-theme.el"))
(require 'color-theme)
;; TODO denny
(defun plist-to-alist (plist)
  "Convert property list PLIST into the equivalent association-list form.
The alist is returned. This converts from

\(a 1 b 2 c 3)

into

\((a . 1) (b . 2) (c . 3))

The original plist is not modified. See also `destructive-plist-to-alist'."

  (let (alist)
    (while plist
      (setq alist (cons (cons (car plist) (cadr plist)) alist))
      (setq plist (cddr plist)))
    (nreverse alist)))
(color-theme-initialize)
(color-theme-dark-blue)
;; (color-theme-bharadwaj-slate)
;;(load-theme 'light-blue t)
;;(load-theme 'tango-dark t)
;; --8<-------------------------- separator ------------------------>8--
;;show recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
;; (setq recentf-auto-cleanup 300)
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-string fname tocpl)))))
(global-set-key [(control x)(control r)] 'recentf-open-files-compl)
;; ;; --8<-------------------------- separator ------------------------>8--
;;remember where you were in a file
(setq save-place-file (concat EMACS_DATA "/filebat.saveplace"))
(setq-default save-place t) ;; activate it for all buffers
(require 'saveplace) ;; get the package
;; ;; --8<-------------------------- separator ------------------------>8--
                                        ; on duplicate filenames, show path names, not foo.x<2>, foo.x<3>, etc.
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse
      uniquify-separator " • "
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")
;; ;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/frame"))
(require 'frame-fns)
(require 'frame-cmds)
(global-set-key [(control up)] 'move-frame-up)
(global-set-key [(control down)] 'move-frame-down)
(global-set-key [(control left)] 'move-frame-left)
(global-set-key [(control right)] 'move-frame-right)
;; ;; ;; --8<-------------------------- separator ------------------------>8--
(if window-system
    (progn
      (require 'bm)
      (setq bm-repository-file (concat EMACS_VENDOR "/data/out_of_svn/filebat.bm"))
      ;; make bookmarks persistent as default
      (setq-default bm-buffer-persistence t)
      ;; Loading the repository from file when on start up.
      ;;(add-hook 'after-init-hook 'bm-repository-load) ;; TODO denny
      ;; Restoring bookmarks when on file find.
      ;;(add-hook 'find-file-hook 'bm-buffer-restore) ;; TODO
      ;; Saving bookmark data on killing a buffer
      ;; (add-hook 'kill-buffer-hook 'bm-buffer-save) ;; TODO
      (defadvice bm-buffer-save (before if activate) (widen))
      ;; Saving the repository to file when on exit.
      ;; kill-buffer-hook is not called when emacs is killed, so we
      ;; must save all bookmarks first.
      ;;(add-hook 'kill-emacs-hook #'(lambda nil ;; TODO denny
      ;; (bm-buffer-save-all) ;; TODO denny
      ;; (bm-repository-save))) ;; TODO denny
      ;; Update bookmark repository when saving the file.
      ;;(add-hook 'after-save-hook 'bm-buffer-save)
      ;; Restore bookmarks when buffer is reverted.
      ;;(add-hook 'after-revert-hook 'bm-buffer-restore)
      ;; make sure bookmarks is saved before check-in (and revert-buffer)
      (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
      (global-set-key (kbd "<C-f2>") 'bm-toggle)
      (global-set-key (kbd "<f2>") 'bm-next)
      (global-set-key (kbd "<S-f2>") 'bm-previous)
      ))
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'highlight-symbol)
(global-set-key (kbd "<C-f5>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f5>") 'highlight-symbol-next)
(global-set-key (kbd "<S-f5>") 'highlight-symbol-prev)
;; ;; --8<-------------------------- separator ------------------------>8--
;; rect-mark
;; (load-file (concat EMACS_VENDOR "/rect-mark/rect-mark.el")) ;; TODO
;; Support for marking a rectangle of text with highlighting.
;;(define-key ctl-x-map "r\C-M-\ " 'rm-set-mark)
;;(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(global-set-key (kbd "C-x r C-M-SPC") 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'whitespace)
(setq whitespace-display-mappings
      '((space-mark ?\ [?.])
        (newline-mark ?\n [?$ ?\n])
        (tab-mark ?\t [?\\ ?\t])))
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'boxquote)
(setq boxquote-top-and-tail "-----------")
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'cal-china-x)
;; TODO
;; show lunar calendar
;;(add-hook 'diary-nongregorian-listing-hook 'diary-chinese-list-entries)
;;(add-hook 'diary-nongregorian-marking-hook 'diary-chinese-mark-entries)
;;highlights all the days that are holidays
(setq calendar-mark-holidays-flag 't)
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'loccur)
;; defines shortcut for loccur of the current word
(define-key global-map [(control meta o)] 'loccur-current)
(set-face-background 'isearch "#537182")
(set-face-foreground 'isearch "AntiqueWhite2")
(define-key global-map [(control meta u)] 'loccur-skeleton)
(defun loccur-skeleton ()
  "Call `loccur' for code skeleton with the same leading whitespace."
  (interactive)
  (let ((point-orig (point)) leading-str (whitespace-count 0))
    (save-excursion
      (move-beginning-of-line nil)
      (if (eq (point) point-orig)
          ;; pressing in the head of the line
          (loccur (format "^[^ %c]" 9))
        (progn
          (setq leading-str (buffer-substring-no-properties point-orig (point)))
          (dolist (ch (string-to-list leading-str))
            (if (eq ch 32)
                (setq whitespace-count (+ 1 whitespace-count))
              )))
        (if (eq 0 whitespace-count)
            (loccur (format "^[^ ]" whitespace-count))
          (loccur (format "^ \\{1,%d\\}[^ ]\\|^[^ ]" whitespace-count)))
        ))
    )
  )
;; (defun loccur-skeleton ()
;; "Call `loccur' for code skeleton with the same leading whitespace."
;; (interactive)
;; (let ((point-orig (point)) leading-str (whitespace-count 0))
;; (save-excursion
;; (move-beginning-of-line nil)
;; (setq leading-str (buffer-substring-no-properties point-orig (point)))
;; (dolist (ch (string-to-list leading-str))
;; (if (eq ch 32)
;; (setq whitespace-count (+ 1 whitespace-count))
;; )))
;; (if (not (eq 0 whitespace-count))
;; (loccur (format "^ \\{1,%d\\}[^ ]\\|^[^ ]" whitespace-count))
;; (loccur (format "^[^ ]" whitespace-count)))
;; ))
;; --8<-------------------------- separator ------------------------>8--
(require 'cursor-chg)
(change-cursor-mode 1) ; On for overwrite/read-only/input mode
(toggle-cursor-type-when-idle 1) ; On when idle
(setq curchg-default-cursor-color "green")
;; ;; --8<-------------------------- separator ------------------------>8--
(setq abbrev-file-name (concat EMACS_DATA "/filebat.abbrev"))
(setq save-abbrevs t) ;; save abbrevs when files are saved
(quietly-read-abbrev-file) ;; reads the abbreviations file on startup
;;(setq abbrev-mode 1) ;; always enable abbrev
(setq default-abbrev-mode 1)
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'color-moccur)
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'hide-region)
(defun hide-region-settings ()
  "Settings for `hide-region'."
  (setq hide-region-before-string "[======================该区域已")
  (setq hide-region-after-string "被折叠======================]\n"))
(eval-after-load 'hide-region '(hide-region-settings))
(global-set-key (kbd "C-x M-r") 'hide-region-hide)
(global-set-key (kbd "C-x M-R") 'hide-region-unhide)
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
;; ;; --8<-------------------------- separator ------------------------>8--
(require 'thumbs)
(auto-image-file-mode t)
(setq thumbs-geometry "80x80")
(setq thumbs-per-line 3)
(setq thumbs-max-image-number 8)
;; ;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/company-0.5/"))
(autoload 'company-mode "company" nil t)
(setq company-backends '(company-elisp
                         ;;company-ropemacs
                         company-gtags
                         company-dabbrev-code
                         company-keywords
                         company-files
                         company-dabbrev))
(setq company-idle-delay 0.2) ;延迟时间
(setq company-minimum-prefix-length 2) ;触发补全的字符数量
(setq company-show-numbers nil) ;不显示数字
(dolist (hook programming-hook-list)
  (add-hook hook 'company-mode))
;; ;; --8<-------------------------- separator ------------------------>8--
;; TODO: use community one
(load-file (concat EMACS_VENDOR "/highlight-tail/highlight-tail.el"))
(require 'highlight-tail)
(setq highlight-tail-colors
      '(("#696969" . 0)
        ("white" . 100)))
(setq highlight-tail-steps 14
      highlight-tail-timer 2)
(setq highlight-tail-posterior-type 'const)
(highlight-tail-mode 1)
;; --8<-------------------------- separator ------------------------>8--
(require 'rainbow-mode)
(dolist (hook programming-hook-list)
  (add-hook hook #'(lambda () (rainbow-mode 1 ))))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/momentary/momentary.el"))
;; (load-file (concat EMACS_VENDOR "/proced/proced.el"))
;;(require 'proced) ;; TODO denny
(setq proced-sort "pmem")
;; --8<-------------------------- separator ------------------------>8--
;;(load-file (concat EMACS_VENDOR "/keep-buffers/keep-buffers.el"));; TODO
;;(setq keep-buffers-protected-list '("tmp" "*Messages*" "current.org" "pkm.org"))
;;(keep-buffers-erase-on-kill nil)
;; --8<-------------------------- separator ------------------------>8--
(require 'hilit-chg)
;; TODO: disable this
;;(add-hook 'find-file-hook 'enable-highlight-changes-mode)
(defun enable-highlight-changes-mode ()
  "Enable highlight-changes-mode, with several modes excluded"
  (let ((prohibit-mode-list '("Org" "Erlang" "DocView" (sgml-xml-mode "XHTML" "HTML"))))
    (make-local-variable 'highlight-changes-mode)
    (if (member mode-name prohibit-mode-list)
        (highlight-changes-mode 0)
      (progn
        (highlight-changes-mode 0)
        (global-highlight-changes-mode 'passive);;record changes in passive way
        (local-set-key [(control c) (control p)] 'highlight-changes-previous-change)
        (local-set-key [(control c) (control n)] 'highlight-changes-next-change)
        (set-face-foreground 'highlight-changes nil)
        ;; set highlight-changes's background color slightly different with the editor's background color(DarkSlateGray)
        (set-face-background 'highlight-changes "#382f2f")
        (set-face-foreground 'highlight-changes-delete nil)
        (set-face-background 'highlight-changes-delete "#916868")
        )
      )
    )
  )

;; (global-set-key (kbd "<f6>") 'highlight-changes-visible-mode) ;; changes
;; --8<-------------------------- separator ------------------------>8--
(require 'hide-lines)
(load-file (concat EMACS_VENDOR "/hide-lines/hidesearch.el"))
(require 'hidesearch)
(global-set-key (kbd "C-c C-s") 'hidesearch)
(global-set-key (kbd "C-c C-a") 'show-all-invisible)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/cn-weather/cn-weather.el"))
(require 'cn-weather)
(setq cn-weather-city "上海")
;; --8<-------------------------- separator ------------------------>8--
(require 'kill-ring-search)
;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'load-path (concat EMACS_VENDOR "/elscreen/elscreen-1.4.6/elscreen.el"))
(require 'elscreen)
(eval-after-load 'elscreen
  '(progn
     ;; Disable tab by default, try M-x elscreen-toggle-display-tab to show tab
     (setq elscreen-display-tab nil)
     ;; default prefix key(C-z), is hard to invoke
     (elscreen-set-prefix-key (kbd "M-s"))))
;; create screen automatically when there is only one screen
(defmacro elscreen-create-automatically (ad-do-it)
  ` (if (not (elscreen-one-screen-p))
        ,ad-do-it
      (elscreen-create)
      (elscreen-notify-screen-modification 'force-immediately)
      (elscreen-message "New screen is automatically created")))

(defadvice elscreen-next (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-previous (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-toggle (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/gse-number-rect/gse-number-rect.el"))
(require 'gse-number-rect)
;; --8<-------------------------- separator ------------------------>8--
(require 'fold-dwim)
(global-set-key [f7] 'lucky_try)
(global-set-key (kbd "<C-f7>") 'fold-dwim-hide-all)
(global-set-key (kbd "<M-S-f7>") 'fold-dwim-show-all)
(defun lucky_try ()
  (interactive)
  (cond
   ((string= mode-name "Diff")
    (dos2unix))
   ((member mode-name '("Fundamental" "w3m"))
    (toggle-truncate-lines))
   ((string= mode-name "Org")
    (toggle-truncate-lines))
   (t (fold-dwim-toggle))
   ))
;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat EMACS_VENDOR "/sr-speedbar/sr-speedbar.el")) ;; TODO
;; (setq sr-speedbar-skip-other-window-p t)
;; (setq speedbar-show-unknown-files t)
;; ;; (setq 'outline-view-change-hook nil) ;; TODO
;; ;; when pressing prefix of C-u, we will use speedbar, instead of minimap
;; (defun my-file-toogle (use-speedbar-p)
;; (interactive "P")
;; (if (null use-speedbar-p)
;; (minimap-toggle)
;; (sr-speedbar-toggle))
;; )
;; (global-set-key (kbd "<f3>") 'my-file-toogle)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/recent-jump/recent-jump.el"))
(require 'recent-jump)
(setq recent-jump-threshold 8)
(setq recent-jump-ring-length 20)
(global-set-key (kbd "C-c <") 'recent-jump-jump-backward)
(global-set-key (kbd "C-c >") 'recent-jump-jump-forward)
;; --8<-------------------------- separator ------------------------>8--
(require 'goto-last-change)
(global-set-key "\C-x\C-\\" 'goto-last-change)
(autoload 'goto-last-change
  "goto-last-change" "Set point to the position of the last change." t)
(defadvice goto-last-change-with-auto-marks (before mav-goto-last-change activate)
  "Split the window beforehand to retain the current view"
  (unless (eq last-command 'goto-last-change-with-auto-marks)
    (split-window-vertically)))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/yaml-mode/yaml-mode.el"))
;; File: essentialpackage-setting.el ends here
