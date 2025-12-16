#!/usr/bin/env bash

# The base directory where dotfiles repo lives
DOTFILES_DIR="$HOME/Personal/dotfiles"

# Symlink target location
TARGET="$HOME/.zshrc"

# Source config files inside your dotfiles repo
SOURCE_ZSH="$DOTFILES_DIR/zsh/.zshrc"

echo "Creating symlink for ZSH config..."

# Create symlink for personal config
if [ -e "$TARGET" ]; then
  echo "Backing up existing $TARGET to $TARGET.bak"
  cp -L "$TARGET" "$TARGET.bak"
fi
ln -sf "$SOURCE_ZSH" "$TARGET"
echo "Symlinked ZSH config."

echo "Done!"

