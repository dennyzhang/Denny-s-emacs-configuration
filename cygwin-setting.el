;; -*- coding: utf-8 -*-
;; File: cygwin-setting.el --- Settings only valid for cygwin environment
;;
;; Author: Denny(denny.zhang001@gmail.com)
;;
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2017-07-20 11:18:19>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq thumbs-conversion-program "d:/cygwin/bin/convert.exe")
;; --8<-------------------------- separator ------------------------>8--
(defun dot-to-ascii (beg end)
  (interactive "r")
  ;; Perl CLI to convert from dot file to ascii diagram
  ;; http://bloodgate.com/perl/graph/manual/index.html
  (save-excursion
    (let* (
           (convert_path (concat EMACS_VENDOR "/nonelisp-tool/Graph-Easy-0.64/examples/as_ascii"))
           (dot_file "tmp_denny_dot_file_88439.tmp")
           (ascii_file "tmp_denny_ascii_file_88439.tmp")
           (new_buffer_name "*ASCII Diagram From Dot File*")
           (ascii_convert (format "perl %s %s > %s" convert_path dot_file ascii_file))
           )
      ;; write dot content to a temporary file
      (create-file-buffer dot_file)
      (append-to-file beg end dot_file)
      (message ascii_convert)
      (shell-command ascii_convert)
      ;; read ascii table from the output file
      (switch-to-buffer (find-file ascii_file))
      (let (ascii_content (buffer-string))
        (kill-buffer ascii_file)
        ;; send the ascii table to a temporary buffer
        (with-output-to-temp-buffer new_buffer_name (princ ascii_content))
        (switch-to-buffer-other-window new_buffer_name)
        ;; remove temporary files
        (if (file-exists-p dot_file) (delete-file dot_file))
        (if (file-exists-p ascii_file) (delete-file ascii_file))
        )
      )
    )
  )
;; --8<-------------------------- separator ------------------------>8--
(create-fontset-from-fontset-spec
 "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-fontset-startup")
(setq default-frame-alist
      (append
       '((font . "fontset-startup")
         (foreground-color . "Wheat")
         (background-color . "DarkSlateGray")
         (cursor-color . "Orchid")
         )
       default-frame-alist))
;; --8<-------------------------- separator ------------------------>8--
;; File: cygwin-setting.el ends here
