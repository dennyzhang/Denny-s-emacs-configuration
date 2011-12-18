;; -*- coding: utf-8 -*-
;; File: insertion-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-12-04 11:33:39>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p i: insert time
(defun my-insert-time()
  (interactive)
  (let* ((insert_str (format-time-string "<%Y-%m-%d %H:%M UTC +8>" (current-time))))
    (insert insert_str)
    ))
;;insert string:*** useful link
(defun useful4orgmode()
  (interactive)
  (move-beginning-of-line nil)
  (forward-line)
  (insert "*** useful link\n")
  )
;;insert string:*** basic use
(defun basicuse-for-orgmode()
  (interactive)
  (forward-line)
  (move-beginning-of-line nil)
  (insert "*** basic use\n")
  )
;;insert diary entry
(defun my-insert-diary-entry()
  (interactive)
  (save-excursion
    (insert (format-time-string "** %Y-%m-%d %a %H:%M: \n" (current-time)))
    (insert "# 今日所学\n")
    (insert "# 今日趣闻\n")
    (insert "# 今日杂记\n")
    )
  (org-end-of-line)
  )

(add-hook 'org-mode-hook
          (lambda () (progn
                       (setq truncate-lines t) ;;truncate line in org-mode
                       ;;key combination with certain mode
                       (local-set-key [(meta p)(b)] 'basicuse-for-orgmode)
                       (local-set-key [(meta p)(u)] 'useful4orgmode)
                       ;;(local-set-key [(meta p)(i)] 'my-insert-time)
                       (local-set-key [(meta p)(d)] 'my-insert-diary-entry)
                       )
            ))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun insert-c++-class-header ()
  "Inserts a C++ class header which conforms to Oacis standards."
  (interactive)
  (insert
   "//-----------------------------------------------------------------------------\n"
   "// Class:\t\t_class_\n"
   "// Purpose:\t\n"
   "//-----------------------------------------------------------------------------\n"
   "\n")
  (message "Inserted C++ class header")
  )

(defun insert-c++-class ()
  "Inserts a C++ class which conforms to Oacis standards."
  (interactive)
  (insert-c++-class-header)
  (insert
   "class _class_\n"
   "{\n"
   "public:\n"
   "\n"
   " // Constructor/destructor.\n"
   " _class_();\n"
   " virtual ~_class_();\n"
   "\n"
   "private:\n"
   "\n"
   " // Unused ctor and assignment op.\n"
   " _class_(const _class_&);\n"
   " _class_& operator=(const _class_&);\n"
   "};\n"
   "\n")
  (message "Inserted C++ class")
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;;insert string: ;; --8<-------------------------- §separator§ ------------------------>8--
(defun get-separator ()
  "Get separator for different modes"
  (cond
   ((string-equal mode-name "Emacs-Lisp") ";;")
   ((string-equal mode-name "Lisp") ";;")
   ((string-equal mode-name "Erlang") "%%")
   (t (if comment-start comment-start ""))))

(global-set-key [(meta p)(s)]
                (lambda ()
                  (interactive)
                  (move-beginning-of-line nil)
                  (insert
                   (format "%s --8<-------------------------- §separator§ ------------------------>8--\n"
                           (get-separator)))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun insert-unicode-drawing-box ()
  "Insert a drawing box of unicode chars."
  (interactive)
  (insert "┌─┬─┐
│ │ │
├─┼─┤
│ │ │
└─┴─┘"))
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'autoinsert)
(auto-insert-mode t);; Adds hook to find-files-hook
(setq auto-insert-directory (concat DENNY_CONF "emacs_data/templates/"))
(setq auto-insert-query nil);; If you don't want to be prompted before insertion
(setq auto-insert-alist
      '(
        ("\\.cpp$" . ["t.cpp" auto-update-c-source-file])
        ("\\.h$" . ["t.h" auto-update-header-file])
        ("\\.c$" . ["t.c" auto-update-c-source-file])
        ("\\.h$" . ["t.h" auto-update-header-file])
        ("\\.makefile$" . ["t.mak" auto-update-header-file])
        ("\\.py$" . ["t.py" auto-update-header-file])
        ("\\.php$" . ["t.php" auto-update-header-file])
        ))
(setq auto-insert 'other) ;;insert if possible, but mark as unmodified.
;; replaces '@@@' by the current file name.
(defun auto-update-header-file ()
  (save-excursion
    (while (search-forward "@@@" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (upcase (file-name-nondirectory buffer-file-name)))
        (subst-char-in-region (point-min) (point-max) ?. ?_)
        ))
    )
  )

;; replaces 'HHH' by the file sans suffix.
;; replaces 'DDD' by current date.
(defun auto-update-c-source-file ()
  (save-excursion
    ;; Replace HHHH with file name sans suffix
    (while (search-forward "HHHH" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".h") t
                       )
        ))
    )
  (save-excursion
    ;; Replace @@@ with file name
    (while (search-forward "@@@" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (file-name-nondirectory buffer-file-name))
        ))
    )
  (save-excursion
    ;; replace DDDD with today's date
    (while (search-forward "DDDD" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match "")
        (my-insert-time)
        ))
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: insertion-setting.el
