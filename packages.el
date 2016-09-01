(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


(require 'dash) ;; required for solarized theme
(load-theme 'solarized-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; smoooooth scrolling
(require 'smooth-scroll)
(smooth-scroll-mode 1)


;; yasnippet - allows for typing of key followed by pressing tab to expand a snippet.
;; Snippets are fully user-definable.
(require 'yasnippet)
(yas-global-mode 1)



;; smartparens - attempts to type and delete parentheses in a smart way
(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)



;; multiple-cursors - allows for multiple cursors which can be added to match the
;; current selection
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-m") 'mc/mark-all-like-this)
