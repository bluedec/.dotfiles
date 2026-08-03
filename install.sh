#!/usr/bin/env bash

shopt -s nullglob dotglob

mkdir -p "$HOME/.config"

for item in "$HOME"/Personal/dotfiles/.config/*; do
  ln -sfn "$item" "$HOME/.config/$(basename "$item")"
done

for item in "$HOME"/Personal/dotfiles/.base/*; do
  ln -sfn "$item" "$HOME/$(basename "$item")"
done

sudo rm -rf /etc/nixos
sudo ln -s "$HOME/Personal/dotfiles/nixos" /etc/nixos

echo "Finished!"



