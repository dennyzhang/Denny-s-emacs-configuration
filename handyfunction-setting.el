;; -*- coding: utf-8 -*-
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; File: handyfunction-setting.el
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-03-17 20:26:32>
;; --8<-------------------------- §separator§ ------------------------>8--
;;move the current line up or down
(global-set-key [(meta up)] 'move-line-up)

(global-set-key [(meta down)] 'move-line-down)
(defun move-line (&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n)
    (setq n 1))
  (let ((col (current-column)))
    (beginning-of-line)
    (forward-line 1)
    (transpose-lines n)
    (forward-line -1)
    (forward-char col)))
(defun move-line-up (n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))
(defun move-line-down (n)
  "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
  (move-line (if (null n) 1 n)))
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p tab: tab selected region
(define-key global-map (kbd "M-p TAB") 'my-tab-all)
;;(global-set-key [?\M-p \t] 'my-tab-all)
(defun my-tab-all (beginning end)
  (interactive "r")
  (save-excursion
    (if (< end beginning)
        (let (tmp beginning)
          (beginning end)
          (end tmp)))
    (goto-char beginning)
    (while (< (point) end)
      (yas/expand)
      (forward-line 1)
      )))
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p e: delete current word, without copy to clipboard
(global-set-key [(meta p)(e)] 'onlydelete-word)
(defun onlydelete-word (arg)
  "Kill characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (save-excursion
    (let ((end (progn (unless (looking-back "\\>" 1) (forward-word 1)) (point)))
          (beg (progn (forward-word -1) (point))))
      (delete-region beg end)
      )))
;;alt+p d: kill current word
(global-set-key [(meta p)(d)] 'mydelete-current-word)
(defun mydelete-current-word ()
  (interactive)
  (save-excursion
    (let ((end (progn (unless (looking-back "\\>" 1) (forward-word 1)) (point)))
          (beg (progn (forward-word -1) (point))))
      (kill-region beg end)
      )))
;;alt+p w: copy current word
(global-set-key [(meta p)(w)] 'mycopy-current-word)
(defun mycopy-current-word ()
  (interactive)
  (save-excursion
    (let ((end (progn (unless (looking-back "\\>" 1) (forward-word 1)) (point)))
          (beg (progn (forward-word -1) (point))))
      (copy-region-as-kill beg end)
      (message "[copy]%s" (substring-no-properties (current-kill 0))))))
;;alt+p l: copy current line
(global-set-key [(meta p)(l)] 'push-line)
(defun push-line ()
  "Select current line, push onto kill ring."
  (interactive)
  (save-excursion
    (copy-region-as-kill (re-search-backward "^") (re-search-forward "$"))
    (message "[copy]%s" (substring-no-properties (current-kill 0)))
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p y: duplicate current region
(global-set-key [(meta p)(y)] 'duplicate-current-line-or-region)
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p j: delete line without copy
(defun delete-line (&optional arg)
  (interactive "P")
  (delete-region (point)
                 ;; It is better to move point to the other end of the kill
                 ;; before killing. That way, in a read-only buffer, point
                 ;; moves across the text that is copied to the kill ring.
                 ;; The choice has no effect on undo now that undo records
                 ;; the value of point from before the command was run.
                 (progn
                   (if arg
                       (forward-visible-line (prefix-numeric-value arg))
                     (if (eobp)
                         (signal 'end-of-buffer nil))
                     (let ((end
                            (save-excursion
                              (end-of-visible-line) (point))))
                       (if (or (save-excursion
                                 ;; If trailing whitespace is visible,
                                 ;; don't treat it as nothing.
                                 (unless show-trailing-whitespace
                                   (skip-chars-forward " \t" end))
                                 (= (point) end))
                               (and kill-whole-line (bolp)))
                           (forward-visible-line 1)
                         (goto-char end))))
                   (point))))
(global-set-key [(meta p)(j)] 'delete-line)
;; --8<-------------------------- §separator§ ------------------------>8--
;;query before flush lines
(defalias 'qfl 'query-flush-lines)
(defun query-flush-lines (regexp &optional rstart rend interactive)
  "Similar to flush-lines, but queries before flushing."
  (interactive
   (progn
     (barf-if-buffer-read-only)
     (keep-lines-read-args "Flush lines (containing match for regexp): ")))
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
  (let ((case-fold-search (and case-fold-search
                               (isearch-no-upper-case-p regexp t))))
    (save-excursion
      (while (and (< (point) rend)
                  (re-search-forward regexp rend t))
        (if (y-or-n-p "Flush? ")
            (progn
              (delete-region (save-excursion (goto-char (match-beginning 0))
                                             (forward-line 0)
                                             (point))
                             (progn (forward-line 1) (point))))))))
  (set-marker rend nil)
  nil)
;; --8<-------------------------- §separator§ ------------------------>8--
(defun dos2unix ()
  "Convert a DOS formatted text buffer to UNIX format"
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))
(defun unix2dos ()
  "Convert a UNIX formatted text buffer to DOS format"
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))
(defalias 'sw 'swap-windows);;regexp query and replace
;; --8<-------------------------- §separator§ ------------------------>8--
;;escape current buffer
(global-set-key [C-f4] 'exit-current-buffer)
(defun exit-current-buffer ()
  (interactive)
  (kill-buffer nil)
  (other-window 1)
  (delete-other-windows))
;; --8<-------------------------- §separator§ ------------------------>8--
;; split windows should display different buffers question
(global-set-key [(control x) \2] 'split-window-switch-buffer)
(defun split-window-switch-buffer () (interactive)
  "Split current window and display the two last buffers used."
  (split-window)
  (switch-to-buffer (other-buffer (current-buffer))))
(global-set-key [(control x) \3] 'hsplit-window-switch-buffer)
(defun hsplit-window-switch-buffer () (interactive)
  "Split current window horizontally and display the two last buffers used."
  (split-window-horizontally)
  (switch-to-buffer (other-buffer (current-buffer))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; hippie-expand
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
;; --8<-------------------------- §separator§ ------------------------>8--
;;M-p i: show interesting information for current file or directory
;;C-u M-p i: show short file name of current buffer
(define-key global-map (kbd "M-p i") 'show-magic-info)
(defun show-magic-info(show-short-info-p)
  "show interesting information for current file or directory
 - If current position is dired, show lines counts for misc programming lanuages.
 - If current position is a file, show file name and line counts
 - If current position is in *w3m*, show current web title
 - If current positioin is in Article mail mode, show the url under current cursor
 If show-short-info-p is not null, the default behaviour is showing the short filename with extension removed.
 "
  (interactive "P")
  (let ((output_str buffer-file-name))
    (if (and output_str show-short-info-p)
        (setq output_str (file-name-sans-extension (file-name-nondirectory output_str))))
    (cond
     ((string-equal mode-name "w3m") (setq output_str (w3m-current-title)))
     ((string-match "Dired" mode-name)
      (setq output_str (count-code-lines-in-directory default-directory)))
     ((string-equal mode-name "Article") (setq output_str (w3m-print-this-url)))
     )
    (when output_str
      ;; display the result
      (message output_str)
      ;; send the result to kill-string
      (kill-new output_str))
    ))
(defun count-code-lines-in-directory(directory &optional lanuage-postfix-list)
  " Count code lines for various programming lanuages, with the help of below utility:
 find . -name '%s' | xargs wc -l 2>/dev/null | tail -n 1
 "
  (interactive "Ddirectory:")
  (let (command-output (output-str "Count code lines."))
    ;; set lanuages to be checked, if not given
    (if (null lanuage-postfix-list)
        (setq lanuage-postfix-list '("*.php" "*.c" "*.c++" "*.cxx" "*.rb" "*.py"
                                     "*.el" "*.sh" "*.java" "*.pl" "*.erl" "*.cpp" "*.go"
                                     "*.js" "*.sql" "*.mxml" "*.as")))
    ;; count lines
    (dolist (lanuage-var lanuage-postfix-list)
      ;; TODO, remove comments from counting
      ;; suppress the possible stderr for wc, since some temporary files may not be reachable.
      (setq command-output (shell-command-to-string
                            (format "find . -name '%s' | xargs wc -l 2>/dev/null | tail -n 1" lanuage-var)))
      (unless (string= command-output "0\n")
        (setq output-str (format "%s\n%s: %s " output-str lanuage-var command-output))
        ))
    ;; return the result
    (eval output-str)
    ))
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p SPC:goto last edited location in a file
(define-key global-map (kbd "M-p SPC") 'goto-last-edit-point)
(defun goto-last-edit-point()
  "Go to the last point where editing occurred."
  (interactive)
  (let ((undos buffer-undo-list))
    (when (listp undos)
      (while (and undos
                  (let ((pos (or (cdr-safe (car undos))
                                 (car undos))))
                    (not (and (integerp pos)
                              (goto-char (abs pos))))))
        (setq undos (cdr undos))))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun force-kill-matching-buffers (regexp &optional internal-too)
  "Kill buffers whose name matches the specified REGEXP.
The optional second argument indicates whether to kill internal buffers too."
  (interactive "sKill buffers matching this regular expression: \nP")
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (and name (not (string-equal name ""))
                 (or internal-too (/= (aref name 0) ?\s))
                 (string-match regexp name))
        (kill-buffer buffer)))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the reverse of `fill-region'."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun delete-current-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun run-current-file ()
  "Execute or compile the current file.
For example, if the current buffer is the file x.pl,
then it'll call “perl x.pl” in a shell.
The file can be php, perl, python, ruby, javascript, bash, ocaml, vb, elisp.
File suffix is used to determine what program to run."
  (interactive)
  (let (suffixMap fname suffix progName cmdStr)
    ;; a keyed list of file suffix to comand-line program path/name
    (setq suffixMap
          '(
            ("php" . "php")
            ("pl" . "perl")
            ("py" . "python")
            ("java" . "java")
            ("rb" . "ruby")
            ("js" . "js")
            ("sh" . "bash")
            ("ml" . "ocaml")
            ("vbs" . "cscript")
            ))
    (setq fname (buffer-file-name))
    (setq suffix (file-name-extension fname))
    (setq progName (cdr (assoc suffix suffixMap)))
    (setq cmdStr (concat progName " \"" fname "\""))
    (if (string-equal suffix "el") ; special case for emacs lisp
        (load-file fname)
      (if progName
          (progn
            (message "Running...")
            (shell-command cmdStr "*run-current-file output*" ))
        (message "No recognized program file suffix for this file.")
        )
      )))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun ediff-sequent-lines ()
  "Compare two sequent lines in the same buffer, by calling ediff-regions-internal"
  (interactive)
  (let ((fc (current-frame-configuration)))
    (eval
     `(defun rfc ()
        (set-frame-configuration ',fc)
        (remove-hook 'ediff-after-quit-hook-internal 'rfc)))
    (add-hook 'ediff-after-quit-hook-internal 'rfc)
    (ediff-regions-internal
     (current-buffer) (line-beginning-position) (line-end-position)
     (current-buffer) (line-beginning-position 2) (line-end-position 2)
     nil 'ediff-windows-wordwise 'word-mode nil)))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun occur-context (regexp &optional nlines)
  (interactive (occur-read-primary-args))
  (let ((list-matching-lines-default-context-lines 1))
    (occur-1 regexp nlines (list (current-buffer))))
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(defun clean-up-buffer-or-region (cleanup-replace-rule-list)
  "Clean up buffer or region by following:
 Untabifies, indents and deletes trailing whitespace from buffer or region,
 And make necessary replacement, according to the lsit of cleanup-replace-rule-list"
  (save-excursion
    ;; clean useless characters based on rule list
    (dolist (replace-rule cleanup-replace-rule-list)
      (goto-char (point-min))
      (while (re-search-forward (nth 0 replace-rule) nil t)
        (replace-match (nth 1 replace-rule) t))
      ))
  ;; untabify, indent-region, etc
  (unless (region-active-p) (mark-whole-buffer))
  (unless (member mode-name '("Org"))
    (untabify (region-beginning) (region-end))
    (indent-region (region-beginning) (region-end)))
  (narrow-to-region (region-beginning) (region-end))
  (delete-trailing-whitespace)
  )
(global-set-key (kbd "C-c c") 'beautify-region-by-mode)
(defun beautify-region-by-mode()
  (interactive)
  (save-excursion
    (let (cleanup-replace-rule-list)
      (cond
       ((string-equal mode-name "Org")
        (setq cleanup-replace-rule-list
              '(("\n\n+\\\*" "\n*")
                ("," ",")
                (";" ";")
                ("(" "(")
                (")" ")")
                )))
       (t
        (setq cleanup-replace-rule-list
              '(("\n\n+" "\n\n")
                (" +" " ")
                ("," ",")
                (";" ";")
                ("(" "(")
                (")" ")")
                ;; ("\\([^=: !+/-]\\)=" "\\1 =") ;; insert space in the left of equation, if ncessary
                ;; ("=\\([^=: !+/-]\\)" "= \\1") ;; insert space in the right of equation, if ncessary
                )))
       )
      (clean-up-buffer-or-region cleanup-replace-rule-list)
      )))
(defun beautify-web-quotation ()
  (interactive)
  (when (string= mode-name "Org")
    (save-excursion
      (save-restriction
        (org-narrow-to-subtree)
        (goto-char (point-min))
        (while (re-search-forward "\n" nil t)
          (replace-match "\n\n" nil nil))
        (goto-char (point-min))
        (while (re-search-forward "\n\n" nil t)
          (fill-paragraph))
        (goto-char (point-min))
        (while (re-search-forward "\n\n" nil t)
          (replace-match "\n" nil nil)))
      )
    ))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun goto-column (number)
  "Untabify, and go to a column NUMBER within the current line (0 is beginning of the line)."
  (interactive "nColumn number: ")
  (move-to-column number t))
(global-set-key (kbd "M-g c") 'goto-column)
(global-set-key (kbd "M-g g") 'goto-line)
;; --8<-------------------------- §separator§ ------------------------>8--
;; TODO: define short key
(defun scroll-up-one-line()
  "Scroll up one line."
  (interactive)
  (scroll-up 1))
(defun scroll-down-one-line()
  "Scroll down one line."
  (interactive)
  (scroll-down 1))
(defun scroll-other-window-up-line ()
  "Scroll other window up one line."
  (interactive)
  (scroll-other-window 1))
(defun scroll-other-window-down-line ()
  "Scroll other window line down."
  (interactive)
  (scroll-other-window-down 1))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun show-function-info()
  "Show info of current function: line count and character count"
  (interactive)
  (save-excursion
    (let (min max)
      (beginning-of-defun)
      (setq min (point))
      (end-of-defun)
      (setq max (point))
      (message "Function(%s) has %d lines, %d characters" (which-function) (count-lines min max) (- max min)))
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(defun open-folder-in-explorer ()
  "Call when editing a file in a buffer. Open windows explorer in the current directory"
  (interactive)
  (cond
   ((string-equal system-type "gnu/linux")
    ;;TODO, GTK doesn't support
    (shell-command-to-string (concat "nautilus --browser " default-directory)))
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "open" "explorer" (concat "/e,/select,"
                                                 (convert-standard-filename buffer-file-name))))
   )
  )
(global-set-key [(control x)(control d)] 'open-folder-in-explorer)
;; --8<-------------------------- §separator§ ------------------------>8--
(defun save-screenshots (name)
  "Save shot full-screen.
To use this function, you need install scrot."
  (interactive "sPicture Name: ")
  (let* ((my-screenshots-storage-directory "~/")
         (shell-command-var (format "scrot %s%s.png" my-screenshots-storage-directory name)))
    (shell-command shell-command-var)
    (message "Run command: %s" shell-command-var)
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;; TODO: there are some bugs for this function
(global-set-key (kbd "<C-return>") 'switch-to-mode-nex-buffer)
(defun switch-to-mode-nex-buffer()
  "Switch to next buffer in the same mode, and also with certain buffer excluded from the candidates"
  (interactive)
  (let* (old-buffer-mode
         buffer-choose-list
         (buffer-prohibit-list '())
         (buffer-prohibit-regexp-list '(".*Minibuf.*" "\*shell\*.*"
                                        ".*\*Backtrace\*" ".*\*Messages\*.*"
                                        ".*\*scratch\*.*"
                                        )))
    (setq old-buffer-mode (if (listp mode-name) (car mode-name) mode-name))
    ;; filter current buffer out
    (setq buffer-choose-list (cdr (buffer-list)))
    ;; if one buffer's name matchs buffer-prohibit-regexp-list, add it to buffer-prohibit-list
    (dolist (buffer-var buffer-choose-list)
      (set-buffer buffer-var)
      (if (string= old-buffer-mode (if (listp mode-name) (car mode-name) mode-name))
          ;; If buffer is in the same mode with current buffer, check whether we need further filter
          (dolist (buffer-prohibit-regexp buffer-prohibit-regexp-list)
            (if (string-match buffer-prohibit-regexp (buffer-name buffer-var))
                (add-to-list 'buffer-prohibit-list buffer-var)
              ))
        ;; filter buffers which have a different mode
        (add-to-list 'buffer-prohibit-list buffer-var)
        )
      )
    ;; remove all buffers in buffer-prohibit-list from buffer-choose-list
    (dolist (buffer-var buffer-prohibit-list)
      (setq buffer-choose-list (delq buffer-var buffer-choose-list)))
    ;; switch to next proper buffer
    (switch-to-buffer (car buffer-choose-list))
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(add-hook 'write-file-hooks 'auto-update-file-fields)
(defun auto-update-file-fields ()
  "Update fields in file, such as filename, time-stamp, etc
 Sample:
 - filename format:
 # File : handyfunction-setting.el
 "
  (interactive)
  (save-excursion
    (save-restriction
      (let ((file-name-regexp (concat "\\(File *\\: \\)\\([^" " " "
]*\\) *"))
            (max-lines 15)
            (beg (point-min)) end
            )
        (goto-char (point-min))
        (forward-line max-lines)
        (setq end (point))
        (narrow-to-region beg end)
        (goto-char (point-min))
        ;; Verify looking at a file name for this mode.
        (while (re-search-forward file-name-regexp nil t)
          (goto-char (match-beginning 2))
          (delete-region (match-beginning 2) (match-end 2))
          (insert (file-name-nondirectory (buffer-file-name)))
          ))
      )))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun what-hexadecimal-value ()
  "Prints the decimal value of a hexadecimal string under cursor.
Samples of valid input:

 ffff
 0xffff
 #xffff
 FFFF
 0xFFFF
 #xFFFF

Test cases
 64*0xc8+#x12c 190*0x1f4+#x258
 100 200 300 400 500 600"
  (interactive )

  (let (inputStr tempStr p1 p2 )
    (save-excursion
      (search-backward-regexp "[^0-9A-Fa-fx#]" nil t)
      (forward-char)
      (setq p1 (point) )
      (search-forward-regexp "[^0-9A-Fa-fx#]" nil t)
      (backward-char)
      (setq p2 (point) ) )

    (setq inputStr (buffer-substring-no-properties p1 p2) )

    (let ((case-fold-search nil) )
      (setq tempStr (replace-regexp-in-string "^0x" "" inputStr )) ; C, Perl, …
      (setq tempStr (replace-regexp-in-string "^#x" "" tempStr )) ; elisp …
      (setq tempStr (replace-regexp-in-string "^#" "" tempStr )) ; CSS …
      )

    (message "Hex %s is %d" tempStr (string-to-number tempStr 16 ) )
    ))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun total-numbers-region (begin end pattern sub-index)
  "Count all the matches for numbers between BEGIN and END, that
are in the sub-pattern of PATTERN given by SUB-INDEX."
  (interactive
   (list (region-beginning) (region-end)
         (read-from-minibuffer "Pattern: " "\\([-0-9]+\\)")
         (string-to-number (read-from-minibuffer "Sub-pattern index: " "1"))))
  (save-excursion
    (goto-char begin)
    (let ((total 0)
          (count 0))
      (while (re-search-forward pattern end t)
        (setq total (+ total (string-to-number (match-string-no-properties sub-index)))
              count (1+ count)))
      (message "%d numbers totalled %d" count total)
      total)))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun show-interest ()
  "Show interesting information for my daily life.
These information is probably retrieved from internet. "
  (interactive)
  (cn-weather-today)
  (cn-weather-forecast)
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(defun my-random-string (&optional n)
  "Return a string of random characters of length N (default 10)."
  (let ((x ""))
    (dotimes (i (or n 10) x)
      (setq x (format "%s%c" x (+ 33 (random 94)))))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun insert-line-number(&optional arg)
  "Insert a numeric sequence at beginning of each line"
  (interactive "P")
  (let ((insert-number
         (lambda (start beg end)
           "insert a numeric sequence at beginning of each line"
           (goto-char beg)
           (beginning-of-line)
           (insert (number-to-string start))
           (setq start (+ start 1))
           (while (< (point) end)
             (beginning-of-line 2)
             (insert (number-to-string start))
             (setq start (+ start 1))
             ))))
    (cond
     ((or mark-active transient-mark-mode)
      (if (> (point) (mark))
          (exchange-point-and-mark))
      (if arg
          (funcall insert-number arg (point) (mark))
        (funcall insert-number 0 (point) (mark)))
      )
     (t
      (if arg
          (funcall insert-number arg (point-min) (point-max))
        (funcall insert-number 0 (point-min) (point-max)))
      ))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun boxquote-rectangle (b e)
  "Draw a box comment around the region but arrange for the region
to extend to at least the fill column. Place the point after the
comment box."
  (interactive "r")
  (let ((e (copy-marker e t)))
    (goto-char b)
    (end-of-line)
    (insert-char ? (- fill-column (current-column)))
    (comment-box b e 1)
    (goto-char e)
    (set-marker e nil)))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun occur-more ()
  (interactive)
  (let ((context-lines list-matching-lines-default-context-lines) occur-find-str)
    (setq occur-find-str (read-shell-command "List lines matching regexp: "
                                             nil 'grep-find-history))
    (setq list-matching-lines-default-context-lines 3)
    (occur occur-find-str)
    (setq list-matching-lines-default-context-lines context-lines)
    ))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun hexl-show ()
  (interactive)
  (message "hex (%s) to decimal (%s)." (current-word) (string-to-number (current-word) 16))
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: handyfunction-setting.el ends here
