#!/usr/bin/env bash

# The base directory where dotfiles repo lives
DOTFILES_DIR="$HOME/Personal/dotfiles"

# Symlink target location
TARGET_DIR="$HOME"

# Source config files inside your dotfiles repo
SOURCE_ZSH="$DOTFILES_DIR/zsh/.zshrc"

echo "Creating symlinks for ZSH config..."

# Create symlink for personal config
if [ -e "$TARGET_DIR" ]; then
  echo "Backing up existing $TARGET_DIR to $TARGET_DIR.bak"
  mv "$TARGET_DIR" "$TARGET_DIR.bak"
fi
ln -sf "$SOURCE_ZSH" "$TARGET_DIR"
echo "Symlinked ZSH config."

echo "Done!"

