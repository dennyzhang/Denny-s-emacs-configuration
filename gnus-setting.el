;; -*- coding: utf-8 -*-
;; File: gnus-setting.el
;;
;; Author: Denny Zhang(contact@dennyzhang.com)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-07-01 22:08:40>
;; --8<-------------------------- separator ------------------------>8--
(require 'gnus)
(setq mail-parent-directory-var "~/gnus_data/")
(setq gnus-startup-file (concat CONF-EMACS-DATA "/filebat.newsrc")
      gnus-home-directory (concat mail-parent-directory-var "Mail")
      gnus-default-directory (concat mail-parent-directory-var "Mail")
      gnus-article-save-directory (concat mail-parent-directory-var "Mail/save")
      gnus-kill-files-directory (concat mail-parent-directory-var "Mail/trash")
      gnus-agent-directory (concat mail-parent-directory-var "Mail/agent")
      gnus-cache-directory (concat mail-parent-directory-var "Mail/cache")
      ;; mail-source-directory (concat mail-parent-directory-var "Mail/incoming")
      nnmail-message-id-cache-file (concat mail-parent-directory-var "Mail/.nnmail-cache")
      nnml-newsgroups-file (concat mail-parent-directory-var "Mail/")
      message-directory (concat mail-parent-directory-var "Mail/")
      nndraft-directory (concat mail-parent-directory-var "Mail/drafts/")
      mm-default-directory (concat mail-parent-directory-var "Attachment/")
      message-auto-save-directory (concat mail-parent-directory-var "Mail/drafts/"))
;; --8<-------------------------- separator ------------------------>8--
(setq gnus-save-newsrc-file nil
      gnus-read-newsrc-file nil
      gnus-use-dribble-file nil
      gnus-save-killed-list nil)
(setq gnus-interactive-exit nil) ;; No confirmation when exiting Gnus.
;; --8<-------------------------- separator ------------------------>8--
;; view mail, and skip nntp newsgroup

;; TODO: 126 imap没法读取邮件,　单独的python可以通过imap协议来操作,　应该是集成的问题
;; (setq gnus-select-method
;; '(nnimap "126"
;; (nnimap-address "imap.126.com")
;; (nnimap-server-port 143)
;; (nnimap-authinfo-file (concat DENNY_DATA "/filebat.authinfo"))
;; ;;(nnimap-authinfo-file (concat CONF-EMACS-DATA "/filebat.authinfo"))
;; ))
;; (setq gnus-secondary-select-methods
;; '((nnml "") ;; set mail reader
;; (nnimap "gmail"
;; (nnimap-address "imap.gmail.com")
;; (nnimap-server-port 993)
;; ;;(nnimap-authinfo-file (concat CONF-EMACS-DATA "/filebat.authinfo"))
;; (nnimap-stream ssl))
;; ))
(setq imap-log t) ;;Debugging IMAP
;; --8<-------------------------- separator ------------------------>8--
;; (setq message-citation-line-function 'my-message-insert-citation-line)
;; (defun my-message-insert-citation-line ()
;; "Insert a simple citation line."
;; (when message-reply-headers
;; (newline)
;; (insert "> " (mail-header-from message-reply-headers)
;; " writes:\n" "> --------\n"
;; )
;; (forward-line -3)))
;; --8<-------------------------- separator ------------------------>8--
;; setup multiple smtp account with the help of msmtp
(setq my-msmtp-config-file (concat "'" CONF-EMACS-DATA "/filebat.msmtprc" "'"))
;; (setq sendmail-program (concat "msmtp -C " my-msmtp-config-file)) ;;TODO, enhance
(setq message-signature-file (concat CONF-EMACS-DATA "/filebat.signature"))
(setq sendmail-program "msmtp")
(setq message-sendmail-envelope-from 'header)
(setq send-mail-function 'mailclient-send-it)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
;; (setq mail-host-address "126.com")
(setq compose-mail-user-agent-warnings nil)
(setq mail-user-agent 'gnus-user-agent)
;; All outgoing messages will be put in this group
;;(setq gnus-outgoing-message-group "nnml:mail.sent.archive")
;; Use different mail accounts, when sending mails
(add-hook 'message-send-hook 'set-mail-sender)
(defun set-mail-sender ()
  (let (from-mail)
    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward "From: [^<>]+ <\\([^>]+\\)>" nil t)
        (setq from-mail (buffer-substring-no-properties
                         (match-beginning 1) (match-end 1))))
      (cond
       ((string= from-mail "markfilebat@126.com")
        (setq message-sendmail-extra-arguments '("-a" "126")
              user-mail-address from-mail))
       ((string= from-mail "denny.zhang@totvs.com")
        (setq message-sendmail-extra-arguments '("-a" "totvs")
              user-mail-address from-mail))
       ((string= from-mail "filebat.mark@gmail.com")
        (setq message-sendmail-extra-arguments '("-a" "gmail")
              user-mail-address from-mail))
       ((string= from-mail "https://www.dennyzhang.com/contact")
        (setq message-sendmail-extra-arguments '("-a" "dennyzhang001gmail")
              user-mail-address from-mail))
       ((string= from-mail "denny@dennyzhang.com")
        (setq message-sendmail-extra-arguments '("-a" "dennyzhang")
              user-mail-address from-mail))
       ((string= from-mail "denny.zhang@oscgc.com")
        (setq message-sendmail-extra-arguments '("-a" "osc")
              user-mail-address from-mail))
       (t
        (setq message-sendmail-extra-arguments '("-a" "gmail")
              user-mail-address "filebat.mark@gmail.com")))
      )))
;; (setq gnus-parameters
;; ;;Use gmail id for all INBOX mails
;; '((".*INBOX"
;; (posting-style
;; (address "fileba.mark@gmail.com")
;; (name "filebat.mark")
;; ;;(body "")
;; (eval (setq message-sendmail-extra-arguments '("-a" "gmail")))
;; (user-mail-address "filebat.mark@gmail.com")))
;; ;;use 126 id for all other mails
;; (".*"
;; (posting-style
;; (address "filebat.mark@gmail.com")
;; (name "markfilebat126")
;; ;;(body "")
;; (eval (setq message-sendmail-extra-arguments '("-a" "126")))
;; (user-mail-address "filebat.mark@gmail.com")))))

;; --8<-------------------------- separator ------------------------>8--
;; group configuration
(setq gnus-group-line-format "%M\%S\%p\%P\ %4N/%4t :%B%(%g%)%O\n")
(setq gnus-summary-gather-subject-limit 'fuzzy) ;聚集题目用模糊算法
(setq gnus-summary-line-format
      "%4P %U%R%z%O %{%5k%} %{%14&user-date;%} %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")
(setq gnus-summary-mode-line-format "Gnus: %p [%A / Sc:%4z] %Z")
(defun gnus-user-format-function-a (header) ;用户的格式函数 `%ua'
  (let ((myself (concat "<" user-mail-address ">"))
        (references (mail-header-references header))
        (message-id (mail-header-id header)))
    (if (or (and (stringp references)
                 (string-match myself references))
            (and (stringp message-id)
                 (string-match myself message-id)))
        "X" "│")))
(setq gnus-user-date-format-alist ;用户的格式列表 `user-date'
      '(((gnus-seconds-today) . "TD %H:%M") ;当天
        (604800 . "W%w %H:%M") ;七天之内
        ((gnus-seconds-month) . "%d %H:%M") ;当月
        ((gnus-seconds-year) . "%m-%d %H:%M") ;今年
        (t . "%y-%m-%d %H:%M"))) ;其他
;; --8<-------------------------- separator ------------------------>8--
;; 线程的可视化外观, `%B'
(setq gnus-summary-same-subject "")
(setq gnus-sum-thread-tree-indent " ")
(setq gnus-sum-thread-tree-single-indent "◎ ")
(setq gnus-sum-thread-tree-root "● ")
(setq gnus-sum-thread-tree-false-root "☆")
(setq gnus-sum-thread-tree-vertical "│")
(setq gnus-sum-thread-tree-leaf-with-other "├─► ")
(setq gnus-sum-thread-tree-single-leaf "╰─► ")
;; --8<-------------------------- separator ------------------------>8--
;; 时间显示
(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local) ;将邮件的发出时间转换为本地时间
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp) ;跟踪组的时间轴
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode) ;新闻组分组
;; All headers that do not match this regexp will be hidden
(setq gnus-visible-headers
      (mapconcat
       'regexp-quote
       '("From:" "Newsgroups:" "Subject:" "Date:"
         "Organization:" "To:" "Cc:" "Followup-To" "Gnus-Warnings:" "Reply-To:"
         "Summary:" "Keywords:" "BCc:" "FCc:" "Posted-To:" "Mail-Copies-To:"
         "Mail-Followup-To:" "Apparently-To:" "Gnus-Warning:" "Resent-From:"
         "X-Sent:" "X-URL:" "User-Agent:" "X-Newsreader:" "X-Priority" "Disposition-Notification-To"
         "X-Mailer:" "Reply-To:" "X-Spam:" "X-Spam-Status:" "X-Now-Playing" "X-Gnus-Delayed:"
         "X-Attachments" "X-Diagnostic")
       "\\|"))
;;(setq message-ignored-mail-headers "") ;; TODO
;; (setq gnus-visible-headers ".*")
;; Specify the order of the header lines
(setq gnus-sorted-header-list
      '("^From:" "^Subject:" "^Summary:" "^To:" "^Cc:" "^Keywords:"
        "^Newsgroups:" "^Followup-To:" "^Date:" "^User-Agent:"
        "^X-Mailer:" "^X-Newsreader:" "^Gcc:"))
;; --8<-------------------------- separator ------------------------>8--
(setq gnus-group-sort-function
      '(gnus-group-sort-by-alphabet gnus-group-sort-by-unread))
;; --8<-------------------------- separator ------------------------>8--
;; on the fly spell checking
(add-hook 'message-mode-hook 'flyspell-prog-mode)
;; --8<-------------------------- separator ------------------------>8--
;; How to save articles
(setq gnus-default-article-saver 'gnus-summary-save-in-file)
;; article configuration
;; set mail the default mail sorting rules
(add-hook 'gnus-select-group-hook 'set-dynamic-thread-sort-functions)
(defun set-dynamic-thread-sort-functions ()
  (setq gnus-thread-sort-functions
        '(gnus-thread-sort-by-author (not gnus-thread-sort-by-date)))
  )
(setq gnus-use-cache 'passive)
(setq gnus-asynchronous 't) ;;异步操作
;; --8<-------------------------- separator ------------------------>8--
(gnus-delay-initialize) ;; support sending messages with delay mechanism
(setq gnus-delay-default-delay "1d")
;;when start gnus, open the specific group, before fetching news/mails
;;(gnus-fetch-group "nndraft:delayed")
;; --8<-------------------------- separator ------------------------>8--
;; 显示设置
(setq mm-text-html-renderer 'w3m) ;用W3M显示HTML格式的邮件
;; Do not use the html part of a message, use the text part if possible!
;; (setq mm-discouraged-alternatives '("text/html" "text/richtext"))
(setq mm-inline-large-images t) ;显示内置图片
(auto-image-file-mode t) ;自动加载图片
(setq mm-inline-text-html-with-images t)
(setq mm-w3m-safe-url-regexp nil)
;; (setq mm-w3m-safe-url-regexp
;; (concat "\\(\\`cid:\\|"
;; "\\`http://www\\.shopex\\.com\\|"))
(add-to-list 'mm-attachment-override-types "image/*") ;附件显示图片
;; --8<-------------------------- separator ------------------------>8--
;; hook bbdb to gnus
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-message)
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)
;; --8<-------------------------- separator ------------------------>8--
;; category mails by bbdb group, which is defined by bbdb alias
(defun category-gnus-mail-by-bbdb-alias()
  (let (mail-alias-group net-list)
    (dolist (mail-alias (bbdb-get-mail-aliases))
      ;; get email address list by mail alias
      (setq net-list (mapconcat #'(lambda(mail) (concat "From:.*" mail))
                                (get-net-list-by-mail-alias (car mail-alias))
                                "\\|"))
      ;; set the mail filter rule
      (setq mail-alias-group mail-alias)
      (add-to-list 'mail-alias-group net-list t)
      ;; append the rule to nnmail-split-methods
      (add-to-list 'nnmail-split-methods mail-alias-group t)
      ))
  )
;;　category pop3 mails
(setq nnmail-split-methods
      '(("mail.junk" "From:.*editors.Chinese@dowjones.com.*\\|Subject:.*糯米网.*\\|Subject:.*《华尔街日报》中文网.*\\|Subject:.*Rent the Runway.*\\|Subject:.*去哪儿网.*\\|From:.*admin@42qu.com.*")
        ("myself" "From:.*filebat.mark@gmail.com.*\\|From:.*249950670@qq.com.*\\|From:.*denny.zhang@totvs.com.*\\|From:.*denny.zhang001@gmail.com")
        ("openstack-community" "From:.*OpenStack Infra.*\\|Subject:.*OpenStack.*Digest.*\\|From:.*@.*openstack.org.*\\|Reply-To:.*launchpad.*")
        ("tickets" "From:.*do-not-reply@trello.com.*")
        ("mail-list" "Subject:.*ubuntu-security-announce.*\\|From:.*hi@wanqu.co.*\\|From:.*blog@flux7.com.*\\|From:.*noreply@activebuilding.com.*\\|Subject:.*Lisp-cn.*\\|Subject:.*Devops Weekly.*\\|From:.*emacs-devel-request@gnu.org.*\\|From:.*support@guestblogging.com.*\\|Subject:.*Devops Weekly .*\\|From:.*seriousbloggersonly.com.*\\|From:.*contact@nerdfitness.com.*\\|From:.*brian@backlinko.com.*\\|From:.*mathias.lafeldt@gmail.com.*\\|From:.*newsletter@lifehack.org.*\\|From:.*evan@stridenyc.com.*\\|From:.*nate.winn@hpe.com.*\\|From:.*noreply.+feedproxy@google.com.*\\|From:.*questions@smartblogger.com.*\\|From:.*donotreply@wordpress.com.*\\|From:.*contact@nerdfitness.com.*\\|From:.*mikestelzner@socialmediaexaminer.com.*\\|From:.*dev@arkency.com.*\\|From:.*noreply@postmaster.scoop.it.*\\|From:.*glamd@abv.bg.*")
        ;; put mail receipt in mail.receipt
        ("mail.receipt" "Content-Type:.*report-type=disposition-notification.*")
        ("Daily_Journal" "Subject:.*Emacs Daily Journal.*")
        ("totvs-nagios" "From:.*nagios@fluig-id-cdn-01.fluigidentity.com.*")
        ("SNS" "Subject:.*LinkedIn.*\\|From:.*@.*monster.com.*")
        ("job" "From:.*@indeed.com.*\\|From:.*@.*monster.com\\|From:.*@cybercoders.com")
        ("vps-alert" "Subject:.*Linode Alert.*")
        ))

;; category mails by bbdb group
(category-gnus-mail-by-bbdb-alias)
(add-to-list 'nnmail-split-methods '("mail.misc" "") 't)
;; --8<-------------------------- separator ------------------------>8--
;; category imap mails
;; --8<-------------------------- separator ------------------------>8--
;;(gnus-compile) ;编译一些选项, 加快速度
(setq gnus-default-charset 'utf-8)
(setq gnus-article-charset 'utf-8)
(add-to-list 'gnus-group-charset-alist '("\\(^\\|:\\)cn\\>\\|\\<chinese\\>" utf-8))
(setq gnus-summary-show-article-charset-alist
      '((1 . cn-gb-2312)
        (2 . gb18030)
        (3 . chinese-iso-8bit)
        (4 . gbk)
        (5 . big5)
        (6 . utf-8)))
;; --8<-------------------------- separator ------------------------>8--
;; ;; store news and mails which are sent into mail.sent.news and mail.sent.mail respectively
;; (setq gnus-message-archive-group
;; '((if (message-news-p)
;; "nnfolder:mail.sent.news"
;; "nnfolder:mail.sent.mail")))
(setq gnus-message-archive-group '("nnfolder:mail.sent.mail"))
;; --8<-------------------------- separator ------------------------>8--
;;set expiration time for mails to be deleted
(setq nnmail-expiry-wait 3)
;; --8<-------------------------- separator ------------------------>8--

(defun gnus-send-groupmail-by-template (name-mail-list subject mail-content from-mail cc-mail bcc-mail marker)
  "send group mails based on template.
 We send mails to each recipient a mail with subject and
 content specified by the variables of subject and mail-content.
 Before sending mails, we replace the marker in mail-content by the recipient's name.
 name-mail-list containing names should be a list of two-element lists,
 in the format (\"Name\" \"email address\").
"
  (let ((other-headers `(("From" . ,from-mail))))
    (unless (string-empty-p cc-mail) (add-to-list 'other-headers (cons "Cc" cc-mail)))
    (unless (string-empty-p bcc-mail) (add-to-list 'other-headers (cons "Bcc" bcc-mail)))
    (dolist (name-mail-entry name-mail-list)
      (compose-mail (nth 1 name-mail-entry) ;; to address
                    subject
                    other-headers
                    nil nil nil nil) ;; don't remember
      (insert mail-content)
      ;; move to the beginning of buffer, and perform in replacement
      (goto-char (point-min))
      (perform-replace marker (nth 0 name-mail-entry) nil nil nil) ; insert name
      (message-send-and-exit)))
  )
(defun gnus-send-template-mail()
  "Parse current buffer as a mail template,
then send mails by send-groupmail-by-mailbuffer."
  (interactive)
  (save-excursion
    (let (subject from-mail
                  (cc-mail "") (bcc-mail "")
                  start-point end-point string-temp
                  (to-marker "To: ")
                  (content-marker "--text follows this line--\n")
                  (signature-marker (format "-- \n%s"common-tail-signature))
                  marker (name-mail-list '()) mail-content)
      ;; obtain fields of from, cc, bcc, subject
      (goto-char (point-min))
      (when (search-forward-regexp "^[Ff]rom: \\(.*\\)$" nil t)
        (setq from-mail (match-string-no-properties 1)))

      (goto-char (point-min))
      (when (search-forward-regexp "^[Cc]c: \\(.*\\)$" nil t)
        (setq cc-mail (match-string-no-properties 1)))

      (goto-char (point-min))
      (when (search-forward-regexp "^[Bb]cc: \\(.*\\)$" nil t)
        (setq bcc-mail (match-string-no-properties 1)))

      (goto-char (point-min))
      (when (search-forward-regexp "^[Ss]ubject: \\(.*\\)$" nil t)
        (setq subject (match-string-no-properties 1)))

      ;; set default the marker for name replacement
      (setq marker "{name}")
      ;; obtain name and mail address list of recipients by searching: XXX <>
      (goto-char (point-min))
      (search-forward to-marker nil nil)
      (setq start-point (point))
      (search-forward ":" nil nil)
      (message-beginning-of-line)
      (backward-char 1)
      (setq end-point (point))
      (setq string-temp (buffer-substring-no-properties start-point end-point))
      ;; obtain name list
      (setq name-mail-list
            (mapcar
             (lambda (x)
               (if (string-match "[^ \<].+<[^>]+>" x)
                   (list (let ((name (replace-regexp-in-string "<\.*>" "" x)))
                           (bbdb-string-trim (replace-regexp-in-string "\"" "" name)))
                         (let ((net x))
                           (bbdb-string-trim
                            (replace-regexp-in-string ">" ""
                                                      (replace-regexp-in-string "\.*<" "" net)))))
                 (error "Please make sure format for the reciepent(TO field) is 'XXX <XX@XX>'")
                 ))
             (split-string string-temp ",")))
      ;; Obtain mail content by searching: --text follows this line--
      (goto-char (point-min))
      (search-forward content-marker nil nil)
      (setq start-point (point))
      (if (search-forward signature-marker nil nil)
          (setq end-point (- (point) (length signature-marker)))
        (setq end-point (point-max)))
      (setq mail-content (buffer-substring-no-properties start-point end-point))
      ;; send mails based on template
      (gnus-send-groupmail-by-template
       name-mail-list subject mail-content from-mail cc-mail bcc-mail marker)
      )
    )
  )
;; --8<-------------------------- separator ------------------------>8--
;; search content of gnus mails
(require 'nnir)
(setq nnir-search-engine 'swish-e)
(setq nnir-swish-e-index-files
      (list (expand-file-name (concat mail-parent-directory-var "index.swish"))))
;; --8<-------------------------- separator ------------------------>8--
;; (setq display-time-use-mail-icon t) ;;use an icon as mail indicator in modeline
;; (setq gnus-demon-timestep 20)
;; (gnus-demon-add-handler 'gnus-group-get-new-news 2 t)
;; (gnus-demon-add-handler 'gnus-demon-scan-news 2 t)
;; (gnus-demon-add-handler 'gnus-demon-scan-mail 2 t)
;; (gnus-demon-init)
;; (defadvice gnus-demon-scan-news (around gnus-demon-timeout activate)
;; "Timeout for Gnus."
;; (with-timeout (30 (message "Gnus timed out.")) ad-do-it))
;; ;; --8<-------------------------- separator ------------------------>8--
;; (load-file (concat CONF-EMACS-VENDOR "/gnus-notify/gnus-desktop-notify.el"))
;; (require 'gnus-desktop-notify)
;; (gnus-desktop-notify-mode)
;; (gnus-demon-add-scanmail)
;; (load-file (concat CONF-EMACS-VENDOR "/gnus-notify/gnus-notify+.el"))
;; (require 'gnus-notify+)
;; (add-hook 'gnus-summary-exit-hook 'gnus-notify+)
;; (add-hook 'gnus-group-catchup-group-hook 'gnus-notify+)
;; (add-hook 'mail-notify-pre-hook 'gnus-notify+)
;; (setq gnus-notify+-timeout 40)
;; --8<-------------------------- separator ------------------------>8--
(setq gnus-novice-user nil) ;; no confirmation is required
;; --8<-------------------------- separator ------------------------>8--
(setq working-email-postfix "@dennyzhang.com")
(defun check-from-mail ()
  "Check whether I am sending from company's email adress, when coping with work stuff"
  (interactive)
  (save-excursion
    (let ((working-mail working-email-postfix)
          (confirm-msg "Are you sure sending from your personal email account for working emails? Press C-g to stop. ")
          )
      (goto-char (point-min))
      (when (search-forward-regexp (regexp-quote working-mail) nil t)
        ;; make sure we are senging from company's email address
        (goto-char (point-min))
        (unless (search-forward-regexp (format "\\(From: .*%s\\)" working-mail) nil t)
          (yes-or-no-p confirm-msg))
        ))
    ))
(add-hook 'message-send-mail-hook 'check-from-mail)
;; --8<-------------------------- separator ------------------------>8--
(defun confirm-for-delayed-mail ()
  "Ask for confirmation, before sending delayed mail"
  (interactive)
  (save-excursion
    (if (string= gnus-newsgroup-name "nndraft:delayed")
        (yes-or-no-p "Are you sure to send this delayed mail? Press C-g to stop. "))
    ))
(add-hook 'message-send-mail-hook 'confirm-for-delayed-mail)
;; --8<-------------------------- separator ------------------------>8--
(defun auto-add-message-important-header ()
  "Auto set current mail as important, for some regexp rules"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (when (search-forward-regexp "To: .* \<sophiazhang8709@126.com\>" nil t)
      (message-important-header))
    (goto-char (point-min))
    (when (search-forward-regexp "To: .* \<fangfangkingdom@163.com\>" nil t)
      (message-important-header))
    (goto-char (point-min))
    (when (search-forward-regexp "To: .* \<22306476@qq.com\>" nil t)
      (message-important-header))
    (goto-char (point-min))
    (when (search-forward-regexp "To: .* \<87289855@qq.com\>" nil t)
      (message-important-header))
    (goto-char (point-min))
    (when (search-forward-regexp "To: .* \<527988044@qq.com\>" nil t)
      (message-important-header))
    ;;(yes-or-no-p "Are you sure to send this delayed mail? Press C-g to stop")
    ))
(add-hook 'message-send-mail-hook 'auto-add-message-important-header)
;; --8<-------------------------- separator ------------------------>8--
(define-key gnus-summary-mode-map "d"
  #'(lambda() (interactive)
      (if (string= gnus-newsgroup-name "nndraft:delayed")
          (yes-or-no-p "Are you sure to delete this delayed mail? Press C-g to stop. "))
      (gnus-summary-delete-article 1) (forward-line 1)))
;; --8<-------------------------- separator ------------------------>8--
;; score down any mails which I don't like
(setq gnus-use-adaptive-scoring t)
(setq gnus-score-expiry-days 14)
(setq gnus-default-adaptive-score-alist
      '((gnus-unread-mark)
        (gnus-ticked-mark (from 4))
        (gnus-dormant-mark (from 5))
        (gnus-saved-mark (from 20) (subject 5))
        (gnus-del-mark (from -2) (subject -5))
        (gnus-read-mark (from 2) (subject 1))
        (gnus-killed-mark (from 0) (subject -3))))
(setq gnus-score-decay-constant 1)
(setq gnus-score-decay-scale 0.03)
(setq gnus-decay-scores t)
;; Use a global score file to filter some spam mails
(setq gnus-global-score-files
      (list (concat mail-parent-directory-var "all.SCORE")))
;; all.SCORE contains:
;;(("xref"
;; ("gmane.spam.detected" -1000 nil s)))
(setq gnus-summary-expunge-below -999)
;; Increase the score for followups to a sent article.
(add-hook 'message-sent-hook 'gnus-score-followup-article)
(add-hook 'message-sent-hook 'gnus-score-followup-thread)
;; --8<-------------------------- separator ------------------------>8--
;; Keep a backup of the received mails for some time
(setq mail-source-delete-incoming 30)
;; don't ask for confirmation before deleting old mails
(setq mail-source-delete-old-incoming-confirm nil)
;; Expireable articles will be deleted after 35 days.
(setq nnmail-expiry-wait 35)
;; --8<-------------------------- separator ------------------------>8--
(setq message-generate-headers-first t)
;; When composing a mail, start the auto-fill-mode.
(add-hook 'message-mode-hook 'turn-on-auto-fill)
;; --8<-------------------------- separator ------------------------>8--
;; Use the gnus registry
(setq gnus-registry-install 't)
(require 'gnus-registry)
(gnus-registry-initialize)
;; --8<-------------------------- separator ------------------------>8--
;; (setq message-kill-buffer-on-exit t)
;; --8<-------------------------- separator ------------------------>8--
(define-key message-mode-map (kbd "M-p i") 'message-important-header)
(defun message-important-header(&optional receipt-email)
  "Request a disposition notification (return receipt)
to this message(Disposition-Notification-To).
And insert header to mark message as unimportant(X-Priority).
"
  (interactive)
  (let (Disposition-Notification-To-Header
        (Importance-Header "X-Priority: 1\n"))
    (if (null receipt-email)
        (setq Disposition-Notification-To-Header
              "Disposition-Notification-To: filebat.mark@gmail.com\n")
      (setq Disposition-Notification-To-Header
            (concat "Disposition-Notification-To: " receipt-email "\n")))
    (save-excursion
      (save-restriction
        (message-narrow-to-headers)
        (message-remove-header "Disposition-Notification-To")
        (message-remove-header "X-Priority"))
      (message-goto-eoh)
      (insert Disposition-Notification-To-Header)
      (insert Importance-Header)
      )))
;; --8<-------------------------- separator ------------------------>8--
(setq nnmail-treat-duplicates 'delete) ;; ask nnmail to delete duplicated mails.
(setq gnus-summary-display-while-building 50)
(setq gnus-gcc-mark-as-read t) ;;automatically mark Gcc articles as read
(setq gnus-gcc-externalize-attachments 'all)
(setq nnml-use-compressed-files t) ;;using compressed message files
;; (setq nnmail-crosspost t) ;; do crossposting if several split methods match the mail.
(setq bbdb/gnus-update-records-mode 'searching) ;; don't update bbdb records automatically
;; --8<-------------------------- separator ------------------------>8--
;; put signature before message, when replying
(setq message-forward-before-signature nil)
(setq message-cite-reply-position 'above)
;; --8<-------------------------- separator ------------------------>8--
;; hack original citation to attach when the mail is received
(defun message-insert-citation-line ()
  "Insert a simple citation line."
  (when message-reply-headers
    (insert (mail-header-date message-reply-headers) " " (mail-header-from message-reply-headers) " writes:")
    (newline)
    (newline)))
;; --8<-------------------------- separator ------------------------>8--
(setq gnus-delay-default-hour 10) ;; Normally I will reach the office by 10am
(require 'sendmail)
;; --8<-------------------------- separator ------------------------>8--
;; File: gnus-setting.el ends here
