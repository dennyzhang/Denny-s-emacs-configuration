;; -*- coding: utf-8 -*-
;; File: insertion-setting.el -- utilites for intelligent insertion
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-05-15 09:37:32>
;;
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/yasnippet-bundle"))
(require 'yasnippet-bundle)
(yas/load-directory (expand-file-name "snippets/" (concat DENNY_CONF "emacs_conf")))
(yas/initialize)
(defun yas/new-snippet (&optional choose-instead-of-guess)
  (interactive "P")
  (let ((guessed-directories (yas/guess-snippet-directories)))
    (switch-to-buffer "*new snippet*")
    (erase-buffer)
    (kill-all-local-variables)
    (snippet-mode)
    (set (make-local-variable 'yas/guessed-modes)
         (mapcar #'(lambda (d)
                     (intern (yas/table-name (car d))))
                 guessed-directories))
    (unless (and choose-instead-of-guess
                 (not (y-or-n-p "Insert a snippet with useful headers? ")))
      (yas/expand-snippet "\
# -*- mode: snippet -*-
# name: $1
# --
$0"))))
;; --8<-------------------------- separator ------------------------>8--
(defun my-insert-time()
  (interactive)
  (let* ((insert_str
          (format-time-string "<%Y-%m-%d %H:%M UTC +8>" (current-time))))
    (insert insert_str)
    ))
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
;;insert string: ;; --8<-------------------------- separator ------------------------>8--
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
                  (cond
                   ((and (string= "Org" mode-name) (org-current-level))
                    (insert (make-string (org-current-level) ?*) " "
                            (format "%s --8<-------------------------- separator ------------------------>8--\n"
                                    (get-separator))))
                   (t
                    (insert
                     (format "%s --8<-------------------------- separator ------------------------>8--\n"
                             (get-separator)))))))
;; --8<-------------------------- separator ------------------------>8--
(defun insert-unicode-drawing-box ()
  "Insert a drawing box of unicode chars."
  (interactive)
  (insert "┌─┬─┐
│ │ │
├─┼─┤
│ │ │
└─┴─┘"))
;; --8<-------------------------- separator ------------------------>8--
;; File: insertion-setting.el
