;;; package --- setup-yaml

;;; Commentary:
;;; Emacs configuration file for yaml

;;; Code:

(require 'yaml-mode)

(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'setup-yaml)
;;; setup-yaml.el ends here
