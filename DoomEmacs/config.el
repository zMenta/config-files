;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


(setq user-full-name "Lucas V. Moog Brentano")


;; Theme and editor visual configuration
(setq doom-theme 'doom-one)

(setq doom-font (font-spec :size 15))
(setq scroll-margin '15)
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


;; Org Configuration
(setq org-directory "~/org/")

(setq org-ellipsis " ⬎")
;; (setq org-ellipsis " ▼")
;; Sets the org ellipsis symbol to have the same color as the text.
(custom-set-faces!
  '(org-ellipsis :foreground nil))

;; Automatically change bullet type when indenting. Ex: indenting a + makes the bullet a *.
(setq org-list-demote-modify-bullet
      '(("+" . "*") ("*" . "-") ("-" . "+")))

;; Set faces (font height) for each header bullet levels
(after! org
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.0)
                  (org-level-6 . 1.0)
                  (org-level-7 . 1.0)
                  (org-level-8 . 1.0)))
    (set-face-attribute (car face) nil :height (cdr face)))
  )


;; Packages
;; (require 'gdscript-mode)
(require 'rustic)


;; Lsp
;;
;; Godot 4 lsp server port
(setq lsp-gdscript-port "6005")


;; Beacon
(use-package! beacon
  :config
        (beacon-mode 1)
  )

;; ORG Packages
;; Org-Superstar
(use-package! org-superstar
  :config
        (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
        (setq org-superstar-special-todo-items t) ;; Makes a TODO header bullets into check boxes
        (setq org-superstar-headline-bullets-list
              '("◉" "◎" "○" ))

  )

;; Org-Appear
(use-package! org-appear
  :commands (org-appear-mode)
  :hook (org-mode . org-appear-mode)
  :init
        (setq org-hide-emphasis-markers t) ;; Default settings for org-appear. Hides the org emphasis symbols (bold, italics, etcs)

        (setq org-appear-authoemphasis t) ;;Enable org-appear on emphasis (bold, italics, etc)
        (setq org-appear-autolinks t) ;; Enable on links
        (setq org-appear-autosubmarkers t) ;; Enable on subscript and superscript
  )

;; Ox-Reveal
(use-package! ox-reveal
  :config
        (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
  )
