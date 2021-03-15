;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Takes a major-mode, a quoted hook function or a list of either

(load "~/.doom.d/utility_functions.el")

(add-hook! python-mode
  (setq python-shell-interpreter "/Library/Frameworks/Python.framework/Versions/3.9/bin/ipython"
        python-shell-interpreter-args "--simple-prompt -i"))

(add-hook! ess-mode
  (setq inferior-R-program-name "/usr/local/bin/R")
  (setq inferior-ess-program "/usr/local/bin/R")
  (ess-smart-equals-mode 1))

(add-hook! org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (shell . t)
     (python . t))))

(after! evil-escape (setq evil-escape-key-sequence "kj"))

(map! :n "ö" #'evil-end-of-line)
(map! :n "." #'evil-avy-goto-line)
(map! :n "," #'evil-avy-goto-char)
(map! "s-;" #'comment-line)
(map! :leader
      :desc "Switch to previous buffer" "TAB" #'mode-line-other-buffer)
(map! :map (python-mode-map) "C-c C-c" #'eir-eval-in-python)
;; (map! :map (vterm-mode-map) "C-c C-c" #'eir-eval-in-shell)
(map! :map (sh-mode-map) "C-c C-c" #'eir-eval-in-shell)
(map! :map (evil-insert-state-map) "C-w" nil)
(map! "C-w" 'evil-window-map)
(map! :map (ess-r-mode-map) "<backspace>" #'hungry-delete-backward)
(map! :map (evil-insert-state-map) "C-p" nil)
(map! :map (evil-normal-state-map) "C-p" nil)
(map! :map (ess-r-mode-map) "C-p" #'insert_then_R_operator_end_nl)

(setq doom-font (font-spec :family "Fira Code" :size 12))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

