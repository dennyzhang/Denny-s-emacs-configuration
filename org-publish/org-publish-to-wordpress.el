;; -*- coding: utf-8 -*-
;; File: org-publish-to-wordpress.el
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2014-12-07 17:59:50>
;;
;; --8<-------------------------- separator ------------------------>8--
;; don't export the useless html validation link
(load-file (concat EMACS_VENDOR "http-post-simple/http-post-simple.el"))
(require 'http-post-simple)
(load-file (concat EMACS_VENDOR "org-publish/org-publish.el")
;; (require 'org-publish) ;; TODO
(setq org-export-html-validation-link "")
;; (add-to-list 'org-export-language-setup '("cn" "Author" "Time" "Table Of Content" "Footnote")) ;; TODO
(setq org-export-default-language "cn")
;; --8<-------------------------- separator ------------------------>8--
(require 'weblogger)
;; --8<-------------------------- separator ------------------------>8--
(setq org-publish-project-alist
      '(
        ("org-share"
         :base-directory "~/backup/essential/Dropbox/private_data/emacs_stuff/org_data/org_share/" ;; Remove hard code
         :publishing-directory "~/org_publish/publish_html/"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-website
         :headline-levels 4
         :auto-preamble t
         )
        ("org-index"
         :base-directory "~/backup/essential/Dropbox/private_data/emacs_stuff/org_data/org_share/" ;; Remove hard code
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

(defun get-top-entry-title ()
  (org-back-to-heading t)
  (setq top-entry-title
        (if (looking-at
             "\\*+[ \t]+\\([^\n\r]*?\\)\\([ \t]+:[[:alnum:]:_@#%]+:[ \t]*\\)?$")
            (match-string-no-properties 1) ""))
  ;; escape [] to () in tope-entry-title
  (setq top-entry-title (replace-regexp-in-string "\\[" "(" top-entry-title))
  (setq top-entry-title (replace-regexp-in-string "\\]" ")" top-entry-title))
  )

(defun org-export-as-website (arg &optional hidden ext-plist
                                  to-buffer body-only pub-dir not-generate-sitemap)
  (interactive "P")
  (let* ((src-org-file buffer-file-name)
         (dst-org-file (format "%s.index" (file-name-sans-extension src-org-file)))
         (org-tag '())
         src-shortname export-buffer export-file
         org-tag top-entry-link start-pos end-pos
         keyword-list
         category
         top-entry-pos (top-entry-pos-list '())
         top-entry-title (top-entry-title-list '()))
    ;; caculate top entries
    (goto-char 0)
    (while (search-forward-regexp "^* " nil t)
      (setq top-entry-pos (- (point) 2))
      ;; obtain titles of top entries
      (setq top-entry-title (get-top-entry-title))
      (setq org-tag (org-get-tags))
      (if (member BlOG-TAG org-tag)
          (progn
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
        (setq category (car (delete BlOG-TAG (org-get-tags))))
        (setq keyword-list (org-entry-get nil "type"))
        (if (null keyword-list) (setq keyword-list ""))
        (set-mark (point))
        (goto-char end-pos)
        ;; export html
        (setq export-buffer (format "%s-%s-%s_%s.html"
                                    (file-name-sans-extension (file-name-nondirectory buffer-file-name))
                                    (md5 top-entry-title)
                                    category
                                    keyword-list
                                    ))
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
(org-defkey org-mode-map (kbd "C-c v") 'beautify-web-quotation)
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
          (replace-match "\n" nil nil))
        (goto-char (point-min))
        (while (re-search-forward "\n\n+" nil t)
          (replace-match "\n\n" nil nil)))
      )
    ))
;; --8<-------------------------- separator ------------------------>8--
(defun wash-html-for-wordpress (&optional html-dir)
  "Wash html files for a better appearance in wordpress:
 - remove section, which includes head section and css styles, etc
 - replace <div id = \"content\"> to <div>
"
  (interactive)
  (let (html-files)
    (unless html-dir (setq html-dir "~/org_publish/publish_html/"))
    (setq html-files (directory-files html-dir t ".html$"))
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
                    "pre {width: 600px;
 overflow: auto;
 }"
                    "h3 {padding-top: 0.5em; font-size:1.2em; line-height:150%;} "))
    (while (search-forward-regexp "<div id=\"content\">" nil t)
      (replace-match "<div>"))
    (goto-char (point-min))
    (while (search-forward-regexp "</html>" nil t)
      (replace-match ""))
    ;; workaround for wordpress's new paragraph
    (goto-char (point-min))
    (while (search-forward-regexp "<br/>" nil t)
      (replace-match ""))
    ;; make a special seperator
    (goto-char (point-min))
    (when (search-forward-regexp "<p>:PROPERTIES:" nil t)
      (replace-match "<br/>\n<p>:PROPERTIES:"))
    (goto-char (point-min))
    ;; add digest for wordpress
    (goto-char (point-min))
    (while (search-forward-regexp "</ul>
</div>
</div>
" nil t)
      (replace-match "</ul>
</div>
</div>
<!--more-->
"))
    ;; insert tailing whitespace line
    (goto-char (point-min))
    (while (search-forward-regexp "</body>" nil t)
      (replace-match "<br/></body>"))
    ;; insert description for wordpress
    (unless insert-prefix-str
      (setq insert-prefix-str "")
      (goto-char (point-min))
      (unless (search-forward-regexp insert-prefix-str nil t)
        (insert insert-prefix-str)))
    (write-file html-file nil)
    (kill-buffer)
    ))
;; --8<-------------------------- separator ------------------------>8--
(defun update-wordpress-blog (&optional html-dir)
  (interactive)
  (let ((wordpress-server-url (concat mywordpress-server-url "/xmlrpc.php"))
        (wordpress-username mywordpress-username)
        (wordpress-pwd mywordpress-pwd)
        html-files short-filename
        title-md5 post-meta
        meta-start meta-end
        (category "")
        (description-str "")
        (content-str "")
        (more-position (point-min))
        keyword-list
        post-struct post-id post-title)

    ;; ;; prevent export toc
    ;; (make-local-variable 'org-export-with-toc)
    ;; (setq org-export-with-toc nil)

    (unless html-dir (setq html-dir "~/org_publish/publish_html/"))
    (wash-html-for-wordpress html-dir)
    (setq html-files (directory-files html-dir t ".*-.*-.*_.*.html$"))
    (setq not-tracked-org-post '())
    (dolist (html-file html-files)
      (setq short-filename (file-name-sans-extension (file-name-nondirectory html-file)))
      (progn
        (find-file html-file)
        (string-match "\\(^[^.-]*\\)-\\([^.-]*\\)-\\([^._]*\\)_\\([^.]*\\)" short-filename)
        (setq title-md5
              (match-string 2 short-filename)
              category
              (match-string 3 short-filename)
              keyword-list
              (match-string 4 short-filename))
        (setq post-meta (assoc title-md5 list-post-meta))
        (if post-meta
            ;; If related blog is found, update wordpress
            (progn
              (setq content-str (buffer-substring-no-properties (point-min) (point-max)))
              (goto-char (point-min))
              (setq description-str "")
              (if (search-forward-regexp "<hr/>" nil t)
                  (progn
                    (setq meta-start (point))
                    (when (search-forward-regexp "<hr/>" nil t)
                      (setq meta-end (point))
                      (setq description-str (buffer-substring-no-properties meta-start meta-end))

                      (setq content-str
                            (concat (buffer-substring-no-properties (point-min) meta-start)
                                    (buffer-substring-no-properties meta-end (point-max))
                                    ))

                      )
                    )
                )
              (setq
               post-id (nth (position post-meta list-post-meta) list-post-id)

               post-meta (cdr post-meta)
               post-title (car post-meta)
               post-meta (cdr post-meta)
               post-slug (car post-meta)
               post-meta (cdr post-meta)

               post-struct
               (list (cons "title" post-title)
                     (cons "authorName" "dennyzhang.com")
                     (cons "description" (modify_description description-str)) ;; digest
                     (cons "mt_keywords" (replace-regexp-in-string "_" "," keyword-list)) ;; tag
                     (cons "wp_slug" post-slug)
                     (cons "categories" (list category)) ;; category
                     (cons "mt_text_more" (modify_content content-str)) ;; Read more
                     ))
              ;; update post
              (xml-rpc-method-call wordpress-server-url 'metaWeblog.editPost post-id
                                   wordpress-username wordpress-pwd
                                   post-struct t)
              ;; update seo
              (update-post-seo (number-to-string post-id) post-meta)
              )
          (add-to-list 'not-tracked-org-post title-md5))
        (kill-buffer)))
    (if not-tracked-org-post
        (message (format "count of new posts:%d." (length not-tracked-org-post))))
    ;;(shell-command (format "rm -rf %s/*" html-dir))
    ))

(defun modify_description (str)
  ;; modify description before sending to worpress
  (let ((ret str))
    ;; remove hr
    (setq ret (replace-regexp-in-string "<hr/>" "" ret))
    )
  )

(defun modify_content (str)
  ;; modify content before sending to worpress
  (let ((ret str)
        
        )
    ;; remove PROPERTIES
    (setq ret (replace-regexp-in-string "<p>:PROPERTIES:\n.*\n:END:\n</p>" "" ret))
    ;; update link
    ;;(setq ret (replace-regexp-in-string "Author: dennyzhang.com" "Author: <a href='http://www.dennyzhang.com'>dennyzhang.com</a>" ret))
    (setq ret (replace-regexp-in-string "<p class=\"author\".*" "" ret))

    ;; update time description
    (setq ret (replace-regexp-in-string "<p class=\"date\">Time.*"
                                        (format-time-string
                                         "<p class=\"author\" align=\"right\">By <a href='http://www.dennyzhang.com'>Denny</a> %D</p>"
                                                            (current-time))
                                        ret))
    ;; remove title from content
    (setq ret (replace-regexp-in-string "<h1 class=\"title\">.*</h1>\n\n\n<br/>\n" "" ret))
    ;; remove DONE decorator
    (setq ret (replace-regexp-in-string "<span class=\"done DONE\"> DONE</span> " "" ret))
    (setq ret (replace-regexp-in-string "<p> <span class=\"timestamp-wrapper\"><span class=\"timestamp-kwd\">CLOSED.*\n</p>" "" ret))
    ;; remove hr
    ;;(setq ret (replace-regexp-in-string "<hr/>" "" ret))
    )
  )

(defun update-wordpress-current-entry ()
  (interactive)
  (let* ((current-top-entry-title (get-top-entry-title))
         (current-md5 (md5 current-top-entry-title))
         (old-buffer (current-buffer))
         (current-exported-dir (file-name-directory (buffer-file-name)))
         (short-filename (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
         (org-tag (org-get-tags))
         (category (car (delete BlOG-TAG org-tag)))
         (current-exported-filename
          (format "%s-%s-%s_%s.html" short-filename current-md5 category (org-entry-get nil "type")))
         current-post-meta
         ;;(old-list-post-meta list-post-meta)
         url-string)
    ;; delete old file, if it exists
    (if (file-exists-p current-exported-filename)
        (delete-file current-exported-filename))
    (org-export-as-html 3)
    (rename-file (format "%s.html" short-filename) current-exported-filename)
    (wash-html-for-wordpress-internal current-exported-filename)
    (setq current-post-meta (assoc current-md5 list-post-meta))
    (if current-post-meta
        (progn
          ;;(setq list-post-meta (list current-post-meta))
          (update-wordpress-blog current-exported-dir)
          ;;(setq list-post-meta old-list-post-meta)
          (setq url-string (format "http://www.dennyzhang.com/%s"
                                   (cadr (cdr current-post-meta))
                                   ))
          (kill-new url-string)
          (message url-string)
          (delete-file current-exported-filename)
          )
      (message "No related blog entry for %s" current-top-entry-title))
    (switch-to-buffer old-buffer)
    ))

(defun update-post-seo (post-id post-meta)
  (let* ((meta-title (car post-meta))
         (post-meta (cdr post-meta))

         (meta-description (car post-meta))
         (post-meta (cdr post-meta))

         (meta-keywords (car post-meta))
         (post-meta (cdr post-meta))

         field-list
         )

    ;; update seo of title
    (setq field-list '())
    (add-to-list 'field-list (list (make-symbol "post_id") post-id))
    (add-to-list 'field-list (list (make-symbol "meta_key") "_aioseop_title"))
    (add-to-list 'field-list (list (make-symbol "meta_value") meta-title))
    (http-post-simple mywordpress-updatemeta-url field-list)

    ;; update seo of description
    (setq field-list '())
    (add-to-list 'field-list (list (make-symbol "post_id") post-id))
    (add-to-list 'field-list (list (make-symbol "meta_key") "_aioseop_description"))
    (add-to-list 'field-list (list (make-symbol "meta_value") meta-description))
    (http-post-simple mywordpress-updatemeta-url field-list)

    ;; update seo of keywords
    (setq field-list '())
    (add-to-list 'field-list (list (make-symbol "post_id") post-id))
    (add-to-list 'field-list (list (make-symbol "meta_key") "_aioseop_keywords"))
    (add-to-list 'field-list (list (make-symbol "meta_value") meta-keywords))
    (http-post-simple mywordpress-updatemeta-url field-list)
    )
  )

;; --8<-------------------------- separator ------------------------>8--
(defun xml-rpc-value-to-xml-list (value)
  "Return XML representation of VALUE properly formatted for use with the \
functions in xml.el."
  (cond
                                        ; ((not value)
                                        ; nil)
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
;; --8<-------------------------- separator ------------------------>8--
;; File: org-publish-to-wordpress.el ends here
