(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

(add-to-list 'load-path "~/.emacs.d/lisp/")

(global-linum-mode 1) ; always show line numbers
(setq linum-format "%4d \u2502")

; No toolbar nor menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(global-set-key (kbd "M-å") 'shrink-window)
(global-set-key (kbd "M-ä") 'enlarge-window)


(global-set-key (kbd "M-p") 'text-scale-increase)
(global-set-key (kbd "M-ö") 'text-scale-decrease)

(setq org-log-done t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(setq org-agenda-files (list "/mnt/c/Users/SEAXJOH/Desktop/gitRepos/ORG.git/master.org"))


(setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
			   (?B . (:foreground "green" :weight 'bold))
                           (?C . (:foreground "blue" :weight 'bold))
			   (?D . (:foreground "yellow" :weight 'bold))))

(org-babel-do-load-languages
 'org-babel-load-languages
  '((python . t)))

(setq org-babel-python-command "python3")
(setq python-shell-interpreter "python3")

(define-key org-mode-map (kbd "C-c C-v") 'org-insert-heading)
(define-key org-mode-map (kbd "C-c C-x") 'org-insert-subheading)

(setq org-todo-keywords '((sequence "☛ TODO" "⚫ DOING" "|" "✔ DONE")
			  (sequence "⚑ BLOCKED" "☕ PAUSED" "|")
			  (sequence "|" "✘ CANCELED")))

(setq org-todo-keyword-faces
      '(("☛ TODO" .  (:foreground "#a51021"))
	("⚫ DOING" .  (:foreground "#1510a5"))
	("✔ DONE" .  (:foreground "#42f450"))
	("⚑ BLOCKED" .  (:foreground "#930593"))
	("☕ PAUSED" .  (:foreground "#edbd00"))
	("✘ CANCELED" .  (:foreground "#819182"))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(load-theme 'solarized t)

(require 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)
