;;; Enable marmalade package repository
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; Set the color theme
(load-theme 'solarized-dark t)

;;; Make switching b/w buffers easier
(iswitchb-mode t)

;;; No initial splash screen image
(setq inhibit-splash-screen t)

;;; Spaces for tab
(setq indent-tabs-mode nil)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq tab-width 4)
(setq indent-line-function 'insert-tab)

;;; backup/autosave
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;;; Erlang related
;(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.5/emacs" load-path))
;(setq erlang-root-dir "/usr/local/lib/erlang")
;(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
;(require 'erlang-start)

;;; Enable Python mode for Emacs
(require 'python-mode)

;;; Set python/ipython as the default Python shell
(setq py-shell-name "python")
(setq py-python-command "python")
(require 'ipython)

;;; Enable PEP8
(require 'pep8)

;;; Enable PyLint
(require 'pylint)

;;; Enable yasnippet
(require 'yasnippet-bundle)
(yas/global-mode t)

;;; Space for Emacs auto-generated settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(safe-local-variable-values (quote ((py-master-file . "~/src/strata/strata/ndcp_gui.py") (py-master-file . "~/src/strata/strata/ndcp-gui.py"))))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))
