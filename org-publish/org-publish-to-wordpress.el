;; -*- coding: utf-8 -*-
;; File: org-publish-to-wordpress.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-04-22 09:15:11>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq denny-linkedin-url "https://www.linkedin.com/in/dennyzhang001")
(setq denny-github-url "https://github.com/DennyZhang")
;; don't export the useless html validation link
(load-file (concat EMACS_VENDOR "http-post-simple/http-post-simple.el"))
(require 'http-post-simple)
(load-file (concat EMACS_VENDOR "org-publish/org-publish.el"))
;; (require 'org-publish) ;; TODO
(setq org-export-html-validation-link "")
;; (add-to-list 'org-export-language-setup '("cn" "Author" "Time" "Table Of Content" "Footnote")) ;; TODO
(setq org-export-default-language "cn")
;; --8<-------------------------- separator ------------------------>8--
;; TODO: workaround: org-mode support text coloring
;; https://www.mail-archive.com/emacs-orgmode@gnu.org/msg29988.html
(org-add-link-type
 "color" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<span style=\"background-color:#f9f2f4;color:%s;\">%s</span>" path desc))
    ((eq format 'latex)
     (format "{\\color{%s}%s}" path desc)))))

(org-add-link-type
 "github" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<script async defer src=\"https://buttons.github.io/buttons.js\"></script><a class=\"github-button\" href=\"https://github.com/%s\" data-show-count=\"true\" aria-label=\"%s on GitHub\" target=\"_blank\" rel=\"nofollow\">%s</a>" path desc desc)))))

(org-add-link-type
 "slack" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<a href=\"%s\" target=\"_blank\" rel=\"nofollow\"><img src=\"https://slack.dennyzhang.com/badge.svg\" alt=\"%s\"/></a>" "https://slack.dennyzhang.com" "slack")
     ;; (format "<a href=\"%s\" target=\"_blank\" rel=\"nofollow\"><img src=\"https://www.dennyzhang.com/badge.svg\" alt=\"%s\"/></a>" "https://www.dennyzhang.com/slack_group" "slack")
     ))))

;; [[image-blog:Bash -e Doesn't Exit As I expect][https://www.dennyzhang.com/wp-content/uploads/denny/bash_exit.png]]
(org-add-link-type
 "image-blog" nil
 (lambda (alt_text img_url format)
   (cond
    ((eq format 'html)
     (replace-regexp-in-string
      "alt=\".*\"" (format "alt=\"%s\"" alt_text)
      (format "<a href=\"my_blog_url_here\">%s</a>" img_url)
      )))))

;; [[image-linkedin:LinkedIn Code Check][https://www.dennyzhang.com/wp-content/uploads/denny/linkedin_codecheck.png]]
(org-add-link-type
 "image-linkedin" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<a href=\"%s\" target=\"_blank\" rel=\"nofollow\">%s</a>"
             denny-linkedin-url
             (replace-regexp-in-string
              "alt=\".*\"" (format "alt=\"%s\"" path)
              desc))))))

;; [[image-github:https://github.com/DennyZhang/monitor-docker-slack][https://www.dennyzhang.com/wp-content/uploads/denny/github_codecheck.png]]
(org-add-link-type
 "image-github" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<a href=\"%s\" target=\"_blank\" rel=\"nofollow\">%s</a>"
             path desc)))))

;; [[url-external:https://www.linkedin.com/feed/update/urn:li:activity:6282693138029043712][LinkedIn Code Check]]
;; path:
;; desc:
(org-add-link-type
 "url-external" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     ;; <a href="https://www.linkedin.com/feed/update/urn:li:activity:6282693138029043712">https://www.linkedin.com/feed/update/urn:li:activity:6282693138029043712</a>
     ;; https://www.linkedin.com/feed/update/urn:li:activity:6282693138029043712
     (setq url (replace-regexp-in-string "<a href=\"" "" path))
     (setq url (replace-regexp-in-string "\".*" "" url))
     (format "<a href=\"%s\" target=\"_blank\" rel=\"nofollow\">%s</a>" url desc)))))

;; --8<-------------------------- separator ------------------------>8--
(require 'weblogger)

;; --8<-------------------------- separator ------------------------>8--
;; Change footnotes format
(setq org-html-footnotes-section "<div id=\"footnotes\">
<p class=\"footnotes\">%s: </p>
<div id=\"text-footnotes\" style=\"font-size:14px\">
%s
</div>
</div>")
;; Remove html sup
(setq org-html-footnote-format "%s")
(setq org-footnote-section "Footnotes:")

;; Hacky way to modify source code directly
;; From: 1 www.gnu.org/software/bash/manual/bashref.html#The-Set-Builtin
;; To: [1] www.gnu.org/software/bash/manual/bashref.html#The-Set-Builtin
(defun org-html--anchor (&optional id desc attributes)
  "Format a HTML anchor."
  (let* ((name (and org-html-allow-name-attribute-in-anchors id))
         (attributes (concat (and id (format " id=\"%s\"" id))
                             (and name (format " name=\"%s\"" name))
                             attributes)))
    (format "<a%s>[%s]</a>" attributes (or desc ""))))

(defun org-html-paragraph (paragraph contents info)
  "Transcode a PARAGRAPH element from Org to HTML.
CONTENTS is the contents of the paragraph, as a string. INFO is
the plist used as a communication channel."
  (let* ((parent (org-export-get-parent paragraph))
         (parent-type (org-element-type parent))
         (style '((footnote-definition " class=\"footpara\"")))
         (extra (or (cadr (assoc parent-type style)) "")))
    (cond
     ((and (eq (org-element-type parent) 'item)
           (= (org-element-property :begin paragraph)
              (org-element-property :contents-begin parent)))
      ;; Leading paragraph in a list item have no tags.
      contents)
     ((org-html-standalone-image-p paragraph info)
      ;; Standalone image.
      (let ((caption
             (let ((raw (org-export-data
                         (org-export-get-caption paragraph) info))
                   (org-html-standalone-image-predicate
                    'org-html--has-caption-p))
               (if (not (org-string-nw-p raw)) raw
                 (concat
                  "<span class=\"figure-number\">"
                  (format (org-html--translate "Figure %d:" info)
                          (org-export-get-ordinal
                           (org-element-map paragraph 'link
                             'identity info t)
                           info nil 'org-html-standalone-image-p))
                  "</span> " raw))))
            (label (org-element-property :name paragraph)))
        (org-html--wrap-image contents info caption label)))
     ;; Regular paragraph.
     ;; (t (format "<p%s>\n%s</p>" extra contents)))))
     (t (format "\n%s" contents)))))
;; --8<-------------------------- separator ------------------------>8--
;; Whether current article is a page or a normal blog post
(defun article_type_by_fname(filename)
  (if (string-match ".*-Page_.*" filename)
      "PAGE" "POST"))

(defun modify_description (str blog-uri)
  ;; modify description before sending to worpress
  (let ((ret str))
    ;; remove hr
    (setq ret (replace-regexp-in-string "<hr/>" "" ret))
    ;; add http link for image
    (setq ret (replace-regexp-in-string
               "my_blog_url_here"
               (format "%s/%s" mywordpress-server-url blog-uri) ret))
    ))

(defun modify_content (str blog-uri blog-type)
  ;; modify content before sending to worpress
  (let ((ret str))
    ;; remove PROPERTIES
    (setq ret (replace-regexp-in-string "<p>:PROPERTIES:\n.*\n:END:\n</p>" "" ret))
    ;; update link
    (setq ret (replace-regexp-in-string "<p class=\"author\".*" "" ret))
    (setq ret (replace-regexp-in-string "<p class=\"date\".*" "" ret))
    (setq ret (replace-regexp-in-string "<p class=\"validation\".*" "" ret))

    ;; remove title from content
    (setq ret (replace-regexp-in-string "<h1 class=\"title\">.*</h1>\n.*\n.*\n.*\n.*\n" "" ret))
    ;; remove DONE decorator
    (setq ret (replace-regexp-in-string "<span class=\"done DONE\"> DONE</span> " "" ret))
    (setq ret (replace-regexp-in-string "<p> <span class=\"timestamp-wrapper\"><span class=\"timestamp-kwd\">CLOSED.*\n</p>" "" ret))
    ;; remove empty h3 at the bottom
    (setq ret (replace-regexp-in-string "<h3 id=\"sec-[0-9]+-[0-9]+\"></h3>" "" ret))
    ;; remove unnecessary content
    (setq ret (replace-regexp-in-string "<p class=\"author\".*</p>" "" ret))
    (setq ret (replace-regexp-in-string "<p class=\"date\".*</p>" "" ret))
    (setq ret (replace-regexp-in-string "<p class=\"validation\".*</p>" "" ret))

    ;; add blog tail

    (if (string= blog-type "POST")
        (setq my-blog-tail blog-tail)
      (setq my-blog-tail ""))

    ;; TODO: better way
    (setq ret (replace-regexp-in-string
               "</div>\n</div></div>\n<div id=\"postamble.*\n\n\n\n</div>\n<br/></body>"
               my-blog-tail ret))

    (setq ret (replace-regexp-in-string
               "</div>\n</div>\n</div>\n<div id=\"postamble.*\n\n\n\n</div>\n<br/></body>"
               my-blog-tail ret))

    (when (string= blog-type "POST")
      ;; add post link
      (setq ret (format "%sOriginal URL: <a href=\"%s/%s/\">%s/%s</a><br/><br/>%s"
                        ret mywordpress-server-url blog-uri
                        (replace-regexp-in-string "www." "" mywordpress-server-url)
                        blog-uri 
                        POST-TAIL
                        ))
      )
    (setq ret (replace-regexp-in-string
               "my_blog_url_here"
               (format "%s/%s" mywordpress-server-url blog-uri) ret))
    ;; insert css
    ;; https://stackoverflow.com/questions/32759272/how-to-load-css-asynchronously
    ;; (format "%s<link rel='stylesheet' type='text/css' href='https://www.dennyzhang.com/wp-content/uploads/org.css' media=\"none\" onload=\"if(media!='all')media='all'\">" ret)
    (format "%s<link rel='stylesheet' type='text/css' href='https://cdn.dennyzhang.com/css/org.css' media=\"none\" onload=\"if(media!='all')media='all'\">" ret)    
    )
  )

;; --8<-------------------------- separator ------------------------>8--
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
(setq org-publish-project-alist
      '(
        ("org-share"
         ;; Remove hard code
         :base-directory "~/backup/essential/Dropbox/private_data/emacs_stuff/emacs_data/org_data/org_share/"
         :publishing-directory "~/org_publish/publish_html/"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-website
         :headline-levels 4
         :auto-preamble t
         )
        ("org-index"
         :base-directory "~/backup/essential/Dropbox/private_data/emacs_stuff/emacs_data/org_data/org_share/" ;; Remove hard code
         :publishing-directory "~/org_publish/publish_html/"
         :base-extension "index"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :auto-preamble t
         )
        ("publish" :components ("org-share" "org-index"))
        ))
;; --8<-------------------------- separator ------------------------>8--

(defun update-post-seo (post-id post-title post-meta)
  (let* ((meta-description (car post-meta))
         (post-meta (cdr post-meta))
         (meta-keywords (car post-meta))
         field-list
         )

    ;; Yoast SEO
    ;; get first keyword as Yoast focus word
    (setq focus-keyword (car (split-string meta-keywords " ")))
    ;; update seo of title
    (setq field-list '())
    (add-to-list 'field-list (list (make-symbol "post_id") post-id))
    (add-to-list 'field-list (list (make-symbol "meta_key") "_yoast_wpseo_title"))
    (add-to-list 'field-list (list (make-symbol "meta_value") post-title))
    ;; TODO report exceptions or update failed
    (http-post-simple mywordpress-updatemeta-url field-list)

    ;; update seo of description
    (setq field-list '())
    (add-to-list 'field-list (list (make-symbol "post_id") post-id))
    (add-to-list 'field-list (list (make-symbol "meta_key") "_yoast_wpseo_metadesc"))
    (add-to-list 'field-list (list (make-symbol "meta_value") meta-description))
    (http-post-simple mywordpress-updatemeta-url field-list)

    ;; focus keyword
    (setq field-list '())
    (add-to-list 'field-list (list (make-symbol "post_id") post-id))
    (add-to-list 'field-list (list (make-symbol "meta_key") "_yoast_wpseo_focuskw"))
    (add-to-list 'field-list (list (make-symbol "meta_value") focus-keyword))
    (http-post-simple mywordpress-updatemeta-url field-list)

    )
  )
;; --8<-------------------------- separator ------------------------>8--
(defun devops-update-wordpress-current-entry ()
  (interactive)
  (progn
    (load-file (concat DENNY_EMACS "/org-publish/wordpress-devops-post.el"))
    (setq blog-tail "<hr/>")
    (update-wordpress-current-entry)
    )
  )

(defun brain-update-wordpress-current-entry ()
  (interactive)
  (progn
    (load-file (concat DENNY_EMACS "/org-publish/wordpress-code-post.el"))
    (setq blog-tail "<hr/>")

    ;; TODO: use list to reduce code duplication
    (goto-char (point-min))
    (while (re-search-forward "，" nil t) (replace-match ","))

    (goto-char (point-min))
    (while (re-search-forward "。" nil t) (replace-match "."))

    (goto-char (point-min))
    (while (re-search-forward "；" nil t) (replace-match ";"))

    (goto-char (point-min))
    (while (re-search-forward "—" nil t) (replace-match "-"))

    (goto-char (point-min))
    (while (re-search-forward "、" nil t) (replace-match "`"))

    (goto-char (point-min))
    (while (re-search-forward "‘" nil t) (replace-match "'"))

    (goto-char (point-min))
    (while (re-search-forward "’" nil t) (replace-match "'"))

    (goto-char (point-min))
    (while (re-search-forward "“" nil t) (replace-match "\""))

    (goto-char (point-min))
    (while (re-search-forward "”" nil t) (replace-match "\""))

    (update-wordpress-current-entry)
    )
  )

(defun architect-update-wordpress-current-entry ()
  (interactive)
  (progn
    (load-file (concat DENNY_EMACS "/org-publish/wordpress-architect-post.el"))
    (setq blog-tail "<hr/>")
    (update-wordpress-current-entry)
    )
  )

(defun cheatsheet-update-wordpress-current-entry ()
  (interactive)
  (progn
    (load-file (concat DENNY_EMACS "/org-publish/wordpress-cheatsheet-post.el"))
    (setq blog-tail "<hr/>")
    (update-wordpress-current-entry)
    )
  )

(defun tax-update-wordpress-current-entry ()
  (interactive)
  (progn
    (load-file (concat DENNY_EMACS "/org-publish/wordpress-tax-post.el"))
    (setq blog-tail "<hr/>Check our <a href='http://www.usashui.com/popular/'>popular</a> posts?

[mc4wp_form id='52']
")
    (update-wordpress-current-entry)
    )
  )
(defun update-wordpress-current-entry ()
  ;;(interactive)
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
    (save-excursion
      ;; remove anything after separator
      (org-show-subtree)
      (setq separator
            "\*\* ---------------------------------------------------------------------")
      (goto-char (point-max))
      (if (search-backward-regexp separator nil t)
          (progn
            (move-beginning-of-line nil)
            (narrow-to-region (point-min) (point))))
      ;;(org-export-as-html 3)
      (org-html-export-to-html)
      )
    (rename-file (format "%s.html" short-filename) current-exported-filename)
    (wash-html-for-wordpress-internal current-exported-filename)
    (setq current-post (assoc current-md5 list-post-meta))
    (setq blog-uri (cadr (cdr (cdr current-post))))
    (if current-post
        (progn
          (update-wordpress-blog-internal current-exported-filename)
          (setq url-string (format "%s/%s" mywordpress-server-url blog-uri))
          (kill-new url-string)
          (message url-string)
          (delete-file current-exported-filename)
          )
      (message "No related blog entry for %s" current-top-entry-title))
    (save-excursion
      (switch-to-buffer old-buffer)
      ;;(widen)
      )
    ))

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
    (goto-char (point-min))
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
    (while (search-forward-regexp "</div>

<ul class=\"org-ul\">
" nil t)
      (replace-match "<!--more-->
<ul class=\"org-ul\">
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
(defun update-wordpress-blog-internal (html-file)
  (interactive)
  (let ((wordpress-server-url (concat mywordpress-server-url "/xmlrpc_denny.php"))
        (wordpress-username mywordpress-username)
        (wordpress-pwd mywordpress-pwd)
        short-filename
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

    (setq not-tracked-org-post '())
    (progn
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
        (setq current-post (assoc title-md5 list-post-meta))
        (if current-post
            ;; If related blog is found, update wordpress
            (progn
              (setq content-str
                    (buffer-substring-no-properties (point-min) (point-max)))
              (goto-char (point-min))
              (setq description-str "")
              (if (search-forward-regexp "<hr +/>" nil t)
                  (progn
                    (setq meta-start (point))
                    (when (search-forward-regexp "<hr +/>" nil t)
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
               current-post (cdr current-post)

               post-id (car current-post)
               current-post (cdr current-post)

               post-title (car current-post)
               current-post (cdr current-post)

               blog-uri (car current-post)
               current-post (cdr current-post))

              (setq post-struct
                    (list (cons "wp_slug" blog-uri) ;; uri
                          (cons "title" post-title)
                          (cons "authorName" "dennyzhang.com")
                          (cons "description" (modify_description description-str blog-uri)) ;; digest
                          (cons "mt_keywords" (replace-regexp-in-string "_" "," keyword-list)) ;; tag
                          (cons "categories" (list category)) ;; category
                          (cons "mt_text_more" 
                                (modify_content content-str blog-uri 
                                                (article_type_by_fname html-file))) ;; Read more
                          ))
              (xml-rpc-method-call wordpress-server-url 'metaWeblog.editPost post-id
                                   wordpress-username wordpress-pwd
                                   post-struct t)
              ;; update seo
              (unless (string= mywordpress-updatemeta-url "")
                (update-post-seo post-id post-title current-post))
              )
          (add-to-list 'not-tracked-org-post title-md5))
        (kill-buffer)))
    (if not-tracked-org-post
        (message (format "count of new posts:%d." (length not-tracked-org-post))))
    ))
;; --8<-------------------------- separator ------------------------>8--
;; File: org-publish-to-wordpress.el ends here
