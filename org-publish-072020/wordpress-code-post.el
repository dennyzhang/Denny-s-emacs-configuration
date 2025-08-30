;;; package --- wordpress-code-post.el
;; File: wordpress-code-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-07-25 15:50:36>
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat CONF-DENNY-EMACS "/org-publish/wordpress-code-post-old.el"))

(setq list-post-meta-new
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("0bb69e10051f7bc99c252a836a73f43b" "3598" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19955" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19957" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19959" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19961" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19963" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19965" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19967" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19969" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19971" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19973" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19975" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19977" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19979" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19981" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19983" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19985" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19987" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19989" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19991" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19993" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19995" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19997" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19999" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20001" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20003" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20005" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20007" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20009" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20011" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20013" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20015" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20017" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20019" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20021" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20023" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20025" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20027" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20029" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20031" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20035" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20037" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20039" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20041" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20043" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20045" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20047" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20049" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20051" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "20053" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19823" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19821" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19819" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19817" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19815" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19813" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19811" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19809" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19807" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19805" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19803" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19801" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19799" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19340" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19342" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19344" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19346" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19348" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19350" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19352" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19354" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19356" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19358" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19360" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19362" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19364" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19366" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19368" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19370" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19372" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19374" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19376" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19380" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19382" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19384" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19386" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19390" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19392" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19394" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19396" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19398" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19400" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ;;;;;;;;;;;;;; ----------------------------------------------------
        ("b34961aea81c122a5bfee8312c04eb04" "19953" "LeetCode: Average Salary Excluding the Minimum and Maximum Salary"
         "average-salary-excluding-the-minimum-and-maximum-salary"
         "" "LeetCode LintCode")

        ("70ac9436900d0c708cfed3796885ea79" "19945" "LeetCode: Running Sum of 1d Array" "running-sum-of-1d-array"
         "" "LeetCode LintCode")

        ("e00e2584743afdbfd97371a0e17b8094" "19947" "LeetCode: Least Number of Unique Integers after K Removals"
         "least-number-of-unique-integers-after-k-removals"
         "" "LeetCode LintCode")

        ("edb2d1223c4322eec73f6dd7531517b5" "19949" "LeetCode: Majority Element II" "minimum-number-of-days-to-make-m-bouquets"
         "" "LeetCode LintCode")

        ("8824497c7f7854f54e0c1c080fd1f7db" "19951" "LeetCode: Kth Ancestor of a Tree Node" "kth-ancestor-of-a-tree-node"
         "" "LeetCode LintCode")

        ("d63116ab9d782ecb4b80dfbd03a93fcb" "19943" "LeetCode: Check If a String Contains All Binary Codes of Size K"
         "check-if-a-string-contains-all-binary-codes-of-size-k"
         "" "LeetCode LintCode")

        ("6b91633a29414525adafcead10c0ba25" "19927" "LeetCode: Find All The Lonely Nodes" "find-all-the-lonely-nodes"
         "" "LeetCode LintCode")

        ("b25bb198690cfcbb484a4c6c16e1725b" "19929" "LeetCode: Calculate Salaries" "calculate-salarieso"
         "" "LeetCode LintCode")

        ("1d8f382d9319589eef1f60c024aa39aa" "19931" "LeetCode: Rectangles Area" "rectangles-area"
         "" "LeetCode LintCode")

        ("6ac9090985f26c8c7fbe50bd35a8b1e6" "19933" "LeetCode: Make Two Arrays Equal by Reversing Sub-arrays"
         "make-two-arrays-equal-by-reversing-sub-arrays"
         "" "LeetCode LintCode")

        ("13602d41ba208cf40b1aed48217dd4f9" "19935" "LeetCode: Paint House III" "paint-house-iii"
         "" "LeetCode LintCode")

        ("13a018875f0581c06b32ad06c09a05e6" "19937" "LeetCode: Design Browser History" "design-browser-history"
         "" "LeetCode LintCode")

        ("6201f52e0365dba4795fd7ca5c4818fc" "19939" "LeetCode: The k Strongest Values in an Array"
         "the-k-strongest-values-in-an-array"
         "" "LeetCode LintCode")

        ("83759592ccaed2f5cea9251c42f998bf" "19941" "LeetCode: Shuffle the Array" "shuffle-the-array"
         "" "LeetCode LintCode")

        ("e996a5e265ca7c28653b8d34f0b8406c" "19919" "LeetCode: Check If a Word Occurs As a Prefix of Any Word in a Sentence"
         "check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence"
         "" "LeetCode LintCode")

        ("12b76b3ed6f499ee02fc272ad3184d99" "19921" "LeetCode: Maximum Number of Vowels in a Substring of Given Length"
         "maximum-number-of-vowels-in-a-substring-of-given-length"
         "" "LeetCode LintCode")

        ("d21ab325ffd1b62198ecc0fe01a46204" "19923" "LeetCode: Pseudo-Palindromic Paths in a Binary Tree"
         "pseudo-palindromic-paths-in-a-binary-tree"
         "" "LeetCode LintCode")

        ("4b98cbb080056444333dcfd75481600a" "19925" "LeetCode: Max Dot Product of Two Subsequences"
         "max-dot-product-of-two-subsequences"
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
