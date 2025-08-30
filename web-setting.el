;; -*- coding: utf-8 -*-
;; File: web-setting.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2023-03-16 15:07:44>
;;
;; --8<-------------------------- separator ------------------------>8--
;; When copying in w3m, also copy link in the format of org-mode-link
;;(load-file (concat CONF-EMACS-VENDOR "/org-w3m/org-w3m.el"))
;; (require 'org-w3m)
;; --8<-------------------------- separator ------------------------>8--
;; Insinuate with BBDB
(when (featurep 'bbdb)
  (provide 'w3)
  (bbdb-initialize 'w3)
)

(add-to-list 'load-path (concat CONF-EMACS-VENDOR "/emacs-w3m"))
(if window-system (require 'w3m-load))

(custom-set-variables
 '(w3m-form-input-map-mode-hook (quote (flyspell-mode)))
 '(w3m-tab-width 4)
 '(w3m-fill-column 100)
 ;; enable emacs-w3m to use cookies
 '(w3m-use-cookies t)
 ;; Never load the crashed sessions automatically
 '(w3m-session-load-crashed-sessions nil)
 '(w3m-default-display-inline-images t)
 ;;(browse-url-browser-function 'w3m-browse-url)
 '(w3m-home-page "http://www.google.com/ncr")
 '(w3m-command-arguments '("-cookie" "-F"))
 '(w3m-use-title-buffer-name t)
 '(w3m-view-this-url-new-session-in-background t)
 '(w3m-key-binding (quote info)))

(defun ffap-w3m-other-window (url &optional new-session)
  "Browse url in w3m.
If current frame has only one window,
create a new window and browse the webpage"
  (interactive (progn
                 (require 'browse-url)
                 (browse-url-interactive-arg "Emacs-w3m URL: ")))
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url new-session)))
;; --8<-------------------------- separator ------------------------>8--
;;alt+p t: get title of web page, whose url can be found in the current line.
(org-defkey org-mode-map [(meta p)(t)] 'get-page-title)
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
            (setq web_title_str
                  (decode-coding-string web_title_str (intern coding_charset)))
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
              (replace-match
               (format "%s: %s%s" "web page" web_title_str (make-string 50 32)) nil nil)
            (goto-char point-orig)
            (reindent-then-newline-and-indent)
            ;; wash content
            (setq web_title_str (replace-regexp-in-string "^[ \n]*" "" web_title_str))
            (setq web_title_str (replace-regexp-in-string "[ \n]*$" "" web_title_str))
            (insert web_title_str)))
        ))
    ))
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
(require 'webjump)
(setq webjump-sites
      '(
        ;; search engine
        ("baidu" . [simple-query "www.baidu.com" "www.baidu.com/s?wd=" ""])
        ("gist" . [simple-query "gist.github.com" "gist.github.com/gists/search?q=" ""])
        ("google" . [simple-query "www.google.com" "www.google.com.hk/search?q=" ""])
        ("duckduckgo" . [simple-query "duckduckgo.com" "duckduckgo.com/?q=" ""])
        ("yahoo" . [simple-query "au.search.yahoo.com" "au.search.yahoo.com/yhs/search?p=" ""])
        ("iciba" . [simple-query "www.iciba.com" "www.iciba.com/" ""])

        ("paper-citeseerx" . [simple-query "citeseerx.ist.psu.edu" "citeseerx.ist.psu.edu/search?submit=Search&sort=rel&q=" ""])
        ("alexa" . [simple-query "www.alexa.com" "www.alexa.com/siteinfo/www." ""])
        ("fanyi" . [simple-query "fanyi.baidu.com" "fanyi.baidu.com/translate#en/zh/" ""])
        ;; --8<------------------ life ------------------------>8--
        ;;TODO: keyword need to be escaped
        ("taobao" . [simple-query "www.taobao.com" "s.taobao.com/search?q=" ""])
        ("movie-douban" . [simple-query "movie.douban.com" "movie.douban.com/subject_search?cat=1002&search_text=" ""])
        ("music-douban" . [simple-query "music.douban.com" "music.douban.com/subject_search?cat=1003&search_text=" ""])
        ("emacswiki" . [simple-query "www.emacswiki.org/emacs" "www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi&sa=Search&siteurl=www.emacswiki.org%2Femacs%2F&q=" ""])

        ;; --8<------------------ programming ------------------------>8--
        ("linux apps" . "www.appwatch.com/Linux/")
        ("erlang manual" . "www.erlang.org/doc/man/erlang.html")

        ("slideshare" . "www.slideshare.net")
        ))
;; --8<-------------------------- separator ------------------------>8--
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
;; --8<-------------------------- separator ------------------------>8--
(setq browse-url-generic-program "/usr/bin/firefox")
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat CONF-EMACS-VENDOR "/hfyview/hfyview.el"))
(defun w3m-browse-buffer (&optional buffer)
  "Use w3m browser buffer BUFFER."
  (interactive "bBuffer to browse use w3m: ")
  (unless buffer (setq buffer (current-buffer)))
  (let* ((file (buffer-file-name buffer))
         (name (buffer-name buffer)))
    (if file
        (w3m-goto-url-new-session file)
      (with-current-buffer buffer
        (save-excursion
          (mark-whole-buffer)
          (call-interactively 'copy-region-as-kill-nomark)))
      (let* ((new-name
              (concat
               w3m-buffer-name-prefix
               "-"
               (if (string= "*" (substring name 0 1))
                   (substring name 1)
                 (concat name "*"))))
             (new-buffer (get-buffer-create new-name)))
        (switch-to-buffer new-buffer)
        (call-interactively 'yank)
        (w3m-buffer)
        (w3m-mode)
        (setq w3m-current-title (buffer-name))))))

;; --8<-------------------------- separator ------------------------>8--
;;(add-to-list 'w3m-display-hook 'wash-w3m-buffer) ;; TODO denny
(defun wash-w3m-buffer(&optional url)
  (interactive)
  (let* ((line-width 10)
         (short-line-regex (format "^.\\{1,%d\\}$" line-width)))
    (save-excursion
      (goto-char (point-min))
      (read-only-mode -1)
      (rr " +$" "" nil (point-min) (point-max))
      ;;(flush-lines short-line-regex (point-min) (point-max)) ;; TODO here
      (rr "\n\n+" "\n\n" nil (point-min) (point-max))
      (read-only-mode 1)
      ))
  )
;; --8<-------------------------- separator ------------------------>8--
;; File: web-setting.el ends here
