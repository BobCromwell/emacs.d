;;el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))

(el-get 'sync)
;;
;;cocoa emacs can't find w3m and so on add below line
(add-to-list 'exec-path "/usr/local/bin")
;;color theme for emacs higher than 24
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;default font size for gui emacs
(set-face-attribute 'default nil :height 180)
;; enable copy & paste from/in emacs
(defun mac-copy ()
  (shell-command-to-string "pbpaste"))

(defun mac-paste (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'mac-paste)
(setq interprogram-paste-function 'mac-copy)
;;w3m
(require 'w3m)
(require 'w3m-lnum)
;;(require 'util)
(add-hook 'w3m-mode-hook 'w3m-lnum-mode)
(setq w3m-default-display-inline-images t)
;;yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;;helm (previously known as anything)
(add-to-list 'load-path "~/.emacs.d/plugins/helm")
(require 'helm-config)
(helm-mode 1)
(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (fullscreen . nil)))
(blink-cursor-mode -1)
(add-to-list 'load-path (expand-file-name "."))
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
(define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)
;;XCode like pragma list (in Xcode Key Binding is: Ctrl + 6)
(defvar helm-c-source-objc-headline
  '((name . "Objective-C Headline")
    (headline . "^\\([-+@]\\|#pragma mark\\)")))

(defun objc-headline ()
  (interactive)
    (helm-other-buffer 'helm-c-source-objc-headline "*ObjC Headline*"))

(global-set-key "\C-xp" 'objc-headline)
;;
;; --- Obj-C switch between header and source ---

(defun objc-in-header-file ()
  (let* ((filename (buffer-file-name))
         (extension (car (last (split-string filename "\\.")))))
    (string= "h" extension)))

(defun objc-jump-to-extension (extension)
  (let* ((filename (buffer-file-name))
         (file-components (append (butlast (split-string filename
                                                         "\\."))
                                  (list extension))))
    (find-file (mapconcat 'identity file-components "."))))

;;; Assumes that Header and Source file are in same directory
(defun objc-jump-between-header-source ()
  (interactive)
  (if (objc-in-header-file)
      (objc-jump-to-extension "m")
    (objc-jump-to-extension "h")))

(defun objc-mode-customizations ()
  (define-key objc-mode-map (kbd "C-c t") 'objc-jump-between-header-source))

(add-hook 'objc-mode-hook 'objc-mode-customizations)

;; auto-complete
;;(require 'auto-complete)
;;(require 'auto-complete-config)

;;(setq-default ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;(add-hook 'css-mode-hook 'ac-css-mode-setup)
;;(add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;(global-auto-complete-mode t)
;;(add-to-list 'ac-modes 'objc-mode)
