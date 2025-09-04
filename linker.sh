#!/bin/sh
# Assumes dotfiles is in $HOME/dotfiles to use absolute paths
# This is required because of how symbolic links work

set -eu

log() { printf '%s\n' "$*" >&2; }

# Safe symlink creator:
# - ensures parent dir
# - if dest exists and is NOT a symlink, skip
# - otherwise, ln -snf src -> dest
safe_link() {
  src=$1
  dest=$2
  [ -e "$src" ] || { log "skip (missing src): $src"; return 0; }
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    log "skip (exists, not a symlink): $dest"
    return 0
  fi
  ln -snf "$src" "$dest"
  log "link: $dest -> $src"
}

replace_dir_with_link() {
  src=$1
  dest=$2
  [ -e "$src" ] || { log "skip (missing src): $src"; return 0; }
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    rm -rf "$dest"
  fi
  safe_link "$src" "$dest"
}

DOT="$HOME/dotfiles"

# --- Antidote (idempotent vs. always-clone) ---
if [ -d "$HOME/.antidote/.git" ]; then
  log "antidote exists, pulling updates"
  git -C "$HOME/.antidote" pull --ff-only || true
else
  log "cloning antidote"
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"
fi

# Bash dotfiles
safe_link "$DOT/.aliases" "$HOME/.aliases"
safe_link "$DOT/.bash_profile" "$HOME/.bash_profile"
safe_link "$DOT/.bashrc" "$HOME/.bashrc"
safe_link "$DOT/.inputrc" "$HOME/.inputrc"
safe_link "$DOT/.profile" "$HOME/.profile"

# Git dotfiles
safe_link "$DOT/.git-completion.bash" "$HOME/.git-completion.bash"
safe_link "$DOT/.gitconfig" "$HOME/.gitconfig"
safe_link "$DOT/.gitignore" "$HOME/.gitignore"
safe_link "$DOT/.gitmodules" "$HOME/.gitmodules"

# ag dotfiles
safe_link "$DOT/.agignore" "$HOME/.agignore"

# zsh dotfiles
safe_link "$DOT/.zshrc" "$HOME/.zshrc"

# .config dotfiles
replace_dir_with_link "$DOT/.config/lsd" "$HOME/.config/lsd"
replace_dir_with_link "$DOT/.config/nvim" "$HOME/.config/nvim"

# Set allowed_signers in git
mkdir -p "$HOME/.config/git"
if [ -f "$DOT/.config/git/allowed_signers" ]; then
  safe_link "$DOT/.config/git/allowed_signers" "$HOME/.config/git/allowed_signers"
  git config --global gpg.ssh.program "$HOME/.local/bin/git-ssh-signer"
  git config --global gpg.ssh.allowedSignersFile "$HOME/.config/git/allowed_signers" || true
fi

# Link git-ssh-signer to a place on PATH
mkdir -p "$HOME/.local/bin"
safe_link "$DOT/git-ssh-signer" "$HOME/.local/bin/git-ssh-signer"

# tmux conf
safe_link "$DOT/.tmux.conf" "$HOME/.tmux.conf"

# hammerspoon dotfiles
replace_dir_with_link "$DOT/.hammerspoon" "$HOME/.hammerspoon"

# emacs dotfiles (circular link cleanup)
replace_dir_with_link "$DOT/.spacemacs.d" "$HOME/.spacemacs.d"
rm -f "$DOT/.spacemacs.d/.spacemacs.d" 2>/dev/null || true

# vim dotfiles
safe_link "$DOT/.vimrc" "$HOME/.vimrc"

# misc
safe_link "$DOT/.eslintrc" "$HOME/.eslintrc"
