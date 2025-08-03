# 🛠️ Dotfiles Setup

This repository contains my personal **dotfiles** — configuration files and scripts to set up a new machine with my preferred development environment.

It includes configs for:

- `git` (with separate profiles for personal/work use)
- `neovim`
- `zsh`
- Symlink automation
- Install scripts for easy setup on a new system

> **Note:** Sensitive files like `.gitconfig_personal` and `.gitconfig_work` are in `.gitignore` and **should not be committed**.

## ⚙️ Installation

To set up everything:

```bash
git clone git@github.com:yourusername/dotfiles.git ~/.files
cd ~/.files
bash install.bash

