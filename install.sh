#!/usr/bin/env bash

echo "Running Git config symlink script..."
./scripts/link-gitconfigs.sh

echo "Finished running Git config symlink script."

echo "Running Nvim config symlink script..."
./scripts/link-nvimconfig.sh

echo "Finished Nvim config symlink script."

echo "Running Zsh config symlink script..."
./scripts/link-zshconfig.sh

echo "Finished Zsh config symlink script."

echo "Finished!"



