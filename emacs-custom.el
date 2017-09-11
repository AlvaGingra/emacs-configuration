;;; package --- Custom

;;; Commentary:
;;; This my Emacs configuration file creating by using the customization command

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-environment-list
   (quote
    (("verbatim" current-indentation)
     ("verbatim*" current-indentation)
     ("tabular" LaTeX-indent-tabular)
     ("tabular*" LaTeX-indent-tabular)
     ("align" LaTeX-indent-tabular)
     ("align*" LaTeX-indent-tabular)
     ("array" LaTeX-indent-tabular)
     ("eqnarray" LaTeX-indent-tabular)
     ("eqnarray*" LaTeX-indent-tabular)
     ("displaymath")
     ("equation")
     ("equation*")
     ("picture")
     ("tabbing")
     ("comment" current-indentation))))
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-to-string-separator " => ")
 '(package-selected-packages
   (quote
    (tablist spinner paredit mmt math-symbol-lists log4e json-snatcher json-reformat inflections htmlize highlight-indentation gntp gh frame-fns flx flim finalize epl edn db creole color-theme arduino-mode apel slime scala-mode csharp-mode company-emacs-eclim eclim elpy clojure-mode-extra-font-locking ess ess-R-data-view ess-R-object-popup ess-smart-equals ess-smart-underscore ess-view atomic-chrome org-gcal org-pdfview zencoding-mode zeal-at-point yari yaml-mode whitespace-cleanup-mode wgrep web-mode web-completion-data web-beautify visual-regexp undo-tree typit typing-game top-mode toggle-quotes tidy tern swiper sqlup-mode sqlplus sqlite sql-indent smtpmail-multi smooth-scrolling smex smarty-mode smartparens smart-mode-line smart-forward slime-company skewer-mode simplezen shell-command semi scss-mode sass-mode ruby-hash-syntax ruby-compilation robe rhtml-mode request-deferred rainbow-mode puppet-mode prodigy plsql php-mode perspective pdf-tools paredit-everywhere page-break-lines org-mobile-sync oauth2 nodejs-repl multifiles multi-eshell move-text mmm-mode misc-fns misc-cmds markdown-mode+ magit legalese latex-extra karma jump-char json-mode js2-refactor jade-mode ipretty impatient-mode image+ idomenu ido-vertical-mode ido-at-point icomplete+ ibuffer-vc hl-sexp highlight-symbol highlight-escape-sequences helm-dash hardcore-mode guide-key groovy-mode google-translate google-c-style gnuplot-mode gnuplot gmail-message-mode gitignore-mode gitconfig-mode git-messenger gist fullframe frame-cmds fold-this flycheck-pos-tip flycheck-ocaml flycheck-hdevtools flycheck-google-cpplint flycheck-clojure flx-ido find-file-in-project fill-column-indicator feature-mode exec-path-from-shell emmet-mode emacsql-sqlite elnode elisp-slime-nav edit-server dockerfile-mode dired-sort dired-details diminish datomic-snippets dash-functional css-mode css-eldoc crontab-mode crappy-jsp-mode cpputils-cmake company-restclient company-math company-jedi company-inf-ruby company-auctex company-arduino color-theme-solarized color-theme-sanityinc-solarized coffee-mode cmake-mode clj-refactor change-inner c-eldoc buster-snippets buster-mode browse-kill-ring bison-mode bbdb bash-completion auto-complete auto-compile auctex-lua apache-mode anzu angular-snippets alert ace-jump-mode)))
 '(python-indent-guess-indent-offset-verbose nil))
;;; .emacs-custom.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
