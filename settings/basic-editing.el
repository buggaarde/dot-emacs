;; We want to remove transient mark mode
(transient-mark-mode 1)

;; Line/column number in every mode-line
(line-number-mode 1)
(column-number-mode 1)

;; Match parentheses automatically
(electric-pair-mode 1)

;; Highlight matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Sacha Chuang's smarter-move-to-beginning-of-line
(defun sacha/smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

  Move point to the first non-whitespace character on this line.
  If point is already there, move to the beginning of the line.
  Effectively toggle between the first non-whitespace character and
  the beginning of the line.

  If ARG is not nil or 1, move forward ARG - 1 lines first.  If
  point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'sacha/smarter-move-beginning-of-line)
(global-set-key [remap org-beginning-of-line]
                'sacha/smarter-move-beginning-of-line)


(provide 'basic-editing)
