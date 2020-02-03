;;; package --- wordpress-code-post.el
;; File: wordpress-code-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:44>
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat CONF-DENNY-EMACS "/org-publish/wordpress-code-post-old.el"))

(setq list-post-meta-new
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("0bb69e10051f7bc99c252a836a73f43b" "13378" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13380" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13382" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13384" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13386" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13388" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13390" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13392" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13394" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13396" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13398" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13400" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13402" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13402" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13404" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13406" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13408" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13410" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13412" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13414" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13416" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13418" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13420" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13422" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13424" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13426" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13427" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13433" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13435" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13437" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13440" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13442" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13444" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13447" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13449" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13451" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13453" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13456" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13458" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13460" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13462" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13464" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13466" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13468" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13470" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13472" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13474" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13476" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13478" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13480" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13482" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13484" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13486" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13490" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13500" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13502" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13504" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13506" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13508" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13510" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13512" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13514" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13516" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13518" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13520" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13522" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13524" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13526" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13528" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13530" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13532" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13534" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13536" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13538" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13540" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13542" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13544" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13546" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13548" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13550" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13552" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13554" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13556" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13558" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13560" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13562" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13564" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13566" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13568" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13570" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13572" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13574" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13576" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13578" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13580" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13582" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13584" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13586" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13588" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13590" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13592" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13594" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13596" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13598" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13600" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13602" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13604" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13606" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13608" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13610" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13612" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13614" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13616" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13618" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13620" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13622" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13624" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13626" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13628" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13630" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13632" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13634" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13636" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13638" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13640" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "13642" "Leetcode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ;;;;;;;;;;;;;; ----------------------------------------------------
        ("6856d3065a9e70c0e4cf2ab82ff88758" "13376" "Leetcode: Design Log Storage System" "design-log-storage-system"
         "" "LeetCode LintCode")

        ("4d92ed38db23e24722296bcc9a93b72b" "13374" "Leetcode: Average Selling Price" "average-selling-price"
         "" "LeetCode LintCode")

        ("439eebd42233e82f268ebe9ef662ab6c" "13372" "Leetcode: Tree Diameter" "tree-diameter"
         "" "LeetCode LintCode")

        ("af7674c660222530b0b1af68d5c01624" "13370" "Leetcode: Longest Absolute File Path" "longest-absolute-file-path"
         "" "LeetCode LintCode")

        ))

(nconc list-post-meta list-post-meta-new)

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
