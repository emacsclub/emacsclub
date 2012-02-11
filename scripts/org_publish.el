(defvar base_dir "~/Projects/emacsclub/content/org/")
(defvar pub_dir "~/Projects/emacsclub/content/html/")

(require 'org-publish)
(setq org-publish-project-alist
      '(
        ;; add all the components here
        ;; *notes* - publishes org files to html
        ("org-notes"
         :base-directory "~/Projects/emacsclub/content/org/"
         :base-extension "org"  ; Filename suffix without dot
         :publishing-directory "~/Projects/emacsclub/content/public_html/"
         :recursive t           ; includes subdirectories
         :publishing-function org-publish-org-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :auto-sitemap t                ; generate automagically
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap"
         )

        ;; *static* - copies files to directories
        ("org-static"
         :base-directory "~/Projects/emacsclub/content/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Projects/emacsclub/content/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ;; *publish* with M-x org-publish-project RET org RET
        ("org" :components ("org-notes" "org-static"))
      ))

(org-publish-project)
