#!/usr/bin/env bash

# Set the base directory where your dotfiles repo lives
DOTFILES_DIR="$HOME/Personal/dotfiles"

# Symlink target locations
TARGET_I3="$HOME/.config/i3/config"
TARGET_PICOM="$HOME/.config/picom/picom.conf"

# Source config files inside your dotfiles repo
SOURCE_I3="$DOTFILES_DIR/i3/config"
SOURCE_PICOM="$DOTFILES_DIR/i3/picom/picom.conf"

echo "Creating symlinks for i3 configs..."

if [ ! -d "$HOME/.config/i3" ]; then
  mkdir "$HOME/.config/i3"
fi
if [ ! -d "$HOME/.config/picom" ]; then
  mkdir "$HOME/.config/picom"
fi

# Create symlink for i3 config
if [ -e "$TARGET_I3" ]; then
  echo "Backing up existing $TARGET_I3 to $TARGET_I3.bak"
  cp -L "$TARGET_I3" "$TARGET_I3.bak"
fi
ln -sf "$SOURCE_I3" "$TARGET_I3"
echo "Symlinked i3 config."

# Create symlink for Picom config
if [ -e "$TARGET_PICOM" ]; then
  echo "Backing up existing $TARGET_PICOM to $TARGET_PICOM.bak"
  cp -L "$TARGET_PICOM" "$TARGET_PICOM.bak"
fi
ln -sf "$SOURCE_PICOM" "$TARGET_PICOM"
echo "Symlinked personal Picom config."

echo "Done!"

