;;; package --- setup-shell

;;; Commentary:
;;; Emacs shell configuration

;;; Code:

;; Setup shell

;; Note: Emacs runs .bashrc in *shell*

;; bash-completion

(declare-function after-load "sane-defaults" (feature &rest body))

(require 'shell)
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
          'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
          'bash-completion-dynamic-complete)

(setenv "SHELL" "/bin/bash")
(require 'exec-path-from-shell)
(dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
  (add-to-list 'exec-path-from-shell-variables var))
(exec-path-from-shell-initialize)

;; tab-completion for shell-command

(require 'shell-command)
(shell-command-completion-mode)

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))

(provide 'setup-shell)
;;; setup-shell ends here
