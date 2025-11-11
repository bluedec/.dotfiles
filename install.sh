#!/usr/bin/env bash


if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi
./scripts/link-gitconfigs.sh
./scripts/link-nvimconfig.sh
./scripts/link-zshconfig.sh
./scripts/link-wezconfig.sh

echo "Finished!"



