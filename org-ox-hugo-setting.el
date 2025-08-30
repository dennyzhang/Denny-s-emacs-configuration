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

(defun my/org-first-heading-p ()
  "Return t if point is at the first top-level heading."
  (and (org-at-heading-p)
       (= (org-outline-level) 1)
       (= (point) (point-min))))

(defun my/org-auto-export-hugo-build-url ()
  "Auto-export Org buffer to Hugo, build site, and insert URL in Org and Markdown."
  (when (and (derived-mode-p 'org-mode)
             (string-equal (file-name-extension buffer-file-name) "org"))
    (let* ((base-dir (my/org-hugo-get-base-dir))
           (section (or (org-entry-get nil "EXPORT_HUGO_SECTION")
                        (ignore-errors (org-hugo--parse-keyword-file "EXPORT_HUGO_SECTION"))
                        "posts"))
           (file-name (or (org-entry-get nil "EXPORT_FILE_NAME")
                          (file-name-base buffer-file-name)))
           (url (format "https://quantcodedenny.com/docs/%s/%s/" section file-name))
           (md-file (concat (file-name-as-directory base-dir)
                            "org-files/" section "/" file-name ".md")))
      ;; Set buffer-local Hugo base dir
      (setq-local org-hugo-base-dir base-dir)
      (condition-case err
          (progn
            ;; 1️⃣ Export Org → Markdown
            (org-hugo-export-wim-to-md)
            (message "[ox-hugo] Exported to Markdown in section '%s'" section)
            ;; 2️⃣ Insert or update Org property :HUGO_URL:
            (save-excursion
              (goto-char (point-min))
              (if (re-search-forward "^:HUGO_URL:.*$" nil t)
                  (replace-match (concat ":HUGO_URL: " url))
                ;; Insert under first top-level heading if not exists
                (goto-char (point-min))
                (when (my/org-first-heading-p)
                  (forward-line 1)
                  (insert (concat ":HUGO_URL: " url "\n")))))
            ;; 3️⃣ Insert/update front matter in Markdown
            (when (file-exists-p md-file)
              (with-temp-buffer
                (insert-file-contents md-file)
                (goto-char (point-min))
                ;; YAML front matter start
                (if (re-search-forward "^---" nil t)
                    (progn
                      (forward-line 1)
                      (if (re-search-forward "^original_url:.*$" nil t)
                          (replace-match (concat "original_url: " url))
                        (insert (concat "original_url: " url "\n"))))
                  ;; No front matter → add it
                  (goto-char (point-min))
                  (insert "---\noriginal_url: " url "\n---\n"))
                (write-region (point-min) (point-max) md-file)))
            ;; 4️⃣ Build Hugo site
            (let ((default-directory base-dir))
              (shell-command "hugo -d docs"))
            (message "[hugo] Site built successfully at %s" url))
        (error (message "[ox-hugo] Export/build failed: %s" err))))))

;; Hook: only trigger after saving Org files
(add-hook 'after-save-hook 'my/org-auto-export-hugo-build-url)

;; Optional: automatically update lastmod in Hugo front matter
(setq org-hugo-auto-set-lastmod t)

;; Ensure Emacs can find Hugo binary (adjust path if needed)
(setenv "PATH" (concat (getenv "PATH") ":/opt/homebrew/bin"))
(setq exec-path (append exec-path '("/opt/homebrew/bin")))
(setenv "PATH" (concat (getenv "PATH") ":~/homebrew/bin"))
(setq exec-path (append exec-path '("~/homebrew/bin")))
