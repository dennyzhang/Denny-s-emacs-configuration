;; -*- coding: utf-8 -*-
;; File: multimediea-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-09-17 22:50:39>
;;
;; --8<-------------------------- separator ------------------------>8--
;;emms
(add-to-list 'load-path (concat EMACS_VENDOR "/emms/"))
(load "emms")
(require 'emms-setup)
(require 'emms-cache)
(require 'emms-playing-time)
(emms-standard)
(emms-default-players)
(require 'emms-playlist-mode)
;;;emms shortcut
(global-set-key (kbd "C-c e l") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e s") 'emms-start)
(global-set-key (kbd "C-c e e") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-pause)
(global-set-key (kbd "C-c e f") 'emms-play-playlist)
(global-set-key (kbd "C-c e o") 'emms-play-file)
(global-set-key (kbd "C-c e d") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e a") 'emms-add-directory-tree)
;; --8<-------------------------- separator ------------------------>8--
(setq emms-playlist-default-major-mode 'emms-playlist-mode)
(add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
;;(add-to-list 'emms-info-functions 'kid-emms-info-simple) ;; TODO
;;(setq emms-track-description-function 'kid-emms-info-track-description) ;; TODO
(when (fboundp 'emms-cache) (emms-cache 1))

(defun kid-emms-info-simple (track)
  "Get info from the filename."
  (when (eq 'file (emms-track-type track))
    (let ((regexp "/\\([^/]+\\)/\\([^/]+\\)\\.[^.]+$")
          (name (emms-track-name track)))
      (if (string-match regexp name)
          (progn
            (emms-track-set track 'info-artist (match-string 1 name))
            (emms-track-set track 'info-title (match-string 2 name)))
        (emms-track-set track
                        'info-title
                        (file-name-nondirectory name))))))

(defun kid-emms-info-track-description (track)
  "Return a description of the current track."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title)))
    (format "%-10s +| %s" (or artist "") title)))
;; --8<-------------------------- separator ------------------------>8--
;; volume management
(require 'emms-volume)
(global-set-key (kbd "C-c e = ") 'emms-volume-raise)
(global-set-key (kbd "C-c e -") 'emms-volume-lower)
;; --8<-------------------------- separator ------------------------>8--
;; Show the current track each time EMMS
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "NP: %s")

(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'emms-player-simple)
(setq emms-directory (concat DENNY_CONF "../emms/"))
;; set directory to look for media files.
(setq emms-source-file-default-directory "~/backup/multimediea/music/")
;; use faster finding facility if you have GNU find
(setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
;; --8<-------------------------- separator ------------------------>8--
(setq emms-browser-default-covers
      (list (concat DENNY_CONF "org-background.png") nil nil))
;; let compilation tracks be displayed together
(setq emms-browser-get-track-field-function
      'emms-browser-get-track-field-use-directory-name)
;; --8<-------------------------- separator ------------------------>8--
(require 'emms-info-libtag)
(require 'emms-info)
(require 'emms-player-mpg321-remote)
(require 'emms-player-mplayer)
(emms-devel)
(emms-default-players)
(push 'emms-player-mpg321-remote emms-player-list)
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)
(setq emms-info-asynchronously t
      later-do-interval 0.0001
      emms-info-functions '(emms-info-libtag))
;; --8<-------------------------- separator ------------------------>8--
(require 'emms-mode-line)
(require 'emms-mode-line-icon)
;; Icon setup.
(setq emms-mode-line-icon-before-format "["
      emms-mode-line-format " %s]"
      emms-playing-time-display-format "%s ]"
      emms-mode-line-icon-color "lightgrey")
(setq global-mode-string '("" emms-mode-line-string " " emms-playing-time-string))
(defun emms-mode-line-icon-function ()
  (concat " "
          emms-mode-line-icon-before-format
          (propertize "NP:" 'display emms-mode-line-icon-image-cache)
          (format emms-mode-line-format (emms-track-get
                                         (emms-playlist-current-selected-track)
                                         'info-title))))

(setq emms-playlist-buffer-name "*EMMS Playlist*"
      emms-playlist-mode-open-playlists t)
;; --8<-------------------------- separator ------------------------>8--
(define-key emms-playlist-mode-map (kbd "<right>") (lambda () (interactive) (emms-seek +10)))
(define-key emms-playlist-mode-map (kbd "<left>") (lambda () (interactive) (emms-seek -10)))
(define-key emms-playlist-mode-map (kbd "<up>") (lambda () (interactive) (emms-seek +60)))
(define-key emms-playlist-mode-map (kbd "<down>") (lambda () (interactive) (emms-seek -60)))
;; --8<-------------------------- separator ------------------------>8--
;; players
(setq emms-player-mpg321-command-name "mpg321"
      emms-player-mpg321-parameters '("-o" "alsa")
      emms-player-mplayer-command-name "mplayer"
      emms-player-list '(emms-player-mplayer
                         emms-player-mplayer-playlist
                         emms-player-ogg123
                         emms-player-mpg321))
;; my customizable playlist format
(defun bigclean-emms-info-track-description (track)
  "Return a description of the current track."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title))
        (album (emms-track-get track 'info-album))
        (ptime (emms-track-get track 'info-playing-time))
        (name (emms-track-get track 'name))
        )
    (if name
        (format
         "%s %s %s %s %5s:%-5s"
         (if name name "") (if artist artist "")
         (if title title "") (if album album "")
         (/ (if ptime ptime 0) 60) (% (if ptime ptime 0) 60)
         ))
    ))
;; --8<-------------------------- separator ------------------------>8--
;; score songs
(require 'emms-score)
(emms-score 1)
;; --8<-------------------------- separator ------------------------>8--
(define-key emms-playlist-mode-map (kbd "S u") 'emms-score-up-file-on-line)
(define-key emms-playlist-mode-map (kbd "S d") 'emms-score-down-file-on-line)
(define-key emms-playlist-mode-map (kbd "S o") 'emms-score-show-file-on-line)
(define-key emms-playlist-mode-map (kbd "S l") 'emms-score-less-tolerant)
(define-key emms-playlist-mode-map (kbd "S m") 'emms-score-more-tolerant)
(define-key emms-playlist-mode-map (kbd "S t") 'emms-score-set-tolerance)
(define-key emms-playlist-mode-map (kbd "S s") 'emms-score-show-playing)
(define-key emms-playlist-mode-map (kbd "S U") 'emms-score-up-playing)
(define-key emms-playlist-mode-map (kbd "S D") 'emms-score-down-playing)
(define-key emms-playlist-mode-map (kbd ".") 'emms-playlist-mode-center-current)
;; --8<-------------------------- separator ------------------------>8--
(require 'emms-i18n)
(require 'emms-history)
;; coding settings
(setq emms-info-mp3info-coding-system 'gbk
      emms-cache-file-coding-system 'utf-8
      ;; emms-i18n-default-coding-system '(utf-8 . utf-8)
      )
;; --8<-------------------------- separator ------------------------>8--
(defun emms-browser-lookup-multi ()
  (interactive)
  (emms-browser-lookup-wikipedia 'info-artist)
  (emms-browser-lookup-wikipedia 'info-album)
  (emms-browser-lookup-pitchfork 'info-artist))
;; --8<-------------------------- separator ------------------------>8--
(setq emms-last-played-format-alist
      '(((emms-last-played-seconds-today) . "[%m-%d %H:%M %a]")
        (604800 . "%a %H:%M") ; this week
        ((emms-last-played-seconds-month) . "%d")
        ((emms-last-played-seconds-year) . "%m/%d")
        (t . "%Y/%m/%d")))

(eval-after-load "emms"
  '(progn
     (setq xwl-emms-playlist-last-track nil)
     (setq xwl-emms-playlist-last-indent "\\")

     (defun xwl-emms-track-description-function (track)
       "Return a description of the current track."
       (let* ((name (emms-track-name track))
              (type (emms-track-type track))
              (short-name (file-name-nondirectory name))
              (play-count (or (emms-track-get track 'play-count) 0))
              (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
              (empty "..."))
         (prog1
             (case (emms-track-type track)
               ((file url)
                (let* ((artist (or (emms-track-get track 'info-artist) empty))
                       (year (emms-track-get track 'info-year))
                       (playing-time (or (emms-track-get track 'info-playing-time) 0))
                       (min (/ playing-time 60))
                       (sec (% playing-time 60))
                       (album (or (emms-track-get track 'info-album) empty))
                       (tracknumber (emms-track-get track 'info-tracknumber))
                       (short-name (file-name-sans-extension
                                    (file-name-nondirectory name)))
                       (title (or (emms-track-get track 'info-title) short-name))

                       ;; last track
                       (ltrack xwl-emms-playlist-last-track)
                       (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
                                    empty))
                       (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
                                   empty))

                       (same-album-p (and (not (string= lalbum empty))
                                          (string= album lalbum))))
                  (format "%15s %3d %-16s%-30s%-20s%-10s%s"
                          (emms-last-played-format-date last-played)
                          play-count
                          artist

                          ;; Combine indention, tracknumber, title.
                          (concat
                           (if same-album-p ; indention by album
                               (setq xwl-emms-playlist-last-indent
                                     (concat " " xwl-emms-playlist-last-indent))
                             (setq xwl-emms-playlist-last-indent "\\")
                             "")
                           (if (and tracknumber ; tracknumber
                                    (not (zerop (string-to-number tracknumber))))
                               (format "%02d." (string-to-number tracknumber))
                             "")
                           title ; title
                           )

                          ;; album
                          (cond ((string= album empty) empty)
                                ;; (same-album-p " ")
                                (t (concat "《" album "》")))

                          (or year empty)
                          (if (or (> min 0) (> sec 0))
                              (format "%02d:%02d" min sec)
                            empty))))
               ((url)
                (concat (symbol-name type) ":" name))
               (t
                (format "%-3d%s"
                        play-count
                        (concat (symbol-name type) ":" name))))
           (setq xwl-emms-playlist-last-track track))))

     (setq emms-track-description-function
           'xwl-emms-track-description-function)
     ))
;; --8<-------------------------- separator ------------------------>8--
(setq emms-score-enabled-p t) ;; enable emms scoring
(setq emms-source-playlist-default-format 'native)
;; --8<-------------------------- separator ------------------------>8--
(require 'emms-lyrics)
(setq emms-lyrics-dir (concat emms-source-file-default-directory "/lyrics"))
(defun emms-google-for-lyrics ()
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?q = "
    (replace-regexp-in-string
     " +" "+"
     (concat
      "lyrics "
      (delete ?-
              (emms-track-description (emms-playlist-current-selected-track)))
      )))))
;; --8<-------------------------- separator ------------------------>8--
(require 'emms-mark)
;; auto enable emms-mark
(add-hook 'emms-playlist-mode-hook 'emms-mark-mode)
;; sort emms playlist by decrease play count
(setq emms-playlist-sort-function #'(lambda ()
                                     (interactive)
                                     (let ((current-prefix-arg t))
                                       (emms-playlist-sort-by-play-count))))
(defadvice emms (after call-interactively activate)
  (emms-sort))
;; set default-directory correctly, for checking media files easily in emms playlist buffer
(add-hook 'emms-playlist-mode-hook
          #'(lambda()
             (setq default-directory emms-source-file-default-directory)))
(add-hook 'kill-emacs-hook 'emms-stop t)
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'auto-mode-alist '("\\.jpeg$" . image-mode))
(add-to-list 'auto-mode-alist '("\\.jpg$" . image-mode))
(define-key image-mode-map (kbd "n") #'(lambda() (interactive) (rotate-image-in-directory 1)))
(define-key image-mode-map (kbd "p") #'(lambda() (interactive) (rotate-image-in-directory -1)))
(defun rotate-image-in-directory (N)
  "Enable image-mode to view previous/next image"
 (interactive)
 (let* ((current-file (file-name-nondirectory (buffer-file-name)))
        (old-buffer (current-buffer))
        (file-list (directory-files "." nil ".*jpg\\|.*jpeg"))
        (file-count (length file-list))
        index)
   (setq index (mod
                (+ file-count (+ N (position current-file file-list :test #'equal)))
                file-count))
   (find-file (nth index file-list))
   (kill-buffer old-buffer)
   ))
;; --8<-------------------------- separator ------------------------>8--
(setq emms-org-file (concat DENNY_CONF "/org_data/org_share/music.org"))
(define-key emms-playlist-mode-map (kbd "M-a")
  #'(lambda () (interactive) (update-music-to-org-file emms-org-file)))
;; (update-music-to-org-file "/home/denny/backup/essential/Dropbox/private_data/emacs_stuff/org_data/org_share/music.org")
(defun update-music-to-org-file (org-file)
  (let* ((track (get-text-property (point) 'emms-track))
         (last-played (emms-track-get track 'last-played))
         (play-count (emms-track-get track 'play-count))
         (name (emms-track-get track 'name))
         (metadata (emms-track-get track 'metadata))
         (info-artist (emms-track-get track 'info-artist))
         (info-title (emms-track-get track 'info-title))
         (info-album (emms-track-get track 'info-album))
         (info-tracknumber (emms-track-get track 'info-tracknumber))
         (info-year (emms-track-get track 'info-year))
         (info-play-time (emms-track-get track 'info-play-time))
         (info-mtime (emms-track-get track 'info-mtime))
         (music-name (file-name-nondirectory name))
         (old-buffer (current-buffer))
         )
    (if (null name) (setq name ""))
    (if (null info-artist) (setq info-artist ""))
    (if (null info-title) (setq info-title ""))
    (if (null play-count) (setq play-count "0"))
    (if (null info-album) (setq info-album ""))
    (if (null info-tracknumber) (setq info-tracknumber "0"))
    (if (null info-year) (setq info-year "0"))
    ;; TODO
    ;; (if (null info-playing-time) (setq info-playing-time ""))
    ;; (if (null info-mtime) (setq info-mtime ""))
    ;; (if (null last-layed) (setq last-layed ""))
    (find-file org-file)
    (goto-char (point-min))
    (unless (search-forward-regexp music-name nil t)
      (goto-char (point-max))
      (insert "\n** " music-name "\n")
      )
    ;;(org-set-property "last-played" last-played) ;; TODO
    (org-set-property "play-count" (format "%s" play-count))
    (org-set-property "name" name)
    ;;(org-set-property "metadata" metadata) ;; TODO
    (org-set-property "info-artist" info-artist)
    (org-set-property "info-title" info-title)
    (org-set-property "info-album" info-album)
    (org-set-property "info-tracknumber" info-tracknumber)
    (org-set-property "info-year" info-year)
    ;;(org-set-property "info-play-time" info-play-time) ;; TODO
    ;;(org-set-property "info-mtime" info-mtime) ;; TODO
    (write-file org-file nil)
    (switch-to-buffer old-buffer)
    )
  )

;; (export-orgfile-to-emmsplaylist "/home/denny/backup/multimediea/music/org_share/music.org" "merry" "/home/denny/backup/multimediea/music/playlist/merry.playlist")
(defun export-orgfile-to-emmsplaylist (org-file org-tag playlist-file)
  (interactive)
  (unless (string= mode-name "Org")
    (error "Run current function in org-mode generated by update-music-to-org-file."))
  (let (name play-count info-artist info-title info-album
             info-tracknumber info-year info-playing-time info-mtime last-played
             (result-str
              ";;; This is an EMMS playlist file. Play it with M-x emms-play-playlist\n\(\n")
             ;; TODO: use " instead of '
             (music-record
              (concat "(*track* (type . file) (name . \"%s\") (metadata) (info-artist . \"%s\") "
                      "(info-title . \"%s\") (info-album . \"%s\") (info-tracknumber . \"%s\") "
                      "(info-year . \"%s\") (info-playing-time . 274) (info-mtime 20155 31866) "
                      "(last-played 20356 18351 701762) (play-count . %s))"))
             (old-buffer (current-buffer))
             )
    (save-excursion
      (goto-char 0)
      (while (search-forward-regexp "^\\*\\* " nil t)
        (when (member org-tag (org-get-tags))
          (setq name (org-entry-get nil "name")
                play-count (org-entry-get nil "play-count")
                info-artist (org-entry-get nil "info-artist")
                info-title (org-entry-get nil "info-title")
                info-album (org-entry-get nil "info-album")
                info-tracknumber (org-entry-get nil "info-tracknumber")
                info-year (org-entry-get nil "info-year")
                info-playing-time (org-entry-get nil "info-playing-time")
                info-mtime (org-entry-get nil "info-mtime")
                last-layed (org-entry-get nil "last-layed")
                )
          (if (null name) (setq name ""))
          (if (null info-artist) (setq info-artist ""))
          (if (null info-title) (setq info-title ""))
          (if (null play-count) (setq play-count "0"))
          (if (null info-album) (setq info-album ""))
          (if (null info-tracknumber) (setq info-tracknumber "0"))
          (if (null info-year) (setq info-year "0"))
          ;; TODO
          ;; (if (null info-playing-time) (setq info-playing-time ""))
          ;; (if (null info-mtime) (setq info-mtime ""))
          ;; (if (null last-layed) (setq last-layed ""))
          (setq result-str
                (concat result-str (format music-record name info-artist
                                           info-title info-album
                                           info-tracknumber info-year
                                           play-count)
                        "\n"))
          )
        )
      (setq result-str (concat result-str "\)"))
      (find-file playlist-file)
      (erase-buffer)
      (insert result-str)
      (write-file playlist-file nil)
      (switch-to-buffer old-buffer)
      )
    )
  )
;; (orgfile-last-played-update-current "/home/denny/backup/multimediea/music/org_share/music.org" "王菲--传奇.mp3")
(defun orgfile-last-played-update-current (org-file music-name)
  "Updates the current track in org-mode."
  (save-excursion
    (find-file org-file)
    ;; update play-count
    (let (old-play-count)
      (goto-char (point-min))
      (when (search-forward-regexp music-name nil t)
        (setq old-play-count (string-to-int (org-entry-get nil "play-count")))
        (org-set-property "play-count" (format "%d" (+ 1 old-play-count)))
        )
      (write-file org-file nil)
      (kill-buffer)
      )
    ))

(defadvice emms-last-played-update-current (after if activate)
  "Auto update org-file, when emms is playing"
  (let*
      ((track (emms-playlist-current-selected-track))
       (name (emms-track-get track 'name))
       (music-name (file-name-nondirectory name))
       )
    (orgfile-last-played-update-current emms-org-file music-name)
    )
  )
;;# --8<-------------------------- §separator§ ------------------------>8--
(defalias 'play-all
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/all.playlist"))))

(defalias 'play-merry
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/merry.playlist"))))

(defalias 'play-top
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/top.playlist"))))

(defalias 'play-funny
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/funny.playlist"))))

(defalias 'play-blue
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/blue.playlist"))))

(defalias 'play-active
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/active.playlist"))))

(defalias 'play-old
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/old.playlist"))))

(defalias 'play-soft
  (lambda()
    (interactive)
    (emms-play-playlist
     (concat emms-source-file-default-directory "/playlist/soft.playlist"))))

(defun refresh-emms-playlist-from-org-file ()
  (interactive)
  (let ((tag-list '("merry" "funny" "blue" "old" "top" "old" "active" "soft")))
    (dolist (tag tag-list)
      (export-orgfile-to-emmsplaylist
       emms-org-file tag
       (format "%s/playlist/%s.playlist" emms-source-file-default-directory tag)))))
;; --8<-------------------------- separator ------------------------>8--
;; File: multimediea-setting.el
