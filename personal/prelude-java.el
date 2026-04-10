;;; prelude-java.el --- Emacs Prelude: Java programming configuration.

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for Java programming

;;; Code:

  ;;; prelude-java.el --- Java programming configuration.
(require 'prelude-programming)

;; Use java-ts-mode when the tree-sitter grammar is available
(prelude-treesit-remap 'java 'java-mode 'java-ts-mode)

(defun prelude-java-mode-defaults ()
  (subword-mode +1)
  (prelude-lsp-enable))

(setq prelude-java-mode-hook 'prelude-java-mode-defaults)

;; Hook into both java-mode and java-ts-mode
(add-hook 'java-mode-hook (lambda () (run-hooks 'prelude-java-mode-hook)))
(add-hook 'java-ts-mode-hook (lambda () (run-hooks 'prelude-java-mode-hook)))

(provide 'prelude-java)

;;; prelude-java.el ends here
