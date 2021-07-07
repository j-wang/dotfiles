;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(rust
     ruby
     swift
     docker
     terraform
     yaml
     html
     lua
     octave
     python
     ocaml
     csv
     (javascript :variables javascript-backend 'lsp)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     ;; react
     ranger
     (org :variables org-want-todo-bindings t)
     (go :variables
         go-format-before-save t
         go-backend 'lsp)
     deft
     dash
     (typescript :variables
                 typescript-backend 'lsp)
     lsp
     auto-completion
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'multi-term)
     latex
     bibtex
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     flycheck
     rjsx-mode
     prettier-js
     olivetti
     centered-window
     all-the-icons
     all-the-icons-dired
     doom-modeline
     doom-themes
     (reason-mode
      :location (recipe
                 :repo "reasonml-editor/reason-mode"
                 :fetcher github
                 :files ("reason-mode.el" "refmt.el" "reason-indent.el" "reason-interaction.el")))
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  ;; ensure that our local/bin path is actually available to emacs
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  ;; load theme before everything else
  ;; (add-to-load-path-if-exists "~/.spacemacs.d/")
  (setq-default dotspacemacs-themes '(spacemacs-dark))

  ;; set background color to nothing for terminal-based
  (defun on-after-init ()
    (unless (display-graphic-p (selected-frame))
      (set-face-background 'default "unspecified-bg" (selected-frame))))
  (add-hook 'window-setup-hook 'on-after-init)

  ;; use evil search
  ;; (setq evil-search-module (quote evil-search))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; set evil search
  (setq-default evil-search-module 'evil-search)

  ;; Add doom themes
  (load-theme 'doom-nord t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config)

  ;; auto-check and install fonts if needed for all-the-icons
  (use-package all-the-icons
    :ensure t
    :config (let ((font-dest (cl-case window-system
                              (x  (concat (or (getenv "XDG_DATA_HOME")
                                              ;; Default Linux install directories
                                   (concat (getenv "HOME") "/.local/share"))
                               "/fonts/"))
                   (mac (concat (getenv "HOME") "/Library/Fonts/" ))
                   (ns (concat (getenv "HOME") "/Library/Fonts/" )))))
  (unless (file-exists-p (concat font-dest "all-the-icons.ttf"))
    (all-the-icons-install-fonts t))))

  ;; enable doom modeline
  ;; (use-package doom-modeline
  ;;   :ensure t
  ;;   :init (doom-modeline-mode 1))

  ;; allow ranger previews
  (setq-default dotspacemacs-configuration-layers
                '(ranger :variables
                         ranger-show-preview t
                         ranger-show-literal nil))

  ;; install straight.el
  (defvar bootstrap-version)
  (let ((bootstrap-file
         (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
        (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

  ;; ** Custom Keybindings **
  (spacemacs/declare-prefix "o" "custom")

  (defun open-my-todo ()
    "Opens user todo file in Dropbox."
    (interactive)
    (find-file "~/Dropbox/org/todo.org")
    )
  (spacemacs/set-leader-keys "ot" 'open-my-todo)

  ;; ** Org-Mode Stuff **
  ;; alias for org-show-all
  (with-eval-after-load 'org (org-defkey org-mode-map [(meta return)] 'org-meta-return))
  (with-eval-after-load 'org (advice-add 'org-archive-subtree :after #'org-save-all-org-buffers))
  (with-eval-after-load 'org (advice-add 'org-refile :after #'org-save-all-org-buffers))

  ;; custom agenda
  (setq org-agenda-custom-commands
        '(("A" "TODOs and upcoming agenda items"
           ((agenda "" ((org-agenda-span 7)))
            (todo "TODO" ((org-agenda-overriding-header "TODOs without dates\n")
                          (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))))
          ("W" "Waiting and Considered"
           ((tags "@waiting|@consider")))
          ))

  ;; add agenda files
  (setq org-agenda-files (list "~/Dropbox/org/todo.org"
                               "~/Dropbox/org/backlog.org"
                               "~/Dropbox/org/shopping.org"
                               "~/Dropbox/org/inbox.org"))

  ;; org latex profess
  (setq org-latex-pdf-process
        '("pdflatex %f" "biber %b" "pdflatex %f" "pdflatex %f"))

  ;; refile targets
  (setq org-refile-targets '((org-agenda-files :maxlevel . 5)))

  (add-hook 'org-mode-hook 'auto-revert-mode)

  ;; org-ref settings
  (setq org-ref-default-bibliography '("~/Dropbox/Bibliographies/references.bib")
        org-ref-pdf-directory "~/Dropbox/Bibliographies/"
        org-ref-bibliography-notes "~/Dropbox/Bibliographies/notes.org")

  ;; org drag and drop
  ;; https://kitchingroup.cheme.cmu.edu/blog/2015/07/10/Drag-images-and-files-onto-org-mode-and-insert-a-link-to-them/
  (defun my-dnd-func (event)
    (interactive "e")
    (goto-char (nth 1 (event-start event)))
    (x-focus-frame nil)
    (let* ((payload (car (last event)))
           (type (car payload))
           (fname (cadr payload))
           (img-regexp "\\(png\\|jp[e]?g\\)\\>"))
      (cond
       ;; insert image link
       ((and  (eq 'drag-n-drop (car event))
              (eq 'file type)
              (string-match img-regexp fname))
        (insert (format "[[%s]]" fname))
        (org-display-inline-images t t))
       ;; insert image link with caption
       ((and  (eq 'C-drag-n-drop (car event))
              (eq 'file type)
              (string-match img-regexp fname))
        (insert "#+ATTR_ORG: :width 300\n")
        (insert (concat  "#+CAPTION: " (read-input "Caption: ") "\n"))
        (insert (format "[[%s]]" fname))
        (org-display-inline-images t t))
       ;; C-drag-n-drop to open a file
       ((and  (eq 'C-drag-n-drop (car event))
              (eq 'file type))
        (find-file fname))
       ((and (eq 'M-drag-n-drop (car event))
             (eq 'file type))
        (insert (format "[[attachfile:%s]]" fname)))
       ;; regular drag and drop on file
       ((eq 'file type)
        (insert (format "[[%s]]\n" fname)))
       (t
        (error "I am not equipped for dnd on %s" payload)))))


  (with-eval-after-load 'org (org-defkey org-mode-map (kbd "<drag-n-drop>") 'my-dnd-func))
  (with-eval-after-load 'org (org-defkey org-mode-map (kbd "<C-drag-n-drop>") 'my-dnd-func))
  (with-eval-after-load 'org (org-defkey org-mode-map (kbd "<M-drag-n-drop>") 'my-dnd-func))

  ;; starting configs
  (spacemacs/toggle-transparency)
  (setq projectile-git-submodule-command nil)

  ;; set markdown program
  (setq markdown-command "pandoc")

  ;; writing mode, courtesy of azer-bike
  (defun writing-mode ()
    (interactive)
    (setq buffer-face-mode-face '(:family "iA Writer Duospace" :height 150))
    (buffer-face-mode)
    (linum-mode 0)
    (centered-window-mode 1)
    (visual-line-mode 1)
    (setq truncate-lines nil)
    (setq-default line-spacing 5)
    (setq global-hl-line-mode nil)
    )

  ;; Make terminal prompts read-only
  ;(setq comint-prompt-read-only t)
  ;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (when (require 'multi-term nil t)
    (global-set-key (kbd "<f5>") 'multi-term)
    (setq term-bind-key-alist
          (list (cons "C-c C-c" 'term-interrupt-subjob)
                (cons "C-p" 'previous-line)
                (cons "C-n" 'next-line)
                (cons "M-f" 'term-send-forward-word)
                (cons "M-b" 'term-send-backward-word)
                (cons "C-c C-j" 'term-line-mode)
                (cons "C-c C-k" 'term-char-mode)
                (cons "M-DEL" 'term-send-backward-kill-word)
                (cons "M-d" 'term-send-forward-kill-word)
                (cons "<C-left>" 'term-send-backward-word)
                (cons "<C-right>" 'term-send-forward-word)
                (cons "C-r" 'term-send-reverse-search-history)
                (cons "M-p" 'term-send-raw-meta)
                (cons "M-y" 'term-send-raw-meta)
                (cons "C-y" 'term-send-raw)))
    (setq multi-term-buffer-name "term"
          multi-term-program "/bin/bash"))

  (unless (display-graphic-p)
    (xterm-mouse-mode))

  (defconst term-function-key-alist '((f1 . "\eOR")
                                      (f2 . "\eOS")
                                      (f3 . "\eOT")
                                      (f4 . "\eOU")
                                      (f5 . "\e[15~")
                                      (f6 . "\e[17~")
                                      (f7 . "\e[18~")
                                      (f8 . "\e[19~")
                                      (f9 . "\e[20~")
                                      (f10 . "\e[21~")
                                      (f11 . "\e[23~")
                                      (f12 . "\e[24~")))

  (defun term-send-function-key ()
    (interactive)
    (let* ((char last-input-event)
           (output (cdr (assoc char term-function-key-alist))))
      (term-send-raw-string output)))

  (dolist (spec term-function-key-alist)
    (define-key term-raw-map
      (read-kbd-macro (format "<%s>" (car spec)))
      'term-send-function-key))

  ;; Snippets
  (setq auto-completion-private-snippetes-directory "~/.spacemacs.d/snippets")

  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.js" . js-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx" . js-mode))
  (add-to-list 'auto-mode-alist '("\\.react.js" . js-mode))

  ;; Typescript for tsx
  (add-to-list 'auto-mode-alist '("\\.tsx" . typescript-mode))

  ;; setup tide
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; formats the buffer before saving
  ;; (add-hook 'before-save-hook 'tide-format-before-save)

  (add-hook 'typescript-mode-hook #'setup-tide-mode)

  ;; Local eslint
  ;; https://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint
            (and root
                 (expand-file-name "node_modules/.bin/eslint"
                                   root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))

  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  ;; add ability to detect local path files
  ;; (when (memq window-system '(mac ns))
  ;;   (setq exec-path-from-shell-variables '("PATH" "MANPATH" "SSH_CLIENT" "HOSTNAME"
  ;;                                          "GTAGSCONF" "GTAGSLABEL" "RUST_SRC_PATH"
  ;;                                          "HISTFILE" "HOME" "GOPATH" "GOROOT" "GOEXEC"))  
  ;;   (exec-path-from-shell-initialize))

  ;; utility function for rjsx
  (defun eslint-fix ()
    "Format the current file with ESLint."
    (interactive)
    (if (executable-find "eslint")
        (progn (call-process "eslint" nil "*ESLint Errors*" nil "--fix" buffer-file-name)
               (revert-buffer t t t))
      (message "ESLint not found.")))

  (defun evil-rjsx-electric ()
    (interactive)
    (rjsx-delete-creates-full-tag 1 nil)
    )

  ;; JSX tern support
  (add-hook 'rjsx-mode-hook (lambda ()
                                 (tern-mode t)
                                 (flycheck-mode)
                                 (customize-set-variable 'j2-mode-hide-warnings-and-errors t)
                                 (evil-define-key 'insert rjsx-mode-map "\C-d" #'evil-rjsx-electric)
                                 ))

  ;; (add-hook 'rjsx-mode-hook
  ;;           (lambda ()
  ;;             (add-hook 'after-save-hook #'eslint-fix)))

  (require 'web-mode)
  (setq css-indent-offset 2)
  (setq python-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))

  (setq flycheck-checkers '(javascript-eslint))

  (require 'flycheck)
  ;; turn on flychecking globally
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist)))

  ;; turn on flycheck
  (add-hook 'js2-mode-hook 'flycheck-mode)

  ;; get rid of js2-mode specific warnings
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-strict-trailing-comma-warning nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)

  ;; set up syntax highlighting for web-mode
  ;; (setq web-mode-content-types-alist
  ;;       '(("jsx" . "\\.js[x]?\\'")))

  ;; add flow check
  ;; Flow (JS) flycheck config (http://flowtype.org)
  ;; from https://github.com/bodil/emacs.d/blob/master/bodil/bodil-js.el
  (require 'f)
  (require 'json)
  (require 'flycheck)

  (defun flycheck-parse-flow (output checker buffer)
    (let ((json-array-type 'list))
      (let ((o (json-read-from-string output)))
        (mapcar #'(lambda (errp)
                    (let ((err (cadr (assoc 'message errp))))
                      (flycheck-error-new
                       :line (cdr (assoc 'line err))
                       :column (cdr (assoc 'start err))
                       :level 'error
                       :message (cdr (assoc 'descr err))
                       :filename (f-relative
                                  (cdr (assoc 'path err))
                                  (f-dirname (file-truename
                                              (buffer-file-name))))
                       :buffer buffer
                       :checker checker)))
                (cdr (assoc 'errors o))))))

  (flycheck-define-checker javascript-flow
    "Javascript type checking using Flow."
    :command ("flow" "--json" source-original)
    :error-parser flycheck-parse-flow
    :modes (react-mode js2-mode js2-jsx-mode web-mode rjsx-mode)
;;    :next-checkers ((error . javascript-eslint))
    )
  (add-to-list 'flycheck-checkers 'javascript-flow)

  ;; Prettier
  (require 'prettier-js)
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode 'prettier-js-mode)
  (add-hook 'web-mode-hook #'(lambda ()
                               (enable-minor-mode
                                '("\\.jsx?\\'" . prettier-js-mode))))
  (add-hook 'typescript-mode-hook 'prettier-js-mode)

  (setq prettier-js-args '(
                           "--trailing-comma" "es5"
                           "--bracket-spacing" "true"
                           "--single-quote" "true"
                           "--arrow-parens" "avoid"
                           ))

  ;; Golang
  (setq gofmt-command "goimports")  ;; use goimports instead of gofmt

  ;; Python
  (setq python-indent-offset 4)  ;; 4 spaces for indent

  ;; Dumb Jump
  (dumb-jump-mode)

  ;; Deft mode
  (setq deft-default-extension "txt")
  (setq deft-directory "~/Dropbox/Apps/NotationalVelocity")
  ;; Overwrite `deft-current-files` for the `deft-buffer-setup` and limit it to 80 entries
  (defun anks-deft-limiting-fn (orig-fun &rest args)
    (let
        ((deft-current-files (-take 80 deft-current-files)))
      (apply orig-fun args)))

  (advice-add 'deft-buffer-setup :around #'anks-deft-limiting-fn)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fringe-mode 10 nil (fringe))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(j2-mode-hide-warnings-and-errors t t)
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/Dropbox (Personal)/org/todo.org")))
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-selected-packages
   (quote
    (ruby-test-mode rubocop rspec-mode robe doom-modeline doom-themes org-trello request-deferred deferred transient lv spaceline-all-the-icons all-the-icons memoize centered-window writeroom-mode visual-fill-column treepy graphql helm-dash dash-at-point org-mime ghub let-alist prettier-js reason-mode deft utop tuareg caml ocp-indent merlin tide typescript-mode swift-mode org-category-capture winum powerline spinner alert log4e gntp markdown-mode skewer-mode simple-httpd multiple-cursors js2-mode hydra parent-mode projectile request gitignore-mode fuzzy pkg-info epl flx magit git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree highlight magit-popup json-snatcher json-reformat diminish go-mode bind-map bind-key yasnippet packed f s helm avy helm-core popup dockerfile-mode docker tablist docker-tramp dash async terraform-mode hcl-mode yaml-mode haml-mode planet-theme sublime-themes zonokai-theme clues-theme color-theme-sanityinc-tomorrow monokai-theme xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help zenburn-theme lua-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional company-statistics company-go company auto-yasnippet ac-ispell auto-complete rjsx-mode tern ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spacemacs-theme spaceline smeargle slim-mode scss-mode sass-mode restart-emacs ranger rainbow-delimiters quelpa pug-mode popwin persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-ag google-translate golden-ratio go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flycheck flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump define-word csv-mode column-enforce-mode coffee-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777216)) (:foreground "#8898a9" :background "#192129")) (((class color) (min-colors 88)) (:foreground "#bcbcbc" :background "#1c1c1c")))))
