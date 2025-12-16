#!/usr/bin/env bash

# The base directory where dotfiles repo lives
DOTFILES_DIR="$HOME/Personal/dotfiles"

# Symlink target location
TARGET="$HOME/.config/wezterm/wezterm.lua"

# Source config files inside your dotfiles repo
WEZTERM_SOURCE="$DOTFILES_DIR/wezterm/wezterm.lua"

echo "Creating symlink for the Wezterm config..."

# Create symlink for personal config
if [ -e "$TARGET" ]; then
  echo "Backing up existing $TARGET to $TARGET.bak"
  cp -L "$TARGET" "$TARGET.bak"
fi
ln -sf "$WEZTERM_SOURCE" "$TARGET"
echo "Symlinked the Wezterm config."

echo "Done!"

