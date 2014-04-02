;; -*- coding: utf-8 -*-
;; File: sns-setting.el -- social network stuff
;;
;; Author: Denny Zhang(filebat.mark@gmail.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2014-01-24 12:07:44>
;; --8<-------------------------- separator ------------------------>8--
(setq erc-server-coding-system '(utf-8 . utf-8))
(setq erc-nick "DennyZhang"
      erc-user-full-name "Denny Zhang"
      erc-prompt-for-password nil
      )
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      ;;'(("freenode.net" "#emacs" "##linux" "#ustack")))
      '(("freenode.net" "#openstack-infra" "#openstack-dev" "#openstack-meeting"
         "#openstack-meeting-alt" "#openstack-qa")))

(erc-match-mode 1)
(setq erc-keywords '("emacs" "gnus" "linux"))
;;(setq erc-pals '("rms"))
(setq erc-ignore-list nil)
(setq erc-hide-list '("JOIN" "PART" "QUIT" "MODE"))
;;(erc) ;; auto login ;; TODO add try.. catch
;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/jabber"))
(require 'jabber)
(setq jabber-account-list
      '(("filebat.mark@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))
;; --8<-------------------------- separator ------------------------>8--
(setq jabber-avatar-cache-directory (concat DENNY_CONF
                                            "/jabber/avatars/")
      jabber-history-dir (concat DENNY_CONF "/jabber/history/")
      jabber-use-global-history t
      ;;jabber-history-enabled t
      jabber-backlog-number 40
      jabber-backlog-days 30
      jabber-autoaway-timeout 6)

(custom-set-faces
 '(jabber-roster-user-online
   ((t (:foreground "forest green" :slant normal :weight bold))))
 '(jabber-roster-user-away
   ((t (:foreground "LightSteelBlue3" :slant italic :weight normal))))
 '(jabber-title-large
   ((t (:inherit variable-pitch :weight bold :height 1.5 :width ultra-expanded))))
 '(jabber-title-medium
   ((t (:inherit variable-pitch :foreground "#E8E8E8" :weight
                 bold :height 1.1 :width semi-expanded))))
 '(jabber-title-small
   ((t (:inherit variable-pitch :foreground "#adc4e3" :weight
                 bold :height 0.7 :width semi-expanded)))))

(load-file (concat EMACS_VENDOR "/autosmiley/autosmiley.el"))
(add-hook 'jabber-chat-mode-hook 'autosmiley-mode)

;; dynamically set status string
(defadvice jabber-send-presence (after let activate)
  (setq *jabber-current-status* (get-motto nil 35))
  (setq jabber-default-status *jabber-current-status*))

;; when login, set away as default status
(add-hook 'jabber-post-connect-hooks #'(lambda (x) (jabber-send-away-presence)) t)
;; Don’t disturb me if someone change presence status
(remove-hook 'jabber-alert-presence-hooks 'jabber-presence-echo)
;; --8<-------------------------- separator ------------------------>8--
;; add below to avoid throwing exception for invalid avatar images
(add-to-list 'image-type-header-regexps  '("\\`\211PNG\n\n" . png))
;; --8<-------------------------- separator ------------------------>8--
;; File: sns-setting.el ends here
