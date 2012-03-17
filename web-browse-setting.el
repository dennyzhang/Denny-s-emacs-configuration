;; -*- coding: utf-8 -*-
;; File: web-browse-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2012-03-11 12:03:02>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;; When copying in w3m, also copy link in the format of org-mode-link
(load-file (concat EMACS_VENDOR "/org-w3m/org-w3m.el"))
;; --8<-------------------------- §separator§ ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/emacs-w3m"))
(eval-after-load 'w3m
  '(progn
     ;; Never load the crashed sessions automatically
     (setq w3m-session-load-crashed-sessions nil)
     (setq w3m-default-display-inline-images t)
     ;;(setq browse-url-browser-function 'w3m-browse-url)
     (setq w3m-use-cookies t) ;; enable emacs-w3m to use cookies
     (setq w3m-home-page "http://www.google.com/ncr")
     (setq w3m-command-arguments '("-cookie" "-F"))
     (setq w3m-use-title-buffer-name t)
     (setq w3m-tab-width 4)
     (setq w3m-fill-column 100)
     (setq w3m-view-this-url-new-session-in-background t)
     ))

(defun ffap-w3m-other-window (url &optional new-session)
  "Browse url in w3m.
 If current frame has only one window, create a new window and browse the webpage"
  (interactive (progn
                 (require 'browse-url)
                 (browse-url-interactive-arg "Emacs-w3m URL: ")))
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url new-session)))
;; --8<-------------------------- §separator§ ------------------------>8--
;;alt+p t: get title of web page, whose url can be found in the current line.
(global-set-key [(meta p)(t)] 'get-page-title)
(defun get-page-title()
  "Get title of web page, whose url can be found in the current line"
  (interactive)
  (save-excursion
    (save-restriction
      (let (url point-start point-end point-orig line-str
                (web_title_str "") (coding_charset "utf-8"))
        ;; Get url from current line
        (move-beginning-of-line nil)
        (setq point-start (point))
        (move-end-of-line nil)
        (setq point-end (point))
        (setq line-str (buffer-substring-no-properties point-start point-end))
        (if (not (string-match "\\(https\\{0,1\\}://[^ ]+\\)" line-str))
            (message "url invalid!")
          (setq url (substring line-str (match-beginning 0) (match-end 1)))
          ;; Get title of web page, with the help of functions in url.el
          (with-current-buffer (url-retrieve-synchronously url)
            ;; find title by grep the html code
            (goto-char 0)
            (if (re-search-forward "<title>\\([^<]*\\)</title>" nil t 1)
                (setq web_title_str (match-string 1)))
            ;; find charset by grep the html code
            (goto-char 0)
            (if (re-search-forward "charset= *\\([-0-9a-zA-Z]*\\)" nil t 1)
                (setq coding_charset (downcase (match-string 1))))
            ;; decode the string of title.
            (setq web_title_str (decode-coding-string web_title_str (intern coding_charset)))
            )
          ;; If previous line contains: "web page:", insert web title there.
          ;; Otherwise, in the line below
          (setq point-orig (point)
                point-end (point))
          (forward-line -1)
          (move-beginning-of-line nil)
          (setq point-start (point))
          (narrow-to-region point-start point-end)
          (if (re-search-forward "\\(web page:[^:\n]*\\)" nil t)
              (replace-match (format "%s: %s%s" "web page" web_title_str (make-string 50 32)) nil nil)
            (goto-char point-orig)
            (reindent-then-newline-and-indent)
            ;; wash content
            (setq web_title_str (replace-regexp-in-string "^[ 	\n]*" "" web_title_str))
            (setq web_title_str (replace-regexp-in-string "[ 	\n]*$" "" web_title_str))
            (insert web_title_str)))
        ))
    ))
;; --8<-------------------------- §separator§ ------------------------>8--
(global-set-key [(meta p)(h)] 'get-page-html-source)
(defun get-page-html-source()
  "Get html source of web page, whose url can be found in the current line"
  (interactive)
  ;; Get url from current line
  (copy-region-as-kill (re-search-backward "^") (re-search-forward "$"))
  (let* ((url (substring-no-properties (current-kill 0)))
         ;; remove heading spaces
         (url (replace-regexp-in-string "^ +" "" url))
         (html_file "~/html_source.html"))
    ;; Get title of web page, with the help of functions in url.el
    (with-current-buffer (url-retrieve-synchronously url)
      (write-file html_file))
    ;; convert charset
    ;;(get-file-buffer html_file)
    (set-buffer-file-coding-system 'utf-8)
    (kill-buffer (get-file-buffer html_file))
    ;; open file and bring to the front
    (find-file html_file)
    (goto-char 0)))
;; --8<-------------------------- §separator§ ------------------------>8--
;;; define a shortky in w3m mode, and auto add a "www" field for certain record of bbdb
;; Based on `bbdb-www-grab-homepage'
(defun sdl-bbdb-www-grab-homepage-w3m (record)
  "Grab the current URL and store it in the bbdb database"
  (interactive (list (bbdb-completing-read-one-record
                      "Add WWW homepage for: ")))
  ;; if there is no database record for this person, create one
  (unless record
    (setq record (bbdb-read-new-record))
    (bbdb-invoke-hook 'bbdb-create-hook record))
  (if (bbdb-record-getprop record 'www)
      (bbdb-record-putprop
       record 'www
       (concat (bbdb-record-getprop record 'www) "," w3m-current-url))
    (bbdb-record-putprop record 'www w3m-current-url))
  (bbdb-change-record record t)
  (bbdb-display-records (list record)))

;; enable the feature, if w3m is available
(if (ignore-errors (require 'w3m))
    (progn
      (require 'w3m)
      (define-key w3m-mode-map ":" 'sdl-bbdb-www-grab-homepage-w3m)
      ))
;; --8<-------------------------- §separator§ ------------------------>8--
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)
(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)
(defun remove-w3m-output-garbages ()
  (interactive)
  (let ((buffer-read-only))
    (setf (point) (point-min))
    (while (re-search-forward "[\200-\240]" nil t)
      (replace-match " "))
    (set-buffer-multibyte t))
  (set-buffer-modified-p nil))
;; --8<-------------------------- §separator§ ------------------------>8--
(require 'webjump)
(setq webjump-sites
      '(
        ;; --8<------------------ search engine ------------------------>8--
        ;; search engine
        ("baidu" . [simple-query "www.baidu.com" "www.baidu.com/s?wd=" ""])
        ("bing" . [simple-query "cn.bing.com" "cn.bing.com/search?q=" ""])
        ("google" . [simple-query "www.google.com" "203.208.46.146/search?q=" ""])
        ("yahoo" . [simple-query "au.search.yahoo.com" "au.search.yahoo.com/yhs/search?p=" ""])
        ("iciba" . [simple-query "www.iciba.com" "www.iciba.com/" ""])
        ;; --8<------------------ search engine ------------------------>8--

        ;; --8<------------------ ebook ------------------------>8--
        ("book-douban" . [simple-query "book.douban.com" "book.douban.com/subject_search?cat=1001&search_text=" ""])
        ("book-yinian" . "www.inien.com/w/#/Index")
        ("book-wenku" . [simple-query "wenku.baidu.com" "wenku.baidu.com/search?word=" ""])
        ("book-iask" . [simple-query "ishare.iask.sina.com.cn" "ishare.iask.sina.com.cn/search.php?key=" ""])
        ;; --8<------------------ ebook ------------------------>8--

        ;; --8<------------------ paper ------------------------>8--
        ("paper-citeseerx" . [simple-query "citeseerx.ist.psu.edu" "citeseerx.ist.psu.edu/search?submit=Search&sort=rel&q=" ""])
        ;; --8<------------------ paper ------------------------>8--

        ;; --8<------------------ life ------------------------>8--
        ;;TODO: keyword need to be escaped
        ("taobao" . [simple-query "www.taobao.com" "s.taobao.com/search?q=" ""])
        ("movie-douban" . [simple-query "movie.douban.com" "movie.douban.com/subject_search?cat=1002&search_text=" ""])
        ("music-douban" . [simple-query "music.douban.com" "music.douban.com/subject_search?cat=1003&search_text=" ""])
        ;; --8<------------------ life ------------------------>8--

        ;; --8<------------------ emacs ------------------------>8--
        ("emacswiki" . [simple-query "www.emacswiki.org/emacs" "www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi&sa=Search&siteurl=www.emacswiki.org%2Femacs%2F&q=" ""])
        ;; --8<------------------ emacs ------------------------>8--

        ;; --8<------------------ programming ------------------------>8--
        ("linux apps" . "www.appwatch.com/Linux/")
        ("erlang manual" . "www.erlang.org/doc/man/erlang.html")
        ;; --8<------------------ programming ------------------------>8--

        ;; --8<------------------ personal ------------------------>8--
        ("matoushan" . "www.matoushan.co.cc")
        ("rdaccount" . "file:///home/denny/backup/essential/Dropbox/private_data/backup_large/rd-accounting/code/flex/bin-debug/index.html")
        ;; --8<------------------ personal ------------------------>8--

        ;; --8<------------------ misc ------------------------>8--
        ("slideshare" . "www.slideshare.net")
        ;; --8<------------------ misc ------------------------>8--
        ))
;; --8<-------------------------- §separator§ ------------------------>8--
(global-set-key [(meta j)] 'webjump)
;; C-u super j: browse webjump link in the way of w3m, instead of default web browser
(defun webjump (use-w3m-p)
  "The behaviour is different from standard webjump in the following:
 - Users can input web host and search keyword in a single inpute, instead of two
 - User can choose whether to view link in w3m or not, by given the use-w3m-p parameter
 - Set the default web host as google
 - The matching of web host is case insensitive
 "
  (interactive "P")
  (let* ((completion-ignore-case t) user-input
         search-engine search-keywords item name expr)
    ;; read customer input for search engine and search keywords, like "google emacs webjump"
    (make-local-variable 'minibuffer-local-completion-map)
    (define-key minibuffer-local-completion-map " " nil)
    (setq user-input (split-string
                      (completing-read "WebJump to site: " webjump-sites nil nil "google ")
                      " "))
    (setq search-engine (car user-input))
    (setq search-keywords (mapconcat #'identity
                                     (cdr user-input) " "))
    (setq item (assoc-string search-engine webjump-sites nil))
    (setq name (car item))
    (setq expr (cdr item))
    (when use-w3m-p
      (make-local-variable 'browse-url-browser-function)
      (setq browse-url-browser-function 'w3m-browse-url))
    (browse-url (webjump-url-fix
                 (cond ((not expr) "")
                       ((stringp expr) expr)
                       ((vectorp expr) (webjump-builtin-keywords expr name search-keywords))
                       ((listp expr) (eval expr))
                       ((symbolp expr)
                        (if (fboundp expr)
                            (funcall expr name)
                          (error "WebJump URL function \"%s\" undefined"
                                 expr)))
                       (t (error "WebJump URL expression for \"%s\" invalid"
                                 name)))))))

(defun webjump-builtin-keywords (expr name &optional keywords)
  "If keywords are given, no need to ask users' input"
  (if (and keywords (not (string-equal keywords "")))
      (concat (aref expr 2) (webjump-url-encode keywords) (aref expr 3))
      (webjump-builtin expr name)))
;; --8<-------------------------- §separator§ ------------------------>8--
(setq browse-url-generic-program "/usr/bin/firefox")
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: web-browse-setting.el ends here
