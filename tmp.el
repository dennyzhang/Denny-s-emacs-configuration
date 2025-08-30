;; -*- coding: utf-8 -*-
;; File: tmp.el -- tentatively try new features/configuration with limited impact
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2015, http://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2023-02-01 10:35:32>
;; --8<-------------------------- separator ------------------------>8--
(require 'org-crypt)
(require 'epa-file)
(epa-file-enable)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "")
;;this makes gpg ask gpg-agent instead of emacs
(setf epa-pinentry-mode 'ask)
;; File: tmp.el ends here
