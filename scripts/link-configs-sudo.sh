PROJECT_ROOT=$(git rev-parse --show-toplevel)

TARGET_NIX_CONFIG_PATH="/etc/nixos"

echo "Creating symlinks for NixOs configs..."

###################################################################
# configuration.nix
###################################################################
# Create backup for configuration.nix
if [ -e "/etc/nixos/configuration.nix" ]; then
  echo "Backing up existing /etc/nixos/configuration.nix to /etc/nixos/configuration.nix.bak"
  cp -L "/etc/nixos/configuration.nix" "/etc/nixos/configuration.nix.bak"
fi
# Create symlink for configuration.nix
ln -sf "$PROJECT_ROOT/nixos/configuration.nix" "/etc/nixos/configuration.nix"

###################################################################
# hardware-configuration.nix
###################################################################
# Create backup for hardware-configuration.nix
if [ -e "/etc/nixos/hardware-configuration.nix" ]; then
  echo "Backing up existing /etc/nixos/hardware-configuration.nix to /etc/nixos/hardware-configuration.nix.bak"
  cp -L "/etc/nixos/hardware-configuration.nix" "/etc/nixos/hardware-configuration.nix.bak"
fi
# Create symlink for hardware-configuration.nix
ln -sf "$PROJECT_ROOT/nixos/hardware-configuration.nix" "/etc/nixos/hardware-configuration.nix"

###################################################################
# flake.nix
###################################################################
# Create backup for flake.nix
if [ -e "/etc/nixos/flake.nix" ]; then
  echo "Backing up existing /etc/nixos/flake.nix to /etc/nixos/flake.nix.bak"
  cp -L "/etc/nixos/flake.nix" "/etc/nixos/flake.nix.bak"
fi
# Create symlink for flake.nix
ln -sf "$PROJECT_ROOT/nixos/flake.nix" "/etc/nixos/flake.nix"

###################################################################
# zsh.nix
###################################################################
# Create folder if it doesn't exist
if [ ! -d "/etc/nixos/modules" ]; then
  mkdir "/etc/nixos/modules"
fi
# Create backup for zsh.nix
if [ -e "/etc/nixos/modules/zsh.nix" ]; then
  echo "Backing up existing /etc/nixos/modules/zsh.nix to /etc/nixos/modules/zsh.nix.bak"
  cp -L "/etc/nixos/modules/zsh.nix" "/etc/nixos/modules/zsh.nix.bak"
fi
# Create symlink for zsh.nix
ln -sf "$PROJECT_ROOT/nixos/modules/zsh.nix" "/etc/nixos/modules/zsh.nix"

echo "Done."
