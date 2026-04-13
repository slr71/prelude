;;; editor-prefs.el --- my editor preferences.
;;;
;;; Commentary:
;;;
;;; Configures the editor to my tastes.
;;;
;;; Code:

;;; Set the line length to iPlant's standard for Clojure.
(require 'whitespace)
(setq whitespace-line-column 120)

;;; Ensure that this directory is in the load path.
(add-to-list 'load-path (file-name-directory load-file-name))

;;; Set the default fill column.
(setq-default fill-column 120)

;;; Turn autoindenting on.
(global-set-key "\r" 'newline-and-indent)

;;; Don't use tabs by default.
(setq-default indent-tabs-mode nil)

;;; The audible and visible bells are both kind of annoying; disable them.
(setq ring-bell-function 'ignore)

;;; A function to unfill a paragraph.
(defun unfill-paragraph (&optional region)
  "Convert the REGION or a multi-line paragraph into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

;;; A key binding for the unfill-paragraph function.
(define-key global-map "\M-Q" 'unfill-paragraph)

;;; Include a mode for editing Justfiles.
(require 'prelude-programming)
(prelude-require-packages '(just-ts-mode))
(require 'just-ts-mode)
(just-ts-mode-install-grammar)

;;; Use the ~/.emacs.d/var for storing state files.
(require 'utils)
(let ((var-dir (emacs-subdir-path "var")))
  (unless (file-exists-p var-dir)
    (make-directory var-dir t))
  (setq project-list-file (expand-file-name "projects" var-dir)))

(provide 'editor-prefs)
;;; editor-prefs.el ends here
