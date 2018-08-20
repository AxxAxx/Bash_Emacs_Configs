;; Axel Johansson
;; Emacs configuration 2018
;;--------------------------------------

;; Add load paths to themes and emacs functions
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/ace-jump-mode")

;; always show line numbers
(global-linum-mode 1) 
(setq linum-format "%4d \u2502") ; Give som extra spacee around line numbers

;; No toolbar nor menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Split windows with vertical separation 
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Use c++ modes for added file types
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Put all auto save and backups to hidden folder
(setq backup-directory-alist
      '(("." . "~/.MyEmacsBackups")))
(setq backup-directory-alist
      '(("." . "~/.MyEmacsBackups")))

;; Load solarized theme
(load-theme 'solarized t)

;; ace jump mode major function
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; Bind key C-c C-SPC
(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)

;;
;; ORG-MODE CONFIG
;; ------- START ------ 
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Path to agenda file
(setq org-agenda-files (list "/mnt/c/Users/SEAXJOH/Desktop/gitRepos/ORG.git/master.org"))

;; Enable Python Script language
(org-babel-do-load-languages
 'org-babel-load-languages
  '((python . t)))

(setq org-babel-python-command "python3")
(setq python-shell-interpreter "python3")

;; Bind ORG-mode keys
(define-key org-mode-map (kbd "C-c C-v") 'org-insert-heading)
(define-key org-mode-map (kbd "C-c C-x") 'org-insert-subheading)

;; Set up todo statements
(setq org-todo-keywords '((sequence "☛ TODO" "⚫ DOING" "|" "✔ DONE")
			  (sequence "⚑ BLOCKED" "☕ PAUSED" "|")
			  (sequence "|" "✘ CANCELED")))
;; Colorize them..
(setq org-todo-keyword-faces
      '(("☛ TODO" .  (:foreground "#a51021"))
	("⚫ DOING" .  (:foreground "#1510a5"))
	("✔ DONE" .  (:foreground "#42f450"))
	("⚑ BLOCKED" .  (:foreground "#930593"))
	("☕ PAUSED" .  (:foreground "#edbd00"))
	("✘ CANCELED" .  (:foreground "#819182"))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Set up priority faces
(setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
			   (?B . (:foreground "green" :weight 'bold))
                           (?C . (:foreground "blue" :weight 'bold))
			   (?D . (:foreground "yellow" :weight 'bold))))
;;
;; ORG-MODE CONFIG
;; ------- END ------ 

;; Bind key hotkeys
(global-set-key (kbd "M-å") 'shrink-window)
(global-set-key (kbd "M-ä") 'enlarge-window)
(global-set-key (kbd "M-p") 'text-scale-increase)
(global-set-key (kbd "M-ö") 'text-scale-decrease)

;; Set rainbow delimiters and rainbow colors
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(require 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)
