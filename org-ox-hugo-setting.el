;; ==========================================
;; ox-hugo auto-export + Hugo build + URL injection
;; Compatible with older Org-mode (no org-first-heading-p)
;; ==========================================

(require 'ox-hugo)
;; Use YAML front matter instead of TOML

(setq org-hugo-front-matter-format 'yaml)
;; Default Hugo base directory (used if Org file does not specify #+hugo_base_dir:)
(setq org-hugo-default-base-dir "~/Dropbox/private_data/part_time/devops_blog/quantcodedenny.com")

(defun my/org-hugo-get-base-dir ()
  "Get Hugo base directory for current buffer.
Try file-level keyword `#+hugo_base_dir:` or fallback to `org-hugo-default-base-dir`."
  (or (ignore-errors (org-hugo--parse-keyword-file "hugo_base_dir"))
      org-hugo-default-base-dir))

(defun my/org-auto-export-hugo-build-url ()
  "Auto-export Org buffer to Hugo, build site, and insert URL for the root Org entry and Markdown."
  (interactive)
  (when (and (derived-mode-p 'org-mode)
             (string-equal (file-name-extension buffer-file-name) "org")
             (file-in-directory-p buffer-file-name
                                  (expand-file-name "~/Dropbox/private_data/part_time/devops_blog/quantcodedenny.com/org-files/")))
    
    (save-excursion
      ;; --- 1. Robustly navigate to root headline for variable extraction ---
      (when (re-search-backward "^\\* " nil t)
        (goto-char (match-beginning 0)))

      ;; Get properties
      (let* ((export-file-name (org-entry-get nil "EXPORT_FILE_NAME"))
             (noexport (org-entry-get nil "noexport")))
        
        ;; Skip if no EXPORT_FILE_NAME or if :noexport: property exists
        (unless (or (not export-file-name)noexport)

          (let* ((base-dir (my/org-hugo-get-base-dir))
                 ;; Note: Assuming my/org-get-root-property is defined elsewhere or using standard org-entry-get
                 (section (or (org-entry-get nil "EXPORT_HUGO_SECTION")
                              (ignore-errors (org-hugo--parse-keyword-file "EXPORT_HUGO_SECTION"))
                              "posts"))
                 (file-name (or (org-entry-get nil "EXPORT_FILE_NAME")
                                (file-name-base buffer-file-name)))
                 (url (format "https://quantcodedenny.com/%s/%s/" section file-name))
                 (md-file (concat (file-name-as-directory base-dir)
                                  "org-files/" section "/" file-name ".md")))

            ;; Set buffer-local Hugo base dir (ox-hugo requirement)
            (setq-local org-hugo-base-dir base-dir)

            (condition-case err
                (progn
                  ;; 1) Insert/update URL for the *root Org entry* and SAVE
                  (with-silent-modifications
                    (save-excursion
                      ;; Re-navigate to root headline after export
                      (when (re-search-backward "^\\* " nil t)
                        (goto-char (match-beginning 0)))
                  
                      (save-restriction
                        (org-narrow-to-subtree) ; <-- ESSENTIAL: Narrows the search area
                        (goto-char (point-min))
                        (cond
                         ((re-search-forward "^#\\+URL:.*$" nil t)
                          (replace-match (concat "#+URL: " url) nil nil))
                         ((re-search-forward "^URL:.*$" nil t)
                          (replace-match (concat "URL: " url) nil nil))
                         (t
                          (goto-char (point-min))
                          (forward-line 1)
                          (insert (concat "URL: " url "\n"))))
                        ) ; save-restriction restores full view

                      ;; SAVE WITHOUT HOOKS OR PROMPT
                      (write-region (point-min) (point-max) (buffer-file-name)
                                    nil   ; don't append
                                    nil   ; visit file after write (nil is fine if buffer already visiting)
                                    nil)  ; must be new? NO, nil prevents overwrite prompt
                      ) ; save-excursion restores cursor
                    ) ; with-silent-modifications resets flag

                  ;; 2) Export Org → Markdown (This operation moves the cursor!)
                  (org-hugo-export-wim-to-md t) ;; the t => force overwrite, no confirmation
                  (message "[ox-hugo] Exported to Markdown in section '%s'" section)

                  ;; 3) Insert/update front matter in Markdown
                  (when (file-exists-p md-file)
                    (with-temp-buffer
                      (insert-file-contents md-file)
                      (goto-char (point-min))
                      (if (re-search-forward "^url:.*$" nil t)
                          (replace-match (concat "url: " url) nil nil)
                        (goto-char (point-min))
                        (if (re-search-forward "^---" nil t)
                            (progn
                              (forward-line 1)
                              (insert (concat "url: " url "\n")))
                          (goto-char (point-min))
                          (insert "---\nurl: " url "\n---\n"))))
                    (write-region (point-min) (point-max) md-file))
              
                  ;; 4) Build Hugo site
                  (let ((default-directory base-dir))
                    (let ((exit-code (call-process "hugo" nil nil nil "-d" "docs")))
                      (when (/= exit-code 0)
                        (message "[hugo] Build failed with exit code %d" exit-code))))
                  )

              ;; ---- error handler ----
              (error
               (message "[ox-hugo] Export/build failed: %s"
                        (error-message-string err))))
            ))))))

;; Hook: only trigger after saving Org files
(add-hook 'after-save-hook 'my/org-auto-export-hugo-build-url)

;; Optional: automatically update lastmod in Hugo front matter
(setq org-hugo-auto-set-lastmod t)

;; Ensure Emacs can find Hugo binary (adjust path if needed)
(setenv "PATH" (concat (getenv "PATH") ":/opt/homebrew/bin"))
(setq exec-path (append exec-path '("/opt/homebrew/bin")))
(setenv "PATH" (concat (getenv "PATH") ":~/homebrew/bin"))
(setq exec-path (append exec-path '("~/homebrew/bin")))
