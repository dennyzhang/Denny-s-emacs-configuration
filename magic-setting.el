;; -*- coding: utf-8 -*-
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; File: magic-setting.el
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-09-09 14:01:40>
;; --8<-------------------------- separator ------------------------>8--
(defun show-interest ()
  "Show interesting information for my daily life.
These information is probably retrieved from internet. "
  (interactive)
  (cn-weather-today)
  (cn-weather-forecast)
  )

;;M-p i: show interesting information for current file or directory
;;C-u M-p i: show short file name of current buffer
(define-key global-map (kbd "M-p i") 'show-magic-info)
;; disable predefined M-p for comint-mode-map
(define-key comint-mode-map (kbd "M-p") nil)
(define-key comint-mode-map (kbd "M-p i") 'show-magic-info)
(defun show-magic-info(show-short-info-p)
  "show interesting information for current file or directory
 - If current position is dired, show lines counts for misc programming lanuages.
 - If current position is a file, show file name and line counts
 - If current position is in *w3m*, show current web title
 - If current positioin is in Article mail mode, show the url under current cursor
 If show-short-info-p is not null, the default behaviour is showing the short
 filename with extension removed.
 "
  (interactive "P")
  (let ((output_str buffer-file-name)
        (mode-str (current-mode-str))
        )
    (if (and output_str show-short-info-p)
        (setq output_str
              (file-name-sans-extension (file-name-nondirectory output_str))))
    (cond
     ((string-prefix-p "w3m" mode-str) (setq output_str (w3m-current-title)))
     ((string-prefix-p "Dired" mode-str)
      (setq output_str (count-code-lines-in-directory default-directory)))
     ((string-prefix-p "Article" mode-str) (setq output_str (w3m-print-this-url)))
     (t (if (null output_str) (setq output_str (buffer-name))))
     )
    (when output_str
      ;; display the result
      (message output_str)
      ;; send the result to kill-string
      (kill-new output_str))
    ))
;; --8<-------------------------- separator ------------------------>8--
(defun count-code-lines-in-directory(directory &optional lanuage-postfix-list)
  " Count code lines for various programming lanuages, with the help of below utility:
 find . -name '%s' | xargs wc -l 2>/dev/null | tail -n 1
 "
  (interactive "Ddirectory:")
  (let (command-output (output-str "Count code lines."))
    ;; set lanuages to be checked, if not given
    (if (null lanuage-postfix-list)
        (setq lanuage-postfix-list
              '("*.php" "*.c" "*.c++" "*.cxx" "*.rb" "*.py" "*.go"
                "*.el" "*.sh" "*.java" "*.pl" "*.erl" "*.cpp" "*.cc" "*.cxx"
                "*.m" "*.h"
                "*.js" "*.sql" "*.mxml" "*.as")))
    ;; count lines
    (dolist (lanuage-var lanuage-postfix-list)
      ;; TODO, remove comments from counting
      ;; suppress the possible stderr for wc, since some temporary files may not be reachable.
      (setq command-output
            (shell-command-to-string
             (format "find . -name '%s' | xargs wc -l 2>/dev/null | tail -n 1" lanuage-var)))
      (unless (or (string= command-output "0\n")
                  (string= command-output ""))
        (setq output-str (format "%s\n%s: %s " output-str lanuage-var command-output))
        ))
    ;; return the result
    (eval output-str)
    ))
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
;; File: handyfunction-setting.el ends here
