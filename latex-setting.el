;; -*- coding: utf-8 -*-
;; File: latex-setting.el -- latex for presentation or html
;;
;; Author: Denny(denny.zhang001@gmail.com)
;;
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2015-01-21 11:03:50>
;; --8<-------------------------- separator ------------------------>8--
;; hacking latex export for showing Chinese characters
(add-hook 'org-export-latex-final-hook 'update-orgbeam-latex)
;;(add-to-list 'org-export-latex-default-packages-alist '("" "CJKutf8" t))
(defun update-orgbeam-latex()
 (interactive)
 (goto-char (point-min))
 (replace-string "usepackage{hyperref}" "usepackage{CJKutf8}" nil (point-min) (point-max))
 (goto-char (point-min))
 (replace-string "begin{document}

" "begin{document}
\\begin{CJK}{UTF8}{gkai}
" nil (point-min) (point-max))
 (goto-char (point-min))
 (replace-string "

\\end{document}" "
\\end{CJK}
\\end{document}" nil (point-min) (point-max))
 )
;; \\begin{CJK}{UTF8}{song}
;; \\begin{CJK}{UTF8}{gkai}

(setq org-beamer-frame-default-options "[allowframebreaks]")
;; --8<-------------------------- separator ------------------------>8--
;; skip generating table of contents
(setq org-export-latex-format-toc-function 'org-export-latex-format-toc-stumb)
(defun org-export-latex-format-toc-stumb (depth) "")
;; --8<-------------------------- separator ------------------------>8--
(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)
;; --8<-------------------------- separator ------------------------>8--
;; File: latex-setting.el ends here
