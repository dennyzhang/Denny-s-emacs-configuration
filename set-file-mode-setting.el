;; -*- coding: utf-8 -*-
;; File: set-file-mode-setting.el
;; Author: Denny Zhang
;; Updated: <2025-08-30>
;; Purpose: Set up file associations and minor mode hooks

;; ------------------ Dockerfile ------------------
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-to-list 'auto-mode-alist '("*dockerfile\\'" . dockerfile-mode))

;; ------------------ Minor modes for specific files ------------------
(defun my-enable-minor-modes-for-file ()
  "Enable minor modes for certain files."
  (cond
   ((string-match-p "^filebat.txt$" (buffer-name))
    (company-mode 1)
    (rainbow-mode 1))
   ((string-match-p "^tmp$" (buffer-name))
    (company-mode 1)
    (rainbow-mode 1)
    (flyspell-mode 1))
   ((string-match-p "^rholog.txt$" (buffer-name))
    (log4j-mode 1))))

(add-hook 'find-file-hook 'my-enable-minor-modes-for-file)

;; ------------------ Language modes ------------------
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.mcconf\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.cconf\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4
                  standard-indent 4
                  indent-tabs-mode nil)))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(autoload 'rust-mode "rust-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.groovy\\'" . java-mode))
(add-to-list 'auto-mode-alist '("\\.gvy\\'" . java-mode))
(add-to-list 'auto-mode-alist '("\\.Jenkinsfile\\'" . java-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.stp\\'" . systemtap-mode))
(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))
(add-to-list 'auto-mode-alist '("\\.app\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.conf\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\-Env-In-DO.md\\'" . org-mode))
(add-to-list 'auto-mode-alist '("README.md\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.mxml\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.thrift\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\.erb\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\'" . html-mode))

;; ------------------ nxml-mode customization ------------------
(defun my-nxml-setup ()
  "Custom settings for nxml-mode."
  (setq tab-width 2
        indent-tabs-mode nil
        nxml-child-indent 2
        nxml-attribute-indent 2))
(add-hook 'nxml-mode-hook 'my-nxml-setup)

;; ------------------ hide trailing whitespace ------------------
(defun my-hide-trailing-whitespace (mode-hook)
  (add-hook mode-hook (lambda ()
                        (setq-local show-trailing-whitespace nil))))

(mapc 'my-hide-trailing-whitespace
      '(comint-mode-hook
        ibuffer-mode-hook
        compilation-mode-hook
        shell-mode-hook
        eshell-mode-hook
        dired-mode-hook
        erc-mode-hook))
