#!/usr/bin/env bash

# Set the base directory where your dotfiles repo lives
DOTFILES_DIR="$HOME/Personal/dotfiles"

# Symlink target locations
TARGET="$HOME/.gitconfig"
TARGET_PERSONAL="$HOME/.gitconfig-personal"
TARGET_WORK="$HOME/.gitconfig-work"

# Source config files inside your dotfiles repo
SOURCE="$DOTFILES_DIR/git/.gitconfig"
SOURCE_PERSONAL="$DOTFILES_DIR/git/.gitconfig-personal"
SOURCE_WORK="$DOTFILES_DIR/git/.gitconfig-work"

echo "Creating symlinks for Git configs..."

# Create symlink for base config
if [ -e "$TARGET" ]; then
  echo "Backing up existing $TARGET to $TARGET.bak"
  cp -L "$TARGET" "$TARGET.bak"
fi
ln -sf "$SOURCE" "$TARGET"
echo "Symlinked Git config."

# Create symlink for personal config
if [ -e "$TARGET_PERSONAL" ]; then
  echo "Backing up existing $TARGET_PERSONAL to $TARGET_PERSONAL.bak"
  cp -L "$TARGET_PERSONAL" "$TARGET_PERSONAL.bak"
fi
ln -sf "$SOURCE_PERSONAL" "$TARGET_PERSONAL"
echo "Symlinked personal Git config."

# Create symlink for work config
if [ -e "$TARGET_WORK" ]; then
  echo "Backing up existing $TARGET_WORK to $TARGET_WORK.bak"
  cp -L "$TARGET_WORK" "$TARGET_WORK.bak"
fi
ln -sf "$SOURCE_WORK" "$TARGET_WORK"
echo "Symlinked work Git config."

echo "Done!"

