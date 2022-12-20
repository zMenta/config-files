;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


(setq user-full-name "Lucas V. Moog Brentano")


;; Theme and editor visual configuration
(setq doom-theme 'doom-one)

(setq doom-font (font-spec :size 15))
(setq scroll-margin '8)
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


;; Org files default directory
(setq org-directory "~/org/")


;; Packages require's
(require 'gdscript-mode)
(require 'rustic)
(require 'beacon)

;; Packages configurations
(beacon-mode 1)


