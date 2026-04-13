;;; utils.el --- utility functions
;;;
;;; Commentary:
;;;
;;; Provides some utility functions that can be used elsewhere.
;;;
;;; Code:
(require 'seq)

;; A convenient function for finding a path to a directory underneath the user's Emacs configuration directory.
(defun emacs-subdir-path (&rest components)
  (seq-reduce (lambda (x y) (expand-file-name y x)) components user-emacs-directory))

(provide 'utils)

;; utils.el ends here
