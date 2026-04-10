;;; opts.el --- sets global options.
;;;
;;; Commentary:
;;;
;;; I use this to add customizations to my prelude configuration.
;;;
;;; Code:

(defvar prelude-minimalistic-ui)
(setq prelude-minimalistic-ui 't)

;;; Tell tree-sitter where to find language grammars.
(require 'treesit nil t)
(add-to-list 'treesit-language-source-alist
             '(java "https://github.com/tree-sitter-tree-sitter-java"))

(provide 'opts)
;;; opts.el ends here
