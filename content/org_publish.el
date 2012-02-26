(defconst home (file-name-directory (or load-file-name buffer-file-name)))
 
(require 'org-publish)
(setq org-publish-project-alist
      `(
        ;; add all the components here
        ;; *notes* - publishes org files to html
        ("org-notes"
         :base-directory ,(concat home "org/")
         :base-extension "org"  ; Filename suffix without dot
         :publishing-directory ,(concat home "public_html/")
         :recursive t           ; includes subdirectories
         :publishing-function org-publish-org-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :auto-sitemap t                ; generate automagically
         :sitemap-title "Sitemap"
         )

        ;; *static* - copies files to directories
        ("org-static"
         :base-directory ,(concat home "org/")
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory ,(concat home "public_html/")
         :recursive t
         :publishing-function org-publish-attachment
         )

        ;; *publish* with M-x org-publish-project RET emacsclub RET
        ("emacsclub" :components ("org-notes" "org-static"))
        ))

