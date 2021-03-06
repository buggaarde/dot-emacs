;; -*- lexical-binding: t; -*-

(use-package clojure-mode
  :straight t
  :defer t

  :config
  (use-package cider
	:ensure t)
  
  (use-package clj-refactor
	:straight t
	:diminish clj-refactor-mode

	:config
	(progn (defun my-clojure-hook ()
			 (clj-refactor-mode 1)
			 (yas-minor-mode 1)
			 (cljr-add-keybindings-with-prefix "C-C m"))
		   (add-hook 'clojure-mode-hook #'my-clojure-hook))))

(provide 'setup-clojure)
