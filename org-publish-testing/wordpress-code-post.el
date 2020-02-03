;;; package --- wordpress-code-post.el
;; File: wordpress-code-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:44>
;; --8<-------------------------- separator ------------------------>8--
(setq xml-rpc-allow-unicode-string nil)

(setq mywordpress-server-url "https://code.dennyzhang.com"
      mywordpress-updatemeta-url ""
      mywordpress-username "braindenny"
      BlOG-TAG "BLOG"
      POST-TAIL (concat "Connect with Denny In <a href='https://linkedin.com/in/dennyzhang001'>LinkedIn</a> Or <a href='https://goo.gl/cZ2Pev'>Slack</a>" google-adsense)
      ORG-CSS-FILE "https://cdn.dennyzhang.com/css/org.css"   
      mywordpress-pwd "sophia123")

(setq list-post-meta
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("b48f35d82cc3f1b52062bbac478b722f" "13164" "Leetcode: Minimum Domino Rotations For Equal Row"
         "minimum-domino-rotations-for-equal-row"
         "" "LeetCode LintCode")
        ))

(add-hook 'write-file-hooks 'code-update-template)
(defun code-update-template ()
  (if (string= (buffer-name) "wordpress-code-post.el")
      (dolist (item list-post-meta-new)
        (let ((code-dir "~/Dropbox/git_code/code.dennyzhang.com/problems")
              (current-post-name (car (nthcdr 3 item))))
          (setq current-post-dir (format "%s/%s" code-dir current-post-name)
                current-post-file (format "%s/README.org" current-post-dir)
                example-post-dir (format "%s/%s" code-dir "example"))
          ;; create the missing folder
          (unless (file-directory-p current-post-dir)
            (message (format "Create folder: %s" current-post-dir))
            (copy-directory example-post-dir current-post-dir)
          )
        )
    ))
  )
;; File: wordpress-code-post.el ends here
