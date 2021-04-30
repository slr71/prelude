;;; clojure-prefs.el --- my Clojure preferences.
;;;
;;; Commentary:
;;;
;;; Configures clojure-mode to my tastes.
;;;
;;; Code:

(require 'clojure-mode)

;;; Enable LSP for Clojure.
(add-hook 'clojure-mode-hook 'eglot-ensure)

;;; A function to set some custom formatting options.
(defun my-clojure-mode-defaults ()
  (setq clojure-indent-style 'always-align
        clojure-align-forms-automatically nil
        clojure-special-arg-indent-factor 1)
  (define-clojure-indent
   (GET :defn)
   (POST :defn)
   (PUT :defn)
   (DELETE :defn)
   (PATCH :defn)
   (HEAD :defn)
   (OPTIONS :defn)
   (ANY :defn)
   (context :defn)
   (defroutes :defn)
   (let-routes 1)
   (rfn :defn)))

;;; Add some custom indentation rules.
(add-hook 'clojure-mode-hook 'my-clojure-mode-defaults)

(provide 'clojure-prefs)
;;; clojure-prefs.el ends here
