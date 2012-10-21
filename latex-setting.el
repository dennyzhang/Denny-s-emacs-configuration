;; -*- coding: utf-8 -*-
;; File: latex-setting.el -- latex for presentation or html
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-10-22 00:45:45>
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

(setq org-beamer-outline-frame-title "如何测试云平台")
(setq org-beamer-frame-default-options "[allowframebreaks]")
;; --8<-------------------------- separator ------------------------>8--
;; skip generating table of contents
(setq org-export-latex-format-toc-function 'org-export-latex-format-toc-stumb)
(defun org-export-latex-format-toc-stumb (depth) "")

(setq org-export-latex-append-header "
\\usepackage{tikz}
\\usetheme{AnnArbor}
\\subtitle{商派电子商务云平台的回顾和反思}
\\institute[Shopex]{上海商派}
\\logo{\\pgfimage[width=1.1cm,height=0.8cm]{shopex.png}}

\\AtBeginSection[]
{
  \\begin{frame}
    \\frametitle{目录}
    \\tableofcontents[currentsection]
  \\end{frame}
}
")
;; --8<-------------------------- separator ------------------------>8--
;; File: tmp.el ends here
