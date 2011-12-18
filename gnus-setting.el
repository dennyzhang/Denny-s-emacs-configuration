;; -*- coding: utf-8 -*-
;; File: gnus-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-12-18 21:40:03>
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'gnus)
(setq mail-parent-directory-var (concat DENNY_CONF "gnus_data/"))
(setq gnus-startup-file (concat mail-parent-directory-var ".newsrc")
      gnus-default-directory (concat mail-parent-directory-var "Mail")
      gnus-home-directory (concat mail-parent-directory-var "Mail")
      gnus-article-save-directory (concat mail-parent-directory-var "Mail/save")
      gnus-kill-files-directory (concat mail-parent-directory-var "Mail/trash")
      gnus-agent-directory (concat mail-parent-directory-var "Mail/agent")
      gnus-cache-directory (concat mail-parent-directory-var "Mail/cache")
      mail-source-directory (concat mail-parent-directory-var "Mail/")
      nnmail-message-id-cache-file (concat mail-parent-directory-var "Mail/.nnmail-cache")
      nnml-newsgroups-file (concat mail-parent-directory-var "Mail/")
      message-directory (concat mail-parent-directory-var "Mail")
      message-auto-save-directory (concat mail-parent-directory-var "Mail/drafts/"))
;; --8<-------------------------- §separator§ ------------------------>8--
;; set the default location when saving mail's attachments
(setq mm-default-directory (concat mail-parent-directory-var "Attachment/"))
;; make the directory, if it doesn't exist
(unless (file-exists-p mm-default-directory) (make-directory mm-default-directory t))
;; --8<-------------------------- §separator§ ------------------------>8--
(setq gnus-save-newsrc-file nil
      gnus-read-newsrc-file nil
      gnus-use-dribble-file nil
      gnus-save-killed-list nil)
(setq gnus-interactive-exit nil) ;; No confirmation when exiting Gnus.
;; --8<-------------------------- §separator§ ------------------------>8--
;; view mail, and skip nntp newsgroup
(setq gnus-select-method '(nnml ""))
;; TODO: 126 imap没法读取邮件,　单独的python可以通过imap协议来操作,　应该是集成的问题
;; (setq gnus-select-method
;; '(nnimap "126"
;; (nnimap-address "imap.126.com")
;; (nnimap-server-port 143)
;; (nnimap-authinfo-file "~/backup/Dropbox/private_data/emacs_stuff/emacs_data/filebat.authinfo")
;; ;;(nnimap-authinfo-file (concat DENNY_CONF "emacs_data/filebat.authinfo"))
;; ))
;; (setq gnus-secondary-select-methods
;; '((nnml "") ;; set mail reader
;; (nnimap "gmail"
;; (nnimap-address "imap.gmail.com")
;; (nnimap-server-port 993)
;; (nnimap-authinfo-file "~/backup/Dropbox/private_data/emacs_stuff/emacs_data/filebat.authinfo")
;; ;;(nnimap-authinfo-file (concat DENNY_CONF "emacs_data/filebat.authinfo"))
;; (nnimap-stream ssl))
;; ))
(setq imap-log t) ;;Debugging IMAP
;; set pop server
(setq mail-sources ;; TODO, denny
      '(
        (pop :server "pop.126.com" ;; 在这里设置 pop3 服务器
             :user "markfilebat@126.com"
             :port 110
             :password "STUB") ;;TODO, more secure
        (pop :server "mail.shopex.cn"
             :user "STUB" ;;TODO, more secure
             :port 110
             :password "STUB") ;;TODO, more secure
        ;; ;; ;; (imap :server "imap.gmail.com" ;; 在这里设置 imap 服务器
        ;; ;; ;; :user "filebat.mark@gmail.com" ;; 用户名
        ;; ;; ;; :port 993
        ;; ;; ;; :stream ssl
        ;; ;; ;; :password "TODOCHANGE")
        ;; ;; (pop :server "pop.gmail.com" ;; 在这里设置 pop3 服务器
        ;; ;; :user "filebat.mark@gmail.com"
        ;; ;; :port 995
        ;; ;; :stream ssl
        ;; ;; :password "TODOCHANGE")
        ;; ;;
        ))
;; --8<-------------------------- §separator§ ------------------------>8--
;; setup multiple smtp account with the help of msmtp
(setq my-msmtp-config-file (concat "'" DENNY_CONF "emacs_data/filebat.msmtprc" "'"))
;; (setq sendmail-program (concat "msmtp -C " my-msmtp-config-file)) ;;TODO, enhance
(setq message-signature-file (concat DENNY_CONF "emacs_data/filebat.signature"))
(setq sendmail-program "msmtp")
(setq message-sendmail-envelope-from 'header)
(setq send-mail-function 'mailclient-send-it)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
;; (setq mail-host-address "126.com")
(setq compose-mail-user-agent-warnings nil)
;; Use different mail accounts, when sending mails
(setq gnus-parameters
      ;;Use gmail id for all INBOX mails
      '((".*INBOX"
         (posting-style
          (address "fileba.mark@gmail.com")
          (name "filebat.mark")
          ;;(body "")
          (eval (setq message-sendmail-extra-arguments '("-a" "gmail")))
          (user-mail-address "filebat.mark@gmail.com")))
        ;;use 126 id for all other mails
        (".*"
         (posting-style
          (address "markfilebat@126.com")
          (name "markfilebat126")
          ;;(body "")
          (eval (setq message-sendmail-extra-arguments '("-a" "126")))
          (user-mail-address "markfilebat@126.com")))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; group configuration
(setq gnus-group-line-format "%M\%S\%p\%P\ %4N/%4t :%B%(%g%)%O\n")
(setq gnus-summary-gather-subject-limit 'fuzzy) ;聚集题目用模糊算法
(setq gnus-summary-line-format "%4P %U%R%z%O %{%5k%} %{%14&user-date;%} %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")
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
;; --8<-------------------------- §separator§ ------------------------>8--
;; 线程的可视化外观, `%B'
(setq gnus-summary-same-subject "")
(setq gnus-sum-thread-tree-indent " ")
(setq gnus-sum-thread-tree-single-indent "◎ ")
(setq gnus-sum-thread-tree-root "● ")
(setq gnus-sum-thread-tree-false-root "☆")
(setq gnus-sum-thread-tree-vertical "│")
(setq gnus-sum-thread-tree-leaf-with-other "├─► ")
(setq gnus-sum-thread-tree-single-leaf "╰─► ")
;; --8<-------------------------- §separator§ ------------------------>8--
;; 时间显示
(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local) ;将邮件的发出时间转换为本地时间
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp) ;跟踪组的时间轴
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode) ;新闻组分组
;; 设置邮件报头显示的信息
(setq gnus-visible-headers
      (mapconcat 'regexp-quote
                 '("From:" "Newsgroups:" "Subject:" "Date:"
                   "Organization:" "To:" "Cc:" "Followup-To" "Gnus-Warnings:"
                   "X-Sent:" "X-URL:" "User-Agent:" "X-Newsreader:"
                   "X-Mailer:" "Reply-To:" "X-Spam:" "X-Spam-Status:" "X-Now-Playing"
                   "X-Attachments" "X-Diagnostic")
                 "\\|"))
;; --8<-------------------------- §separator§ ------------------------>8--
(setq gnus-group-sort-function '(gnus-group-sort-by-alphabet gnus-group-sort-by-unread))
;; on the fly spell checking
(add-hook 'message-mode-hook (lambda () (flyspell-mode 1)))
;; --8<-------------------------- §separator§ ------------------------>8--
;; How to save articles
(setq gnus-default-article-saver `gnus-summary-save-in-file)
;; article configuration
;; set mail the default mail sorting rules
(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-author
        (not gnus-thread-sort-by-date)
        ))
(setq gnus-use-cache 'passive)
(setq gnus-asynchronous t) ;;异步操作
;; --8<-------------------------- §separator§ ------------------------>8--
(gnus-delay-initialize) ;; support sending messages with delay mechanism
;;when start gnus, open the specific group, before fetching news/mails
;;(gnus-fetch-group "nnml:mail.misc")
;; 显示设置
(setq mm-text-html-renderer 'w3m) ;用W3M显示HTML格式的邮件
(setq mm-inline-large-images t) ;显示内置图片
(auto-image-file-mode) ;自动加载图片
(setq mm-inline-text-html-with-images t)
(setq mm-w3m-safe-url-regexp nil)
;; (setq mm-w3m-safe-url-regexp
;; (concat "\\(\\`cid:\\|"
;; "\\`http://www\\.shopex\\.com\\|"))
;;(add-to-list 'mm-attachment-override-types "image/*") ;附件显示图片
;; --8<-------------------------- §separator§ ------------------------>8--
;; hook bbdb to gnus
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-message)
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)
;; --8<-------------------------- §separator§ ------------------------>8--
;; TODO, enhance by a seperate data file for mail signature
;; Set up posting styles
(setq common-tail-signature "Denny Zhang\n电话: 18621908421\n邮箱: markfilebat@126.com\n微博: http://weibo.com/1686664253\n博客: http://hi.baidu.com/filebat\n团队: http://blog.ec-ae.com/\n\n")
;; 加载随机签名所需名言
(load-file (concat DENNY_CONF "/emacs_conf/signature-motto.el"))
;; 加载随机签名所需ascii图片
(load-file (concat DENNY_CONF "/emacs_conf/signature-ascii-picture.el"))
;;
;; 随机签名的算法是： 共有签名内容 + 名言 + ascii图片
;; 其中， 邮件分为三类： 普通朋友， 密交， 爱人
;; 不同类型邮件中签名的名言和ascii图片，　都采取不等概率算法。　详细如下：
;; - 发给密交邮件中签名的名言：　即可来自于"密交朋友"的名言, 也可来自于"普通朋友"的名言。　但是前者的命中概率更高
;; - 发给爱人邮件中签名的名言：　即可来自于"爱人"的名言, 也可来自于"密交朋友"，　"普通朋友"的名言。　但是前者的命中概率更高
;;　ascii图片的选取类同
;;
(defun random-string (string-list)
  "get random string from a string-list"
  (let ((rn (random (length string-list))))
    (concat (nth rn string-list) "\n")))
(defun get-common-sig-string()
  "发邮件给普通朋友时的签名档"
  (concat common-tail-signature
          (random-string common-sign-motto)
          (random-string common-sign-ascii-picture)
          ))
(defun get-close-friend-sig-string()
  "选取时，　概率为'密交'自身的命中率为self-choose-posibility"
  (let ((self-choose-posibility 70)
        (choose-group (random 100))
        signature-str)
    (if (<= choose-group self-choose-posibility)
        ;;choose self group
        (setq signature-str (format "%s%s%s" common-tail-signature
                                    (random-string close-friend-sign-motto)
                                    (random-string close-friend-sign-ascii-picture)
                                    ))
      ;; choose other groups
      (setq signature-str (format "%s%s%s" "张巍\n"
                                  (random-string common-sign-motto)
                                  (random-string common-sign-ascii-picture)
                                  ))
      )))
(defun get-lover-sig-string()
  "选取时，　概率为'爱人'自身的命中率为self-choose-posibility, 其余组平分如下命中率"
  (let ((self-choose-posibility 70)
        (choose-group (random 100)) signature-str
        (other-group-list '('(common-sign-motto common-sign-ascii-picture)
                            '(close-friend-sign-motto close-friend-sign-ascii-picture))))
    (if (<= choose-group self-choose-posibility)
        ;;choose self group
        (setq signature-str (format "%s%s%s" "秀秀, 爱你的老公!\n"
                                    (random-string lover-sign-motto)
                                    (random-string lover-sign-ascii-picture)
                                    ))
      ;; choose other groups, with equal possiblity
      (progn
        (let* ((i 0) (group-count (length other-group-list))
               (group-possiblity (/ (- 100 self-choose-posibility) group-count)))
          (while (> choose-group (+ self-choose-posibility (* (+ i 1) group-possiblity)))
            (setq i (+ i 1)))
          (setq signature-str (format "%s%s%s" "秀秀, 爱你的老公!\n"
                                      (random-string (eval (car (car (cdr (nth i other-group-list))))))
                                      (random-string (eval (car (cdr (car (cdr (nth i other-group-list)))))))
                                      ))))
      )))
(setq gnus-posting-styles
      '((".*" ; Matches all groups of messages
         (signature get-common-sig-string)) ;; 使用随机签名
        ("mail.p0"
         (signature get-close-friend-sig-string))
        ((header "from" "sophiazhang8709@126.com\\|bz-zhangchengfeng@163.com\\|06300260051@fudan.edu.cn\\|sophiazhang8709@gmail.com")
         (signature get-lover-sig-string))))
(defun refresh-signature()
  "auto refresh mail signature"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward common-tail-signature nil t)
        (delete-region (- (point) (length common-tail-signature)) (point-max))
      (goto-char (point-max)))
    (insert (get-common-sig-string))))
(define-key message-mode-map (kbd "<f5>") 'refresh-signature)
;; --8<-------------------------- §separator§ ------------------------>8--
;; category mails by bbdb group, which is defined by bbdb alias
(defun category-gnus-mail-by-bbdb-alias()
  (let (mail-alias-group net-list)
    (dolist (mail-alias (bbdb-get-mail-aliases))
      ;; get email address list by mail alias
      (setq net-list (mapconcat '(lambda(mail) (eval mail))
                                (get-net-list-by-mail-alias (car mail-alias))
                                "\\|"))
      ;; set the mail filter rule
      (setq mail-alias-group mail-alias)
      (add-to-list 'mail-alias-group (concat "From:" net-list) t)
      ;; append the rule to nnmail-split-methods
      (setq nnmail-split-methods (cons mail-alias-group nnmail-split-methods))
      ))
  )
;;　category pop3 mails
(setq nnmail-split-methods
      '(("mail.junk" "From:.editors.Chinese@dowjones.com|Subject:.*糯米网|Subject:.*《华尔街日报》中文网.*|Subject:.*Rent the Runway.*|Subject:.*去哪儿网|Subject:.*世纪佳缘交友网.*")
        ;; ("mail.shopex" "From:.*shopex.*")
        ("mail.misc" "")))
;; category mails by bbdb group
(category-gnus-mail-by-bbdb-alias)
;; category imap mails
;; --8<-------------------------- §separator§ ------------------------>8--
(gnus-compile) ;编译一些选项, 加快速度
(setq gnus-default-charset 'utf-8)
(setq gnus-article-charset 'utf-8)
(add-to-list 'gnus-group-charset-alist
             '("\\(^\\|:\\)cn\\>\\|\\<chinese\\>" utf-8))
(setq gnus-summary-show-article-charset-alist
      '((1 . utf-8)
        (2 . big5)
        (3 . gbk)
        (4 . utf-7)))
;; --8<-------------------------- §separator§ ------------------------>8--
;; store news and mails which are sent into mail.sent.news and mail.sent.mail respectively
(setq gnus-message-archive-group
      '((if (message-news-p)
            "nnfolder:mail.sent.news"
          "nnfolder:mail.sent.mail")))
;; --8<-------------------------- §separator§ ------------------------>8--
;;set expiration time for mails to be deleted
(setq nnmail-expiry-wait 3)
;; --8<-------------------------- §separator§ ------------------------>8--
(defun gnus-send-groupmail-by-template (name-mail-list subject mail-content from-mail marker)
  "send group mails based on template.
 We send mails to each recipient a mail with subject and
 content specified by the variables of subject and mail-content.
 Before sending mails, we replace the marker in mail-content by the recipient's name.
 name-mail-list containing names should be a list of two-element lists,
 in the format (\"Name\" \"email address\").
"
  (dolist (name-mail-entry name-mail-list)
    (compose-mail (nth 1 name-mail-entry) ;; to address
                  subject
                  `(("From" . ,from-mail)) ;; all other headers
                  nil nil nil nil) ;; don't remember
    (insert mail-content)
    ;; move to the beginning of buffer, and perform in replacement
    (goto-char (point-min))
    (perform-replace marker (nth 0 name-mail-entry) nil nil nil) ; insert name
    (message-send-and-exit)))
(defun gnus-send-template-mail()
  "Parse current buffer as a mail template, then send mails by send-groupmail-by-mailbuffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let (start-point end-point string-temp
                      (to-marker "To: ") (subject-marker "Subject: ")
                      (from-marker "From: ") (content-marker "--text follows this line--")
                      marker (name-mail-list '()) subject mail-content from-mail)
      ;; set default the marker for name replacement
      (setq marker "{name}")
      ;; obtain name and mail address list of recipients by searching: XXX <>
      (search-forward to-marker nil t)
      (setq start-point (point))
      (search-forward subject-marker nil t)
      (backward-char (length subject-marker))
      (setq end-point (point))
      (setq string-temp (buffer-substring-no-properties start-point end-point))
      ;; obtain name list
      (setq name-mail-list
            (mapcar (lambda (x)
                      (list (let ((name (replace-regexp-in-string "<\.*>" "" x)))
                              (bbdb-string-trim (replace-regexp-in-string "\"" "" name)))
                            (let ((net x))
                              (bbdb-string-trim (replace-regexp-in-string ">" "" (replace-regexp-in-string "\.*<" "" net))))))
                    (split-string string-temp ",")))
      ;; Obtain subject by searching: Subject: XXX
      (setq start-point (+ end-point (length subject-marker)))
      (search-forward from-marker nil t)
      (backward-char (length from-marker))
      (setq end-point (point))
      (setq subject (buffer-substring-no-properties start-point end-point))
      ;; Obtain from by searching: From: XXX
      (setq start-point (+ end-point (length from-marker)))
      (search-forward content-marker nil t)
      (backward-char (length content-marker))
      (setq end-point (point))
      (setq from-mail (buffer-substring-no-properties start-point end-point))
      ;; Obtain mail content by searching: --text follows this line--
      (setq start-point (+ end-point (length content-marker)))
      (setq end-point (point-max))
      (setq mail-content (buffer-substring-no-properties start-point end-point))
      ;; send mails based on template
      (gnus-send-groupmail-by-template name-mail-list subject mail-content from-mail marker)
      )
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
;; search content of gnus mails
;; TODO, doesn't work
(require 'nnir)
(setq nnir-search-engine 'namazu)
(setq nnir-namazu-index-directory (concat mail-parent-directory-var "namazu-mail-index/"))
(setq nnir-namazu-remove-prefix (concat mail-parent-directory-var "Mail/"))
(setq nnir-mail-backend gnus-select-method)
(defun update-mail-index-by-namazu()
  (interactive)
  (let ((command-string
         (format "mknmz --mailnews -O %s %s"
                 nnir-namazu-index-directory
                 (concat mail-parent-directory-var "Mail/"))))
    (shell-command-to-string command-string)
    )
  )
;; --8<-------------------------- §separator§ ------------------------>8--
(setq display-time-use-mail-icon t) ;;use an icon as mail indicator in modeline
(setq gnus-demon-timestep 20)
(gnus-demon-add-handler 'gnus-group-get-new-news 2 t)
(gnus-demon-add-handler 'gnus-demon-scan-news 2 t)
(gnus-demon-add-handler 'gnus-demon-scan-mail 2 t)
(gnus-demon-init)
(defadvice gnus-demon-scan-news (around gnus-demon-timeout activate)
  "Timeout for Gnus."
  (with-timeout (30 (message "Gnus timed out.")) ad-do-it))
;; ;; --8<-------------------------- §separator§ ------------------------>8--
;; (load-file (concat CONTRIBUTOR_CONF "/gnus-notify/gnus-desktop-notify.el"))
;; (require 'gnus-desktop-notify)
;; (gnus-desktop-notify-mode)
;; (gnus-demon-add-scanmail)
;; (load-file (concat CONTRIBUTOR_CONF "/gnus-notify/gnus-notify+.el"))
;; (require 'gnus-notify+)
;; (add-hook 'gnus-summary-exit-hook 'gnus-notify+)
;; (add-hook 'gnus-group-catchup-group-hook 'gnus-notify+)
;; (add-hook 'mail-notify-pre-hook 'gnus-notify+)
;; (setq gnus-notify+-timeout 40)
;; --8<-------------------------- §separator§ ------------------------>8--
(setq gnus-novice-user nil) ;; no confirmation is required
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: gnus-setting.el ends here
