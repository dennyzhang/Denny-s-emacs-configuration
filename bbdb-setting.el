;; -*- coding: utf-8 -*-
;; File: bbdb-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2018-07-01 22:10:59>
;;
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat CONF-EMACS-VENDOR "/bbdb/lisp"))
(require 'bbdb)
(bbdb-initialize)
(require 'bbdb-com)
(require 'bbdb-snarf)
(global-set-key [(super b)] 'bbdb)
;;(add-hook 'mail-setup-hook 'bbdb-define-all-aliases)
(setq bbdb-default-country "中国");;Default country for emacs
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)
(bbdb-initialize 'message)
(setq bbdb-file (concat CONF-EMACS-DATA "/filebat.bbdb"))
(setq bbdb-hashtable-size 200003)
(setq bbdb-send-mail-style 'compose-mail)
(setq bbdb-completion-type nil)
;; Don't check phone numbers with the syntax of North America
(setq bbdb-north-american-phone-numbers-p nil)
(setq bbdb-default-label-list '("Mobile" "Office" "Other"))
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat CONF-EMACS-VENDOR "/bbdb-picture/bbdb-picture.el"))
(setq bbdb-picture-path (concat CONF-DENNY-EMACS "/bbdb_picture/"))
(setq bbdb-picture-extension ".jpg")
(add-to-list 'load-path (concat CONF-EMACS-VENDOR "/bbdb-vcard"))
(require 'vcard)
(require 'bbdb-vcard)
;; TODO: integrate emacs bbdb with google contact
;;(bbdb-vcard-export "~/exported-vcards/" t t) ;; TODO
 
(defun update-bbdb-picture-to-vcard(&optional vcard-dir)
  "update bbdb picture as a photo property of vcard files"
  (interactive)
  (let* ((old-buffer (current-buffer)) (vcard-photo-anchor "END:VCARD")
         (photo-vcard-prefix
          (format "PHOTO;ENCODING=BASE64;TYPE=%s:" (substring bbdb-picture-extension 1)))
         (photo-vcard-regex (concat photo-vcard-prefix ".*")))
    (if (null vcard-dir) (setq vcard-dir "~/exported-vcards/"))
    ;; for each vcard file, add related photo property
    (dolist (bbdb-record-entry (bbdb-records))
      (let ((bbdb-image-filename
             (concat bbdb-picture-path
                     (bbdb-record-name bbdb-record-entry) bbdb-picture-extension))
            (bbdb-vcard-filename
             (concat vcard-dir
                     (bbdb-record-name bbdb-record-entry) ".vcf")))
        ;; update vcard, if it exists
        (when (and (file-exists-p bbdb-image-filename)
                   (file-exists-p bbdb-vcard-filename))
          (set-buffer (find-file bbdb-vcard-filename))
          ;; remove old photo property in vcard, if it exists
          (flush-lines photo-vcard-regex)
          (goto-char 0)
          ;; raise error, if the anchor is not found, if the file is in invalid format
          (search-forward-regexp vcard-photo-anchor)
          (backward-char (length vcard-photo-anchor))
          (insert
           photo-vcard-prefix
           (if (eq system-type 'darwin)
               (shell-command-to-string
                (format "base64 %s" bbdb-image-filename))
             (shell-command-to-string
              (format "base64 -w 0 %s" bbdb-image-filename)))
           "\n")
          (save-buffer)
          (kill-buffer)
          )))
     (set-buffer old-buffer) ;; restore buffer
    ))
;; --8<-------------------------- separator ------------------------>8--
;; override built-in bbdb function to support search in the field of mail-alias
(defun bbdb-combo (string elidep)
  "combo search in *BBDB* buffer"
  ;; TODO, implement in a better way without duplicate codes
  (interactive
   (list (bbdb-search-prompt "Search records %m regexp: ")
         current-prefix-arg))
  (bbdb string elidep 't)
  )

(defun bbdb (string elidep &optional combo)
  "Override default bbdb behaviour, with the enhancement: also search in notes."
  (interactive
   (list (bbdb-search-prompt "Search records %m regexp: ")
         current-prefix-arg))
  (let* ((bbdb-display-layout (bbdb-grovel-elide-arg elidep))
         (notes (cons '* string))
         (potential-records (bbdb-records))
         records alias-notes)
    (if combo
        ;; If in bbdb buffer, only perform check in records in current buffer
        (setq potential-records (mapcar 'car bbdb-records))
      ;; Perform check in all records of bbdb
      (setq potential-records (bbdb-records)))
    (setq alias-notes (cons 'mail-alias string))
    (setq records
          (append
           ;; also search in notes
           (bbdb-search potential-records nil nil nil alias-notes nil)
           (bbdb-search potential-records string string string notes string)))
    (if records
        (bbdb-display-records records)
      ;; we could use error here, but it's not really an error.
      (message "No records matching '%s'" string))))
;; --8<-------------------------- separator ------------------------>8--
(defun send-template-mail()
  "Parse current buffer as a mail template, then
send mails by send-groupmail-by-mailbuffer.
We consider {name} string as a variable,
which will be replaced by the actual name"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let (start-point
          end-point string-temp
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
      (setq name-mail-list
            (mapcar (lambda (x)
                      (list
                       (let ((name x))
                         (bbdb-string-trim (replace-regexp-in-string "<\.*>" "" name)))
                       (let ((net x))
                         (bbdb-string-trim
                          (replace-regexp-in-string
                           ">" "" (replace-regexp-in-string "\.*<" "" net))))))
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
      (send-groupmail-by-template name-mail-list subject mail-content from-mail marker)
      )
    )
  )

(defun send-groupmail-by-template (name-mail-list subject mail-content from-mail marker)
  "send group mails based on template.
 We send mails to each recipient a mail with subject and
 content specified by the variables of subject and mail-content.

 Before sending mails, we replace the marker in mail-content by the recipient's name.

 name-mail-list containing names should be a list of two-element lists,
 in the format (\"Name\" \"email address\").
"
  (interactive)
  (dolist (name-mail-entry name-mail-list)
    (compose-mail (nth 1 name-mail-entry) ;; to address
                  subject
                  `(("From" . ,from-mail)) ;; all other headers
                  nil nil nil nil) ;; don't remember
    (insert mail-content)
    (message-goto-body)
    ;; insert name
    (perform-replace marker (nth 0 name-mail-entry) nil nil nil)
    (message-send-and-exit)))
;; --8<-------------------------- separator ------------------------>8--
;; (bbdb-get-mail-aliases) : Return a list of mail aliases used in the BBDB.
(defun get-net-list-by-mail-alias(mail-alias)
  "Get email address list by mail alias"
  (let ((target (cons bbdb-define-all-aliases-field mail-alias)) records)
    (setq records (bbdb-search (bbdb-records) nil nil nil target))
    (mapcar '(lambda (record) (car (bbdb-record-net record))) records)
    ))
;; --8<-------------------------- separator ------------------------>8--
;; Don't provide bbdb update hint, while in VM, MH, RMAIL, or GNUS
(setq bbdb-use-pop-up nil)
;; don't check legal zip code, when entering an address
(setq bbdb-check-zip-codes-p nil)
;; --8<-------------------------- separator ------------------------>8--
;;(load-file (concat CONF-EMACS-VENDOR "/bbdb-to-outlook/bbdb-to-outlook.el"))
(setq bbdb-user-mail-names
      (regexp-opt '("filebat.mark@gmail.com" "denny.zhang@oscgc.com" "denny.zhang001@gmail.com")))
(setq bbdb-complete-name-allow-cycling t)
;; --8<-------------------------- separator ------------------------>8--
(require 'google-maps)
(defun show-bbdb-loaction ()
  "put all my contacts stored into BBDB on a Google Maps' map"
  (interactive)
  (google-maps-static-show
   :markers
   (mapcar
    (lambda (address-entry)
      `((,(concat
           (mapconcat
            'identity
            (elt address-entry 1) ", ") ", "
            (elt address-entry 2) ", "
            (elt address-entry 3) ", "
            (elt address-entry 4) ", "
            (elt address-entry 5)))))
    (mapcan
     (lambda (record)
       ;; We need to copy the returned list, because mapcan will modify it later
       (copy-list (bbdb-record-addresses record)))
     (bbdb-records))))
  )
;; --8<-------------------------- separator ------------------------>8--
;; always use full name when sending mail
;; (even if User Name has an address of the form <user.name@somedomain>)
(setq bbdb-dwim-net-address-allow-redundancy t)
;; no popup on auto-complete
(setq bbdb-completion-display-record nil)
;; --8<-------------------------- separator ------------------------>8--
(defun bbdb-to-vcards (&optional arg)
  (interactive "P")
  (let ((filename "/tmp/vcard.vcf"))
    (shell-command "cd ~/exported-vcards/; rm -rf *")
    (bbdb "" 't)

    (bbdb-vcard-export "~/exported-vcards/" t t)
    (shell-command "cd ~/exported-vcards/; rm -rf *-1.vcf")
    (update-bbdb-picture-to-vcard)
    (shell-command (format "cd ~/exported-vcards/; cat * > %s" filename))
    (message (format "generate bbdb to vcards: %s" filename))
    )
  )
;; --8<-------------------------- separator ------------------------>8--
;; File: bbdb-setting.el ends here
