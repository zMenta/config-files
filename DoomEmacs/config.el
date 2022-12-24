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

;; (setq org-ellipsis " ⬎")
(setq org-ellipsis " ▼")

;; Automatically change bullet type when indenting. Ex: indenting a + makes the bullet a *.
(setq org-list-demote-modify-bullet
      '(("+" . "*") ("*" . "-") ("-" . "+")))


;; Packages
(require 'gdscript-mode)
(require 'rustic)

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
