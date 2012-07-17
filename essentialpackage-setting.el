;; -*- coding: utf-8 -*-
;; File: essentialpackage-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-18 00:44:40>
;;
;; --8<-------------------------- separator ------------------------>8--
;;color-theme
(load-file (concat EMACS_VENDOR "/color-theme/color-theme.el"))
(color-theme-dark-blue)
;;show recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;最近打开文件的最大数量
;; (setq recentf-auto-cleanup 300) ;自动清理最近打开文件列表中重复或其他文件的时间间隔 (秒)
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-string fname tocpl)))))
(global-set-key [(control x)(control r)] 'recentf-open-files-compl)
;; --8<-------------------------- separator ------------------------>8--
;;remember where you were in a file
;;(setq save-place-file (concat DENNY_CONF "emacs_data/filebat.saveplace")) ;; keep my ~/ clean
(setq-default save-place t) ;; activate it for all buffers
(require 'saveplace) ;; get the package
;; --8<-------------------------- separator ------------------------>8--
;;handle with duplicate name of different buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse
      uniquify-separator " • "
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/frame"))
(load-file (concat EMACS_VENDOR "/frame/frame-fns.el"))
(load-file (concat EMACS_VENDOR "/frame/frame-cmds.el"))
(global-set-key [(control up)] 'move-frame-up)
(global-set-key [(control down)] 'move-frame-down)
(global-set-key [(control left)] 'move-frame-left)
(global-set-key [(control right)] 'move-frame-right)
;; ;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/bm/bm-1.34.el"))
(setq bm-repository-file (concat EMACS_VENDOR "/data/out_of_svn/filebat.bm"))
;; make bookmarks persistent as default
(setq-default bm-buffer-persistence t)
;; Loading the repository from file when on start up.
(add-hook 'after-init-hook 'bm-repository-load)
;; Restoring bookmarks when on file find.
;;(add-hook 'find-file-hook 'bm-buffer-restore)
;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(defadvice bm-buffer-save (before if activate) (widen))
;; Saving the repository to file when on exit.
;; kill-buffer-hook is not called when emacs is killed, so we
;; must save all bookmarks first.
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))
;; Update bookmark repository when saving the file.
;;(add-hook 'after-save-hook 'bm-buffer-save)
;; Restore bookmarks when buffer is reverted.
;;(add-hook 'after-revert-hook 'bm-buffer-restore)
;; make sure bookmarks is saved before check-in (and revert-buffer)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>") 'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/highlight-symbol/highlight-symbol.el"))
(global-set-key (kbd "<C-f5>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f5>") 'highlight-symbol-next)
(global-set-key (kbd "<S-f5>") 'highlight-symbol-prev)
;; --8<-------------------------- separator ------------------------>8--
;; rect-mark
(load-file (concat EMACS_VENDOR "/rect-mark/rect-mark.el"))
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
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/whitespace/whitespace.el"))
(setq whitespace-display-mappings
      '((space-mark ?\ [?.])
        (newline-mark ?\n [?$ ?\n])
        (tab-mark ?\t [?\\ ?\t])))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/boxquote/boxquote.el"))
(setq boxquote-top-and-tail "-----------")
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/calendar-localization/cal-china-x.el"))
;; show lunar calendar
(load-file (concat EMACS_VENDOR "/calendar-localization/cal-china-plus.el"))
(add-hook 'diary-nongregorian-listing-hook 'diary-chinese-list-entries)
(add-hook 'diary-nongregorian-marking-hook 'diary-chinese-mark-entries)
;;highlights all the days that are holidays
(setq calendar-mark-holidays-flag 't)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/loccur/loccur.el"))
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
      (setq leading-str (buffer-substring-no-properties point-orig (point)))
      (dolist (ch (string-to-list leading-str))
        (if (eq ch 32)
            (setq whitespace-count (+ 1 whitespace-count))
          )))
    (if (not (eq 0 whitespace-count))
        (loccur (format "^ \\{1,%d\\}[^ ]\\|^[^ ]" whitespace-count))
      (loccur (format "^[^ ]" whitespace-count)))
    ))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/cursor-change/cursor-chg.el"))
(change-cursor-mode 1) ; On for overwrite/read-only/input mode
(toggle-cursor-type-when-idle 1) ; On when idle
(setq curchg-default-cursor-color "green")
;; --8<-------------------------- separator ------------------------>8--
(setq abbrev-file-name (concat DENNY_CONF "emacs_data/filebat.abbrev"))
(setq save-abbrevs t) ;; save abbrevs when files are saved
(quietly-read-abbrev-file) ;; reads the abbreviations file on startup
;;(setq abbrev-mode 1) ;; always enable abbrev
(setq default-abbrev-mode 1)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/color-moccur/color-moccur.el"))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/hide-region/hide-region.el"))
(defun hide-region-settings ()
  "Settings for `hide-region'."
  (setq hide-region-before-string "[======================该区域已")
  (setq hide-region-after-string "被折叠======================]\n"))
(eval-after-load 'hide-region '(hide-region-settings))
(global-set-key (kbd "C-x M-r") 'hide-region-hide)
(global-set-key (kbd "C-x M-R") 'hide-region-unhide)
;; --8<-------------------------- separator ------------------------>8--
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-create-new-buffer (quote never)
      ido-enable-flex-matching t
      ido-enable-last-directory-history nil
      ido-enable-regexp nil
      ido-max-directory-size 300000
      ido-max-file-prompt-width 0.3
      ;; ido-use-filename-at-point (quote guess)
      ido-use-url-at-point t
      ido-auto-merge-work-directories-length 0
      ido-use-virtual-buffers t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)
;; --8<-------------------------- separator ------------------------>8--
(require 'thumbs)
(auto-image-file-mode t)
(setq thumbs-geometry "80x80")
(setq thumbs-per-line 3)
(setq thumbs-max-image-number 8)
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/company-0.5/"))
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
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/highlight-tail/highlight-tail.el"))
(setq highlight-tail-colors
      '(("#696969" . 0)
        ("white" . 100)))
(setq highlight-tail-steps 14
      highlight-tail-timer 2)
(setq highlight-tail-posterior-type 'const)
(highlight-tail-mode 1)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/rainbow-mode/rainbow-mode.el"))
(dolist (hook programming-hook-list)
  (add-hook hook '(lambda () (rainbow-mode 1 ))))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/openwith/openwith.el"))
(openwith-mode t)
;; ask for confirmation before invoke external program
(setq openwith-confirm-invocation t)
(cond
 ((eq system-type 'gnu/linux)
  ;; clean up previous open associations, and reconfigure
  (setq openwith-associations
        '(("\\.\\(doc\\|docx\\|xlsx\\|xls\\|ppt\\|pptx\\)\\'" "libreoffice" (file))
          ("\\.epub\\'" "calibre" (file))
          ;;("\\.pdf\\'" "evince" (file))
          ;; ("\\.\\(png\\|bmp\\)\\'" "display" (file))
          )))
 ((eq system-type 'windows-nt)
  ;;TODO problematic
  (setq openwith-associations
        '(("\\.\\(doc\\|docx\\)\\'" "winword" (file))
          )))
 )
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/momentary/momentary.el"))
;;(load-file (concat EMACS_VENDOR "/proced/proced.el"))
(require 'proced)
(setq proced-sort "pmem")
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/keep-buffers/keep-buffers.el"))
;;(setq keep-buffers-protected-list '("tmp" "*Messages*" "current.org" "pkm.org" "programming.org"))
;;(keep-buffers-erase-on-kill nil)
;; --8<-------------------------- separator ------------------------>8--
(require 'hilit-chg)
(add-hook 'find-file-hook 'enable-highlight-changes-mode)
(defun enable-highlight-changes-mode ()
  "Enable highlight-changes-mode, with several modes excluded"
  (let ((prohibit-mode-list '("Org" "Erlang")))
    (make-local-variable 'highlight-changes-mode)
    (highlight-changes-mode 0) ;; first disable highlight-changes-mode
    (unless (member mode-name prohibit-mode-list)
      (highlight-changes-mode 0)
      (global-highlight-changes-mode 'passive);;record changes in passive way
      (local-set-key [(control c) (control c)] 'highlight-changes-mode);;toggle visibility
      (local-set-key [(control c) (control p)] 'highlight-changes-previous-change)
      (local-set-key [(control c) (control n)] 'highlight-changes-next-change)
      (set-face-foreground 'highlight-changes nil)
      ;; set highlight-changes's background color slightly different with the editor's background color(DarkSlateGray)
      (set-face-background 'highlight-changes "#3F2F4F4F4F4F")
      (set-face-foreground 'highlight-changes-delete nil)
      (set-face-background 'highlight-changes-delete "#686897")
      )
    )
  )
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/hide-lines/hide-lines.el"))
(load-file (concat EMACS_VENDOR "/hide-lines/hidesearch.el"))
(require 'hide-lines)
(require 'hidesearch)
(global-set-key (kbd "C-c C-s") 'hidesearch)
(global-set-key (kbd "C-c C-a") 'show-all-invisible)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/cn-weather/cn-weather.el"))
(require 'cn-weather)
(setq cn-weather-city "上海")
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/kill-ring-search/kill-ring-search.el"))
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/elscreen/elscreen-1.4.6/elscreen.el"))
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
;; (require 'midnight)
;; (midnight-delay-set 'midnight-delay "0:10am")
;; (add-hook 'midnight-hook
;; (lambda
;; (with-current-buffer "*midnight*"
;; (org-agenda-list)
;; )))
;; (setq midnight-period 28800)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/gse-number-rect/gse-number-rect.el"))
(require 'gse-number-rect)
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/fold-dwin/fold-dwin.el"))
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
(require 'desktop)
;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history . 100)
                (ido-last-directory-list . 100)
                (ido-work-directory-list . 100)
                (ido-work-file-list . 100)
                (grep-history . 30)
                (compile-history . 30)
                (minibuffer-history . 50)
                (query-replace-history . 60)
                (read-expression-history . 60)
                (regexp-history . 60)
                (regexp-search-ring . 20)
                (search-ring . 20)
                (comint-input-ring . 50)
                (shell-command-history . 50)
                desktop-missing-file-warning
                tags-file-name
                register-alist)))
(add-to-list 'desktop-globals-to-save 'vc-comment-ring)
(setq desktop-buffers-not-to-save
      (concat "\\(" "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'erc-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
(desktop-save-mode 1)
(desktop-release-lock)
(add-to-list 'desktop-clear-preserve-buffers "\\*eshell\\*.*")
(add-to-list 'desktop-clear-preserve-buffers "\\*shell\\*.*")
;; --8<-------------------------- separator ------------------------>8--
;; File: essentialpackage-setting.el ends here
