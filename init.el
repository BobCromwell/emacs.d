 ;;el-get
 (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
 (unless (require 'el-get nil 'noerror)
   (with-current-buffer
       (url-retrieve-synchronously
	"https://raw.github.com/dimitri/el-get/master/el-get-install.el")
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp))))

 (el-get 'sync)
 ;;color theme for emacs higher than 24
 (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
 ;; enable copy & paste from/in emacs
 (setq x-select-enable-clipboard t)
 (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
;;w3m
(require 'w3m)
(require 'w3m-lnum)
(require 'util)
(setq w3m-default-display-inline-images t)
(setq w3m-key-binding 'info)
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("2695efb916e5bc766053a590d07359adf5115961365cec87a38e2bd098b45880" "ff37258580ba15b44a444ee1d885631fe6f0971094af1aea1073e51f51d6e7f8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
