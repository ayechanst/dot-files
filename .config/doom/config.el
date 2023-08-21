(setq user-full-name "Aye Chan San Tun"
      user-mail-address "john@doe.com")

(setq doom-theme 'doom-dracula)

;;(setq doom-theme 'doom-molokai)

;;(setq doom-theme 'doom-spacegrey)

;;(setq doom-theme 'doom-nord)

;;(setq doom-theme 'doom-tomorrow-night)

(setq display-line-numbers-type t)

(setq +format-with-lsp t)

(setq org-directory "~/org/")

(after! lsp-mode
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("nomicfoundation-solidity-language-server" "--stdio")) :major-modes '(solidity-mode) :priority -1 :server-id 'solidity-ls)))

(add-hook 'solidity-mode-hook (lambda ()
                                (progn
                                  (format-all-mode -1)
                                  (lsp))))

(use-package lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
