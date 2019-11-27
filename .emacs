;; Startup visuals, disabled

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(setq confirm-kill-emacs (if (daemonp) nil 'yes-or-no-p))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; essentially set the font-size
(setq van/default-font "-*-*-*-*-*-*-20-*-*-*-m-0-iso10646-1")

(defun use-default-theme ()
  (interactive)
  ;;(load-theme 'default-black)
  (load-theme 'adwaita t)
  (set-face-attribute 'default nil :font van/default-font))

(use-default-theme)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

(eval-when-compile
  (require 'package)
  (setq package-archives ("gnu" . "https://elpa.gnu.org/packages/"))
  (package-initialize)
  (require 'use-package) ;; from here onwards only use-package activation
  )

;; Set path to dependencies
(defvar site-lisp-dir
  (f-join user-emacs-directory "site-lisp"))

;; Set up load path
(add-to-list 'load-path site-lisp-dir)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Are we on a mac?
(defvar is-mac (equal system-type 'darwin))

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Going back two times with C-u C-SPC C-SPC
(setq set-mark-command-repeat-pop t)

;; If you set indent-tabs-mode to nil then emacs will use spaces to
;; indent to the tab-stop when you press tab and never convert spaces
;; to tabs.
(setq-default indent-tabs-mode nil)

(setq bookmark-save-flag 1)
