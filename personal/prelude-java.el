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

;; Configure jdtls to use a cache directory for faster startup times.
(require 'utils)
(with-eval-after-load 'eglot
  (defun prelude-jdtls-contact (_interactive-call)
    "Return the jdtls command with a persistent workspace directory."
    (let* ((project (project-current))
           (project-name (if project (file-name-nondirectory (directory-file-name (project-root project))) "default"))
           (workspace-dir (emacs-subdir-path ".cache" "jdtls" project-name)))
      (unless (file-exists-p workspace-dir)
        (make-directory workspace-dir t))
      (list "jdtls" "-data" workspace-dir)))
  (add-to-list 'eglot-server-programs
               '((java-mode java-ts-mode) . prelude-jdtls-contact)))

(provide 'prelude-java)

;;; prelude-java.el ends here
