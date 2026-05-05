;;; python-prefs.el --- my Python preferences.
;;;
;;; Commentary:
;;;
;;; Configures python-mode to my tastes.
;;;
;;; Code:

(require 'prelude-programming)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((python-ts-mode python-mode) . ("uv" "run" "--with" "python-lsp-server[all]" "pylsp"))))

(provide 'python-prefs)
;;; python-prefs.el ends here
