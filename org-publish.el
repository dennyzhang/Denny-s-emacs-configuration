;; -*- coding: utf-8 -*-
;; File: org-publish.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-12-18 21:39:42>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;; don't export the useless html validation link
(setq org-export-html-validation-link "")
(add-to-list 'org-export-language-setup '("cn" "作者" "时间" "目录" "注脚"))
(setq org-export-default-language "cn")
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("org-share"
         :base-directory "~/backup/Dropbox/private_data/emacs_stuff/org_data/org_share/" ;; Remove hard code
         :publishing-directory "~/org_publish/publish_html/"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-website
         :headline-levels 4
         :auto-preamble t
         )
        ("org-index"
         :base-directory "~/backup/Dropbox/private_data/emacs_stuff/org_data/org_share/" ;; Remove hard code
         :publishing-directory "~/org_publish/publish_html/"
         :base-extension "index"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :auto-preamble t
         )
        ("publish" :components ("org-share" "org-index"))
        ))

(defun org-publish-org-to-website (plist filename pub-dir)
  "Publish an org file to HTML.
See `org-publish-org-to' to the list of arguments."
  (org-publish-with-aux-preprocess-maybe
   (org-publish-org-to "website" plist filename pub-dir)))

(defun org-export-as-website (arg &optional hidden ext-plist
                                  to-buffer body-only pub-dir not-generate-sitemap)
  (interactive "P")
  (let* ((src-org-file buffer-file-name)
         (dst-org-file (format "%s.index" (file-name-sans-extension src-org-file)))
         src-shortname export-buffer export-file
         org-tag top-entry-link start-pos end-pos
         top-entry-pos (top-entry-pos-list '())
         top-entry-title (top-entry-title-list '()))
    ;; caculate top entries
    (goto-char 0)
    (while (search-forward-regexp "^* " nil t)
      (setq top-entry-pos (- (point) 2))
      ;; obtain titles of top entries
      (org-back-to-heading t)
      (setq top-entry-title
            (if (looking-at
                 "\\*+[ \t]+\\([^\n\r]*?\\)\\([ \t]+:[[:alnum:]:_@#%]+:[ \t]*\\)?$")
                (match-string-no-properties 1) ""))
      (setq org-tag (org-get-tags))
      (if (member "BLOG" org-tag)
          (progn
            ;; escape [] to () in tope-entry-title
            (setq top-entry-title (replace-regexp-in-string "\\[" "(" top-entry-title))
            (setq top-entry-title (replace-regexp-in-string "\\]" ")" top-entry-title))
            (unless (null top-entry-title)
              (setq start-pos top-entry-pos)
              (org-forward-same-level 1)
              (setq end-pos (point))
              (add-to-list 'top-entry-pos-list (cons start-pos end-pos))
              (setq top-entry-title-list (cons top-entry-title top-entry-title-list))
              )))
      (goto-char (+ 1 top-entry-pos))
      )
    ;; generate a separate page for each top entry
    (let (start-end-pos)
      (dolist (top-entry-title top-entry-title-list)
        (setq start-end-pos (pop top-entry-pos-list))
        (setq start-pos (car start-end-pos))
        (setq end-pos (cdr start-end-pos))
        ;; mark region
        (transient-mark-mode t)
        (goto-char start-pos)
        (set-mark (point))
        (goto-char end-pos)
        ;; export html
        (setq export-buffer (format "%s-%s.html"
                                    (file-name-sans-extension (file-name-nondirectory buffer-file-name))
                                    (md5 top-entry-title)))
        (save-excursion
          (org-export-as-html
           arg hidden ext-plist export-buffer body-only pub-dir)
          (setq export-file (format "%s/%s" pub-dir export-buffer))
          (write-file export-file nil)
          (kill-buffer export-buffer)
          )
        ;; (org-export-as-html arg hidden ext-plist to-buffer body-only pub-dir)
        (if (fboundp 'deactivate-mark) (deactivate-mark))
        ))
    (unless not-generate-sitemap
        (save-excursion
          (find-file dst-org-file)
          (setq export-buffer (format "%s.html" (file-name-sans-extension (file-name-nondirectory dst-org-file))))
          (erase-buffer)
          (setq src-shortname (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
          (insert (format "-*- mode:org; fill-column:90; coding:utf-8; -*-
#+LINK_HOME: index.html
#+LINK_UP: %s.html
" src-shortname))
          (setq top-entry-title-list (nreverse top-entry-title-list))
          (dolist (top-entry-title top-entry-title-list)
            (setq top-entry-link (format "%s-%s.org" src-shortname (md5 top-entry-title)))
            (insert (format "* [[file:%s][%s]]\n" top-entry-link top-entry-title)))
          (save-buffer 0)
          (org-export-as-html arg hidden ext-plist export-buffer body-only pub-dir)
          (setq export-file (format "%s/%s" pub-dir export-buffer))
          (write-file export-file nil)
          (kill-buffer export-buffer)
          (delete-file dst-org-file)
          ))
    ))
(org-defkey org-mode-map (kbd "C-c c") 'migrate-old-org)
(defun migrate-old-org()
  (interactive)
  (while (re-search-forward "basic description" nil t)
    (replace-match "basic use" nil nil))
  (replace-entry "useful link")
  (replace-entry "basic use")
  (replace-entry "best practice")
  (replace-entry "mail")
  (replace-entry "web")
  (replace-entry "console")
  (goto-char (point-min))
  (while (re-search-forward "\n+\\(#\\+begin.*\\)\n+" nil t)
    (replace-match (format "\n%s\n" (match-string 1)) nil nil))
  (goto-char (point-min))
  (while (re-search-forward "\n+\\(#\\+end.*\\)\n+" nil t)
    (replace-match (format "\n%s\n" (match-string 1)) nil nil))
  (goto-char (point-min))
  (while (re-search-forward "#\\+BEGIN_EXAMPLE\n+#\\+END_EXAMPLE" nil t)
    (replace-match "" nil nil))
  (beautify-region-by-mode)
  (org-shifttab t)
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(defun wash-html-for-wordpress (html-dir)
  "Wash html files for a better appearance in wordpress:
 - remove section, which includes head section and css styles, etc
 - replace <div id = \"content\"> to <div>
"
  (interactive)
  (let ((html-files (directory-files html-dir t ".html$")))
    (dolist (html-file html-files)
      (wash-html-for-wordpress-internal html-file)
      )
    )
  )

(defun wash-html-for-wordpress-internal (html-file &optional insert-prefix-str)
  (interactive)
  (let (start-pos end-pos)
    ;; open the specific file
    (find-file html-file)
    ;; remove useless sections
    (goto-char (point-min))
    (when (search-forward-regexp "<\\?xml" nil t)
      (setq start-pos (- (point) (length "<?xml")))
      (when (search-forward-regexp "</head>" nil t)
        (setq end-pos (point))
        (delete-region start-pos end-pos)
        )
      )
    (insert (format "<style type=\"text/css\"> %s %s %s </style> "
                    "table .left, table .right { float:none; } "
                    "pre {overflow-x:auto; width: 600px} "
                    "h3 {padding-top: 0.5em; font-size:1.2em; line-height:150%;} "))
    (goto-char (point-min))
    (while (search-forward-regexp "<div id=\"content\">" nil t)
      (replace-match "<div>"))
    (goto-char (point-min))
    (while (search-forward-regexp "</html>" nil t)
      (replace-match ""))

    ;; insert description for wordpress
    (unless insert-prefix-str
      (setq insert-prefix-str "个人知识库<!--more-->")
      (goto-char (point-min))
      (unless (search-forward-regexp insert-prefix-str nil t)
        (insert insert-prefix-str)))
    (write-file html-file nil)
    (kill-buffer)
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(add-to-list 'load-path (concat CONTRIBUTOR_CONF "/wordpress"))
(require 'weblogger)
(setq weblogger-server-url "http://blog.ec-ae.com/xmlrpc.php")
(setq weblogger-server-username "STUB") ;; TODO: more secure
(setq weblogger-server-password "STUB") ;; TODO: more secure
(defun xml-rpc-value-to-xml-list (value)
  "Return XML representation of VALUE properly formatted for use with the  \
functions in xml.el."
  (cond
					;   ((not value)
					;    nil)
   ((xml-rpc-value-booleanp value)
    `((value nil (boolean nil ,(xml-rpc-boolean-to-string value)))))
   ;; might be a vector
   ((vectorp value)
    (xml-rpc-value-to-xml-list (append value nil)))
   ((listp value)
    (let ((result nil)
	  (xmlval nil))
      (if (xml-rpc-value-structp value)
	  ;; Value is a struct
	  (progn
	    (while
		(progn
		  (when (and (symbolp (caar value)) (string= (caar value) :struct))
		    (setq value (cons (cdar value) (cdr value))))
		  (setq xmlval `((member nil (name nil ,(caar value))
					 ,(car (xml-rpc-value-to-xml-list
						(cdar value)))))
			result (if t (append result xmlval) (car xmlval))
			value (cdr value))))
	    `((value nil ,(append '(struct nil) result))))
	;; Value is an array
	(while (setq xmlval (xml-rpc-value-to-xml-list (car value))
		     result (if result (append result xmlval)
			      xmlval)
		     value (cdr value)))
	`((value nil (array nil ,(append '(data nil) result)))))))
   ;; Value is a scalar
   ((xml-rpc-value-intp value)
    `((value nil (int nil ,(int-to-string value)))))
   ;; Value is a Date ...
   ((xml-rpc-value-datep value)
    `((value nil (dateTime.iso8601 nil ,value))))
   ;; Value is a String
   ((xml-rpc-value-stringp value)
    (let ((charset-list (find-charset-string value)))
      (if (or xml-rpc-allow-unicode-string
	      (and (eq 1 (length charset-list))
		   (eq 'ascii (car charset-list)))
	      (not xml-rpc-base64-encode-unicode))
	  `((value nil (string nil ,value))) ;;TODO: temporarily hack here
	`((value nil (base64 nil ,(base64-encode-string
				   (encode-coding-string value 'utf-8))))))))
   ((xml-rpc-value-doublep value)
    `((value nil (double nil ,(number-to-string value)))))
   (t
    `((value nil (base64 nil ,(base64-encode-string value)))))))
;; --8<-------------------------- §separator§ ------------------------>8--
(defun weblogger-struct-to-request (entry)
  "Convert the struct to something that can be used in an xml-rpc request."
  (delq nil
	(list
	 (assoc "title"        entry)
	 (assoc "authorName"   entry)
	 (assoc "userid"       entry)
	 (assoc "dateCreated"  entry)
	 (cons "mt_tb_ping_urls"   (cdr (assoc "trackbacks"  entry)))
	 (cons "mt_convert_breaks" (weblogger-texttype-id-from-name
				    (cdr (assoc "texttype"    entry))))
	 (cons "link"              (cdr (assoc "url"         entry)))
	 (cons "description"       "个人知识库")
	 (cons "mt_keywords"       "个人知识库")
	 (cons "mt_text_more"              (cdr (assoc "content"         entry)))
	 (cons "categories"        "个人知识库"))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: org-publish.el ends here