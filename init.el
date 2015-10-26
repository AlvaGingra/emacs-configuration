;;; package --- init.el

;;; Commentary:
;;; Primary emacs configuration which call others files

;;; Code:

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;; Start emacs in fullscrenn
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set path to dependencies
;; (defvar site-lisp-dir
;;   (expand-file-name "site-lisp" user-emacs-directory))

(defvar settings-dir
  (expand-file-name "settings" user-emacs-directory))

(setq
 gnus-home-directory "~/.gnus.d/"
 gnus-init-file (expand-file-name "setup-gnus.el" settings-dir)
 message-directory (expand-file-name "Mail/" gnus-home-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
;; (add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
(load custom-file)

;; (dolist (project (directory-files site-lisp-dir t "\\w+"))
;;   (when (file-directory-p project)
;;     (add-to-list 'load-path project)))

;; Write backup nfiles to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save cursor position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Setup packages
(require 'setup-package)

;; Set up appearance early
(require 'appearance)

;; Install extensions if they're missing
(defun init--install-packages ()
  "Install extensions if they're missing."
  (packages-install
   '(magit
     paredit
     move-text
     dash
     gist
     htmlize
     visual-regexp
     markdown-mode
     fill-column-indicator
     flycheck
     flycheck-pos-tip
     flycheck-clojure
     flx
     flx-ido
     dired-details
     css-eldoc
     yasnippet
     smartparens
     ido-vertical-mode
     ido-at-point
     simple-httpd
     guide-key
     nodejs-repl
     restclient
     highlight-escape-sequences
     whitespace-cleanup-mode
     elisp-slime-nav
     gitconfig-mode
     dockerfile-mode
     gitignore-mode
     clojure-mode
     groovy-mode
     prodigy
     cider
     ace-jump-mode
     autorevert
     jump-char
     recentf
     elnode
     js2-mode
     skewer-mode
     apache-mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c C-r C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'org '(require 'setup-org))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'grep '(require 'setup-rgrep))
(eval-after-load 'shell '(require 'setup-shell))
;; (require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-perspective)
(require 'setup-ffip)
(require 'setup-paredit)
(require 'setup-web)
;; (require 'setup-css)
(require 'setup-latex)
(require 'setup-ocaml)
(require 'setup-c)
(require 'setup-arduino)
(require 'setup-ispell)
(require 'setup-sql)
;; (require 'setup-gnus)
(require 'setup-bbdb)
(require 'setup-highlight-symbol)
(require 'setup-nxml)
(require 'setup-ibuffer)
(require 'prodigy)

(eval-after-load "dash" '(dash-enable-font-lock))

;; Default setup of smartparens
(require 'smartparens-config)

(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          markdown-mode
          groovy-mode)
  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'lisp-mode '(require 'setup-lisp))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))
(eval-after-load 'haskell-mode '(require 'setup-haskell))

;; Load stuff on demand
(autoload 'skewer-start "setup-skewer" nil t)
(autoload 'skewer-demo "setup-skewer" nil t)
;; (autoload 'auto-complete-mode "auto-complete" nil t)
(eval-after-load 'flycheck '(require 'setup-flycheck))
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; Map files to modes
(require 'mode-mappings)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; Visual regexp
(require 'visual-regexp)

;; Functions (load all files in defuns-dir)
(defvar defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'expand-region)
(require 'multiple-cursors)
(require 'delsel)
(require 'jump-char)
(require 'eproject)
(require 'wgrep)
(require 'smart-forward)
(require 'change-inner)
(require 'multifiles)
(require 'google-translate)
(require 'google-translate-default-ui)
(require 'legalese)
(require 'misc)
(require 'toggle-quotes)

;; Convenient printing
(require 'printing)

;; Don't use expand-region fast keys
(setq expand-region-fast-keys-enabled nil)

;; Show expand-region command used
(setq er--show-expansion-message t)

;; Fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

;; Setup key bindings
(require 'key-bindings)

;; Misc
;; (require 'project-archetypes)
;; (require 'my-misc)

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; (setq truncate-partial-width-windows nil)

(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "chromium-browser")
(setq shr-external-browser 'browse-url-generic
	  browse-url-generic-program "chromium-browser")

;; (icomplete-mode 99)

(provide 'init)
;;; init.el ends here
