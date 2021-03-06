;; -*- lexical-binding: t; -*-

(use-package projectile
  :straight t
  :diminish
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  
  (projectile-mode 1))

(provide 'setup-projectile)
