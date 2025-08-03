#!/usr/bin/env bash

# The base directory where dotfiles repo lives
DOTFILES_DIR="$HOME/Personal/dotfiles"

# Symlink target location
TARGET_DIR="$HOME/.config/nvim"

# Source config files inside your dotfiles repo
SOURCE="$DOTFILES_DIR/nvim"

echo "Creating symlinks for NVIM configs..."

# Create symlink for personal config
if [ -e "$TARGET_DIR" ]; then
  echo "Backing up existing $TARGET_DIR to $TARGET_DIR"_BAK
  mv "$TARGET_DIR" "$TARGET_DIR"_BAK
fi
ln -sf "$SOURCE" "$TARGET_DIR"
echo "Symlinked NVIM config."

echo "Done!"

