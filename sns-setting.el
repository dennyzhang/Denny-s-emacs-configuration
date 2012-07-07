;; -*- coding: utf-8 -*-
;; File: sns-setting.el -- social network stuff
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-07 22:04:21>
;; --8<-------------------------- separator ------------------------>8--
(setq erc-server-coding-system '(utf-8 . utf-8))
(setq erc-nick "DennyZhang"
      erc-user-full-name "Denny Zhang")
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "##linux")))
(erc-match-mode 1)
(setq erc-keywords '("emacs" "gnus" "linux"))
;;(setq erc-pals '("rms"))
(setq erc-ignore-list nil)
(setq erc-hide-list '("JOIN" "PART" "QUIT" "MODE"))
;; --8<-------------------------- separator ------------------------>8--
;; File: sns-setting.el ends here
