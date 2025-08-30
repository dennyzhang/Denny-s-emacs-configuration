;;; package --- wordpress-code-post.el
;; File: wordpress-code-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-04-23 11:18:26>
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat CONF-DENNY-EMACS "/org-publish/wordpress-code-post-old.el"))

(setq list-post-meta-new
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("0bb69e10051f7bc99c252a836a73f43b" "19300" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19302" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19304" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19306" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19308" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19310" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19312" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19314" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19316" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19318" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19320" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19322" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19324" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19326" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19328" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19330" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19332" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19334" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19336" "LeetCode: Majority Element II" "majority-element-ii"
         "" "LeetCode LintCode")

        ("0bb69e10051f7bc99c252a836a73f43b" "19338" "LeetCode: Majority Element II" "majority-element-ii"
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
        ("769f366512f6c1ef43c50d4aeda48c1c" "19296" "LeetCode: NPV Queries" "npv-queries"
         "" "LeetCode LintCode")

        ("b03ddd824364d6cb4314f8e67af1bb9f" "19292" "LeetCode: Find the Minimum Number of Fibonacci Numbers Whose Sum Is K"
         "find-the-minimum-number-of-fibonacci-numbers-whose-sum-is-k"
         "" "LeetCode LintCode")

        ("5dc9c5681cc34ba832f7ea2c1556c39d" "19294" "LeetCode: The k-th Lexicographical String of All Happy Strings of Length n"
         "the-k-th-lexicographical-string-of-all-happy-strings-of-length-n"
         "" "LeetCode LintCode")

        ("a9e1870814f91526b675e6a74e0b9f9b" "19290" "LeetCode: Minimum Value to Get Positive Step by Step Sum"
         "minimum-value-to-get-positive-step-by-step-sum"
         "" "LeetCode LintCode")

        ("c0f2ba4c7aaacff061368cbde2714e9e" "19280" "LeetCode: Reformat The String" "reformat-the-string"
         "" "LeetCode LintCode")

        ("9c51ff8cd94daceccd94d416c9b45e77" "19282" "LeetCode: Display Table of Food Orders in a Restaurant"
         "display-table-of-food-orders-in-a-restaurant"
         "" "LeetCode LintCode")

        ("abed8de610438b237da79581eecade64" "19284"
         "LeetCode: Minimum Number of Frogs Croaking" "minimum-number-of-frogs-croaking"
         "" "LeetCode LintCode")

        ("59b7039c9daaa5c0815f38e7374d4654" "19286"
         "LeetCode: Build Array Where You Can Find The Maximum Exactly K Comparisons" "build-array-where-you-can-find-the-maximum-exactly-k-comparisons"
         "" "LeetCode LintCode")

        ("621b8c6cda455bc1187c661ae0187dcc" "19278" "LeetCode: Find the Quiet Students in All Exams" "find-the-quiet-students-in-all-exams"
         "" "LeetCode LintCode")

        ("900c82cf25c786287a28f0e70ec8a0ed" "19274" "LeetCode: Number of Ways to Paint N x 3 Grid" "number-of-ways-to-paint-n-3-grid"
         "" "LeetCode LintCode")

        ("c61ea2c7e43d5baaa0a127360a276ae0" "19272" "LeetCode: The Maze III" "the-maze-iii"
         "" "LeetCode LintCode")

        ("6f0229222f3c89291de841354ec6080b" "19270" "LeetCode: Top Travellers" "top-travellers"
         "" "LeetCode LintCode")

        ("1076f6b56eb89672e9ca3566b5df2e3b" "19268" "LeetCode: K-Concatenation Maximum Sum" "k-concatenation-maximum-sum"
         "" "LeetCode LintCode")

        ("60d27b0a5992d2c43b164d97af74a95c" "19260" "LeetCode: Number of Steps to Reduce a Number in Binary Representation to One"
         "number-of-steps-to-reduce-a-number-in-binary-representation-to-one"
         "" "LeetCode LintCode")

        ("42f7ab3fda205475140804f87e38ce9c" "19262" "LeetCode: Longest Happy String" "longest-happy-string"
         "" "LeetCode LintCode")

        ("8786f64ba326c5e35ea6a2557f60f950" "19256" "LeetCode: Reducing Dishes" "reducing-dishes"
         "" "LeetCode LintCode")

        ("4d8eea54c4ad6257e1b3f4c46f2c0633" "19266" "LeetCode: Number of Submatrices That Sum to Target" "number-of-submatrices-that-sum-to-target"
         "" "LeetCode LintCode")

        ("fe09180ceebd8e7106c09bdea26127f5" "19254" "LeetCode: Circle and Rectangle Overlapping"
         "circle-and-rectangle-overlapping"
         "" "LeetCode LintCode")

        ("58b025e57b6745746dd15cd0022915f4" "19264" "LeetCode: Stone Game III" "stone-game-iii"
         "" "LeetCode LintCode")

        ("22d245ff547c3cd3dc4a5ca48c6844e3" "19258" "LeetCode: Minimum Subsequence in Non-Increasing Order"
         "minimum-subsequence-in-non-increasing-order"
         "" "LeetCode LintCode")

        ("c09d19a7cf3f9b03fd600a8ffd7f7d16" "19250" "LeetCode: Count Largest Group" "count-largest-group"
         "" "LeetCode LintCode")

        ("537ea562156f9bb72c9608bd67f606e6" "19252" "LeetCode: Construct K Palindrome Strings" "construct-k-palindrome-strings"
         "" "LeetCode LintCode")

        ("34092422fbffc9b95a764aca3c0db8c1" "19248" "LeetCode: Customers Who Bought Products A and B but Not C"
         "customers-who-bought-products-a-and-b-but-not-c"
         "" "LeetCode LintCode")

        ("0a4257d9e025f36f1546d4904dba6388" "13184" "LeetCode: Minimum Time to Build Blocks" "minimum-time-to-build-blocks"
         "" "LeetCode LintCode")

        ("7b01752f81481ba7a8565df5a7ffc6e6" "19246" "LeetCode: Find All Good Strings" "find-all-good-strings"
         "" "LeetCode LintCode")

        ("f6c3a461a751284f8afcc597f112bb15" "19244" "LeetCode: Longest Happy Prefix" "longest-happy-prefix"
         "" "LeetCode LintCode")

        ("00e8ce6b2e882f695e694901948a416a" "19240" "LeetCode: Maximum Vacation Days" "maximum-vacation-days"
         "" "LeetCode LintCode")

        ("b93c46e17937358aecb4b43f69b0ca55" "19238" "LeetCode: Design Underground System" "design-underground-system"
         "" "LeetCode LintCode")

        ("480dbc9842506aacfb830ca6ddbd5955" "19236" "LeetCode: Count Number of Teams" "count-number-of-teams"
         "" "LeetCode LintCode")

        ("44a6cf5cb2938d839be6956bffdc0469" "19234" "LeetCode: Find Lucky Integer in an Array" "find-lucky-integer-in-an-array"
         "" "LeetCode LintCode")

        ("343ea9dcc2bd6fc7617d2d1c66d72d1e" "19232" "LeetCode: Total Sales Amount by Year" "total-sales-amount-by-year"
         "" "LeetCode LintCode")

        ("2ee606a47783e83f5db5349ea5fc6786" "19230" "LeetCode: Capital Gain/Loss" "capital-gainloss"
         "" "LeetCode LintCode")

        ("c762758a8ea65f9465fd5d0a8075d326" "19228" "LeetCode: Reorder Data in Log Files" "reorder-data-in-log-files"
         "" "LeetCode LintCode")

        ("ca07fe61e1e8f02eecee2163660d1bed" "19226"
         "LeetCode: Find a Corresponding Node of a Binary Tree in a Clone of That Tree"
         "find-a-corresponding-node-of-a-binary-tree-in-a-clone-of-that-tree"
         "" "LeetCode LintCode")

        ("50a894d98a4727093c3199311aab5874" "19224" "LeetCode: Replace Employee ID With The Unique Identifier" 
         "replace-employee-id-with-the-unique-identifier"
         "" "LeetCode LintCode")

        ("e089daae8da6726e9e612f756349ecc7" "19220" "LeetCode: Number of Trusted Contacts of a Customer" 
         "number-of-trusted-contacts-of-a-customer"
         "" "LeetCode LintCode")

        ("9a07806f4dbe8be9cac261c940e62112" "19222" "LeetCode: Get the Second Most Recent Activity"
         "get-the-second-most-recent-activity"
         "" "LeetCode LintCode")

        ("df90bb0c798b76a5105a4619c88498fa" "19218" "LeetCode: Count All Valid Pickup and Delivery Options"
         "count-all-valid-pickup-and-delivery-options"
         "" "LeetCode LintCode")

        ("a9ce9a76d5cd9bf4e23feca8adce509b" "19216" "LeetCode: Number of Days Between Two Dates" "number-of-days-between-two-dates"
         "" "LeetCode LintCode")

        ("ceb837d0f59573897eb1b38fdb4ec185" "19214" "LeetCode: Activity Participants" "activity-participants"
         "" "LeetCode LintCode")

        ("cabe8bfc975099481bf9f9f2e15d9289" "19212" "LeetCode: Number of Substrings Containing All Three Characters" 
         "number-of-substrings-containing-all-three-characters"
         "" "LeetCode LintCode")

        ("c2837261adb17ab8aeca92809a878961" "19208" "LeetCode: Sort Integers by The Number of 1 Bits"
         "sort-integers-by-the-number-of-1-bits"
         "" "LeetCode LintCode")

        ("b1bfbd5c0dd8608d69197cdce913bccc" "19210" "LeetCode: Apply Discount Every n Orders" "apply-discount-every-n-orders"
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
