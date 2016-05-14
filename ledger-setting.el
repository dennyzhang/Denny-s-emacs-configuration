;; -*- coding: utf-8 -*-
;; File: ledger-setting.el --- ledger configuration, especially comunication with rdaccount
;;
;; Author: Denny(denny.zhang001@gmail.com)
;;
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2016-05-14 14:38:16>
;;
;; --8<-------------------------- separator ------------------------>8--
(defun ledger-generate-accounts-sql-call()
  "parse all accounts from ledger file, and generate sql
statement for insertion to sqlite db"
  (interactive)
  (with-current-buffer
    (let ((output-buffername "*ledger http*")
          asset-accounts expenses-accounts incoming-accounts)
      ;; clean output buffer
      (set-buffer (get-buffer-create output-buffername))
      (erase-buffer)
      ;; find all accounts from ledger file
      (find-file (concat DENNY_EMACS "/bank/filebat.ledger"))
      (ledger-find-accounts)
      ;; set output buffer
      (delete-other-windows) ;; bury other window
      (split-window-vertically) ;; split window vertically
      ;; switch to window for HTTP output
      (pop-to-buffer (get-buffer-create output-buffername))
      (goto-char (point-max))
      ;; obtain accounts
      (pop ledger-account-tree)
      (setq asset-accounts (pop ledger-account-tree))
      (setq expenses-accounts (pop ledger-account-tree))
      (setq incoming-accounts (pop ledger-account-tree))
      ;; generate http post request string
      (generate-http-insert-account-command asset-accounts "" "资产")
      (generate-http-insert-account-command expenses-accounts "" "开支")
      (generate-http-insert-account-command incoming-accounts "" "收入")
      )))

(defun generate-http-insert-account-command (account-list account-name-prefix account-type)
  (let (account-name account-list-tmp)
    (setq account-name (pop account-list))
    (pop account-list)
    (unless (string= account-name-prefix "")
      (setq account-name (format "%s:%s" account-name-prefix account-name)))
    ;; insert account account
    ;;(insert (format "(http-post-simple \"http://127.0.0.1:3000/account/create\" '((username . \"denny\")(password . \"$pwd\")(accountname . \"%s\") (accounttype . \"%s\")))\n" account-name account-type))
    (unless (member account-name '("assets" "incoming" "expenses"))
      (insert (format
               "sqlite3 ./development_denny.db 'insert into accounts(accountname, accounttype) values (\"%s\", \"%s\")'\n"
               account-name account-type)))
    ;; check whether it has child accounts
    (while account-list
      (setq account-list-tmp (pop account-list))
      (generate-http-insert-account-command account-list-tmp account-name account-type))))
;; --8<-------------------------- separator ------------------------>8--
(defun ledger-transactions (&optional record-date ledger-file-name)
  "Parse transactions from ledger file.
 Return value is a list of vector(fromaccountname, toaccountname, amount, recorddate, memo)

 If record-date is given, just obtain transactions of the specific day.
 Otherwise, obtain transactions of all days in the ledger buffer
 "
  (let ((ledger-buffer (concat DENNY_EMACS "/bank/filebat.ledger"))
        date-list match-regexp
        start-point end-point
        fromaccountname toaccountname amount recorddate memo
        (transaction-list '())
        )

    ;; handle the optional parameters
    (if record-date
        (add-to-list 'date-list record-date)
      (dolist (x (number-sequence -6 0 1))
        (add-to-list 'date-list
                     (format-time-string "%Y-%m-%d" (time-add (current-time) (days-to-time x))))))

    (if ledger-file-name
        (setq ledger-buffer ledger-file-name))

    ;; switch to the ledger buffer
    (find-file ledger-buffer)
    (save-excursion
      (dolist (record-date date-list)
        (setq match-regexp
              (format "\\(^%s\\) +. +\\(.*$\\)\n [a-z]+:\\([^ ]*\\) *\\(.*\\)\n [a-z]+:\\([^ \n]*\\)" record-date))
        ;; get bound for the search
        (goto-char (point-min))
        (while (re-search-forward match-regexp nil t)
          (setq
           fromaccountname (buffer-substring-no-properties (match-beginning 5) (match-end 5))
           toaccountname (buffer-substring-no-properties (match-beginning 3) (match-end 3))
           amount (buffer-substring-no-properties (match-beginning 4) (match-end 4))
           recorddate (buffer-substring-no-properties (match-beginning 1) (match-end 1))
           memo (buffer-substring-no-properties (match-beginning 2) (match-end 2)))
          (add-to-list 'transaction-list
                       (vector 'entry fromaccountname toaccountname amount recorddate memo))
          ))
      ;; return the result
      transaction-list
      )
    )
  )
;; --8<-------------------------- separator ------------------------>8--
(defun rdaccount-transactions (http-username http-password &optional record-date)
  "get rdaccount transactions.
 Return value is a list of vector(fromaccountname, toaccountname, amount, recorddate, memo)

 If record-date is given, just obtain transactions of the specific day.
 Otherwise, obtain transactions of all days in the ledger buffer
 "
  (let (fromaccountname toaccountname amount recorddate memo
                        field-list request-result values data header status
                        (url "http://www.matoushan.co.cc/transaction/show")
                        (transaction-list '())
                        (output-buffername "*ledger http*")
                        xml-root-node
                        date-list
                        )
    ;; handle the optional parameters
    (if record-date
        (add-to-list 'date-list record-date)
      (dolist (x (number-sequence -6 0 1))
        (add-to-list 'date-list
                     (format-time-string "%Y-%m-%d" (time-add (current-time) (days-to-time x))))))

    ;; prepare buffer
    (set-buffer (get-buffer-create output-buffername))

    (dolist (record-date date-list)
      ;; set fields for http rest webservice call
      (setq field-list '())
      (add-to-list 'field-list (list (make-symbol "username") http-username))
      (add-to-list 'field-list (list (make-symbol "password") http-password))
      (add-to-list 'field-list (list (make-symbol "from_date") record-date))
      (add-to-list 'field-list (list (make-symbol "end_date") record-date))
      (add-to-list 'field-list (list (make-symbol "num_item") "65535"));;retrieve all records
      ;; send http request
      (setq request-result (http-post-simple-internal
                            url (http-post-encode-fields field-list nil) nil
                            `(("Content-Type" . ,(http-post-content-type
                                                  "application/x-www-form-urlencoded"
                                                  nil)))))
      (setq values (pop request-result)
            data (pop request-result)
            header (pop request-result)
            status (pop request-result))

      ;; parse the records
      (unless (= header 200)
        (error (format "Error to retrieve from %s. status:%s\nheader:%s\ndata:%s"
                       url status header data)))
      ;; decode
      (erase-buffer)
      (insert values)
      (setq xml-root-node (car (xml-parse-region (point-min) (point-max))))
      (dolist (entry-node (xml-get-children xml-root-node 'entry))
        (setq fromaccountname (car (xml-node-children (car (xml-get-children entry-node 'fromaccountname))))
              toaccountname (car (xml-node-children (car (xml-get-children entry-node 'toaccountname))))
              amount (car (xml-node-children (car (xml-get-children entry-node 'amount))))
              recorddate (car (xml-node-children (car (xml-get-children entry-node 'recorddate))))
              memo (car (xml-node-children (car (xml-get-children entry-node 'memo)))))
        ;; remove the tailing: change "23.0" to "23"
        (unless amount (message memo))
        (setq amount (replace-regexp-in-string "\\.0$" "" amount))
        (add-to-list 'transaction-list (vector 'entry fromaccountname toaccountname amount recorddate memo))
        )
      )
    ;; return the result
    transaction-list
    )
  )
;; --8<-------------------------- separator ------------------------>8--

(defun ledger-generate-transaction-http-call(&optional out-buffname ledger-file-name)
  "Parse transactions from ledger file, and generate http rest call for rdaccount webserver"
  (interactive)
  (let ((output-buffername "*ledger http*")
        (ledger-buffer (concat DENNY_EMACS "/bank/filebat.ledger"))
        http-request-str
        transaction-list
        (username "denny") (password ledger-rdaccount-pwd)
        toaccountname amount recorddate memo
        (record-format "(http-post-simple \"http://www.matoushan.co.cc/transaction/create\" '((username . \"%s\") (password . \"%s\") (fromaccountname . \"%s\") (toaccountname . \"%s\")(amount . \"%s\")(recorddate . \"%s\")(memo . \"%s\")))\n"))
    ;; handle the optional parameters
    (if out-buffname (setq output-buffername out-buffname))
    (if ledger-file-name (setq ledger-buffer ledger-file-name))

    ;; set output buffer
    (delete-other-windows) ;; bury other window
    (split-window-vertically) ;; split window vertically

    ;; show buffer, with cursor not changed
    (display-buffer (get-buffer-create output-buffername))

    ;; parse ledger file, and generate the http calls
    (setq transaction-list (ledger-transactions))

    ;; clean buffer
    (set-buffer output-buffername)
    (erase-buffer)

    (dolist (transaction transaction-list)
      (insert
       (format record-format
               username
               password
               (elt transaction 1)
               (elt transaction 2)
               (elt transaction 3)
               (elt transaction 4)
               (elt transaction 5)
               ))
      (insert "(sleep-for 5)\n")
      )
    )
  )
;; --8<-------------------------- separator ------------------------>8--
(defun ledger-sync-ledger-rdaccount(&optional http-username http-password out-buffname)
  "Two way sync between ledger and rdaccount, by Set Union.

 *Notice: If we want to remove or edit a record, we need to perform the same operation on both sides.*
 "
  (interactive)
  (let ((username http-username) (password http-password)
        (ledger-transaction-list '()) (rdaccount-transaction-list '()) (union-transaction-list '())
        (ledger-transaction-list-add '()) (rdaccount-transaction-list-add '())
        (output-buffername "*ledger http*")
        (rdaccount-record-format "(http-post-simple \"http://www.matoushan.co.cc/transaction/create\" '((username . \"%s\") (password . \"%s\") (fromaccountname . \"%s\") (toaccountname . \"%s\")(amount . \"%s\")(recorddate . \"%s\")(memo . \"%s\")))\n\n")
        (ledger-record-format "%s * %s\n expenses:%s       %s\n assets:%s\n\n");;TODO: prevent the code is reindent
        )
    ;; handle the optional parameters
    (unless http-username (setq username "denny"))
    (unless http-password (setq password ledger-rdaccount-pwd))
    (if out-buffname (setq output-buffername out-buffname))
    ;; obtain transactions
    (setq rdaccount-transaction-list (rdaccount-transactions username password)
          ledger-transaction-list (ledger-transactions)
          union-transaction-list (copy-tree (union rdaccount-transaction-list ledger-transaction-list)))
    (delete-dups union-transaction-list)
    ;; generate set difference for ledger
    (setq ledger-transaction-list-add (set-difference union-transaction-list ledger-transaction-list :test 'equal)
          rdaccount-transaction-list-add (set-difference union-transaction-list rdaccount-transaction-list :test 'equal))
    ;; generate result
    (display-buffer (get-buffer-create output-buffername))
    (set-buffer output-buffername)
    (erase-buffer)
    (insert ";;### dump result for ledger ####\n")
    (dolist (transaction ledger-transaction-list-add)
      (insert
       (format ledger-record-format
               (elt transaction 4)
               (if (elt transaction 5) (elt transaction 5) "")
               (elt transaction 2)
               (elt transaction 3)
               (elt transaction 1)
               )))
    (insert ";;### dump result for rdaccount ####\n")
    (dolist (transaction rdaccount-transaction-list-add)
      (insert
       (format rdaccount-record-format
               username
               password
               (elt transaction 1)
               (elt transaction 2)
               (elt transaction 3)
               (elt transaction 4)
               (elt transaction 5)
               ))
      (insert "(sleep-for 5)\n"))
    )
  )
;; --8<-------------------------- separator ------------------------>8--
;; File: ledger-setting.el ends here
