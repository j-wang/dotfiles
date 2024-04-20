# === Options ===
# see http://zsh.sourceforge.net/Doc/Release/Options.html for reference

# general interaction options
setopt AUTO_CD                    # just write directory, testing to see if I like it
setopt NO_BEEP                    # beeps get annoying for cycling completions
setopt CORRECT                    # spellcheck
setopt AUTO_NAME_DIRS             # used named dirs
setopt IGNORE_EOF                 # forces use of exit to exit vs ^D
setopt RM_STAR_WAIT               # 10sec wait for deleting everything, never had this problem but why not
setopt NO_CASE_GLOB               # case insensitive glob
setopt MENU_COMPLETE              # make case insensitive complete work more nicely
setopt ZLE                        # 'magic' or the line editor
setopt VI                         # use VI keybinds in ZLE
# setopt NO_CLOBBER                 # reference only, I often want things to get clobbered

# pushd related options
setopt AUTO_PUSHD                 # cd == pushd so we have a directory stack
setopt PUSHD_MINUS                # exchanges meaning of - and + in spec'ing dir on stack
setopt PUSHD_TO_HOME              # blank pushd goes to home
# setopt PUSHD_SILENT               # silence pushd listings

# glob options
setopt GLOB_COMPLETE              # expansion for globs
setopt NO_CASE_GLOB               # case insensitive
setopt NUMERIC_GLOB_SORT          # sort results numerically
setopt EXTENDED_GLOB              # extended syntax for globbing

# setup vim
export EDITOR="vi"

# === Modules ===
autoload -U compinit promptinit zcalc zsh-mime-setup zmv
compinit
promptinit
zsh-mime-setup

# === paths, etc. ===
source "$HOME/dotfiles/.shellsetup"                            # shared setup between bash and zsh

# === git modules ===
ZDIR="$HOME/dotfiles/.zsh"                                     # set the directory used for zsh files
source "$HOME/.antidote/antidote.zsh"                          # source antidote
antidote load "$ZDIR/bundles.zh"                               # use antidote now instead
source "$HOME/.bundles.txt"                                    # source load all the bundles

# === prompt, aliases, etc. ===
source "$ZDIR/prompt.zh"                                       # my custom prompt
source "$ZDIR/aliases.zh"                                      # my custom aliases

