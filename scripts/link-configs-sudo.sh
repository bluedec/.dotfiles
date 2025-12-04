PROJECT_ROOT=$(git rev-parse --show-toplevel)

TARGET_NIX_CONFIG_PATH="/etc/nixos"

echo "Creating symlinks for NixOs configs..."

# configuration.nix
###################################################################
# Create backup for configuration.nix
if [ -e "/etc/nixos/configuration.nix" ]; then
  echo "Backing up existing /etc/nixos/configuration.nix to /etc/nixos/configuration.nix.bak"
  mv "/etc/nixos/configuration.nix" "/etc/nixos/configuration.nix.bak"
fi
# Create symlink for configuration.nix
ln -sf "$PROJECT_ROOT/nixos/configuration.nix" "/etc/nixos/configuration.nix"
###################################################################

# hardware-configuration.nix
###################################################################
# Create backup for hardware-configuration.nix
if [ -e "/etc/nixos/hardware-configuration.nix" ]; then
  echo "Backing up existing /etc/nixos/hardware-configuration.nix to /etc/nixos/hardware-configuration.nix.bak"
  mv "/etc/nixos/hardware-configuration.nix" "/etc/nixos/hardware-configuration.nix.bak"
fi
# Create symlink for hardware-configuration.nix
ln -sf "$PROJECT_ROOT/nixos/hardware-configuration.nix" "/etc/nixos/hardware-configuration.nix"
###################################################################

echo "Done."
