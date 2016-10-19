(tool-bar-mode -1)

;; use Shift+arrow_keys to move cursor around split panes
;; (windmove-default-keybindings)
;; when cursor is on edge, move to the other side, as in a torus space
;; (setq windmove-wrap-around t)

;; default variables
(setq-default c-default-style "linux" ;; nicer default syntax correction
              c-basic-offset 4 ;; set the c offset to 4 spaces
              tab-width 4 ;; set tab width to 4 spaces
              indent-tabs-mode nil ;; use spaces not tab characters
              )

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)))

;; copy to clipboard
(setq x-select-enable-clipboard t)

;; comment region
(global-set-key (kbd "M-/") 'comment-dwim)

;; auto-complete from prefix
(global-set-key (kbd "C-/") 'dabbrev-expand)

;; undo
(global-set-key (kbd "C--") 'undo)

;; various modes
(add-to-list 'auto-mode-alist '("\\.c0\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.c1\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.sage\\'" . python-mode))
(global-linum-mode t)
(setq linum-format "%4d \u2502")
(show-paren-mode t)
(delete-selection-mode t)

;; use C-c C-o to check what type of indentation something is
;; define custom c indentations
(defun c-indentations ()
  (c-set-offset 'case-label '+)
  (c-set-offset 'func-decl-cont '0)
  )

;; define custom java indentations
(defun java-indentations ()
  (c-set-offset 'inline-open '0)
  (c-set-offset 'case-label '0)
  )

;; set this in all c-based programming modes
(add-hook 'c-mode-common-hook 'c-indentations)
(add-hook 'java-mode-hook 'java-indentations)
(add-hook 'c-mode-common-hook 'subword-mode)
(add-hook 'java-mode-hook 'subword-mode)
(add-hook 'python-mode-hook 'subword-mode)
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))
(add-hook 'sgml-mode-hook
          (lambda ()
            ;; Default indentation to 2, but let SGML mode guess, too.
            (set (make-local-variable 'sgml-basic-offset) 2)
            (sgml-guess-indent)))
