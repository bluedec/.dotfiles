PROJECT_ROOT=$(git rev-parse --show-toplevel)

TARGET_NIX_CONFIG_PATH="/etc/nixos"
HYPR_TARGET_PATH="$HOME/.config/hypr"


echo "Creating symlinks for Hyprland configs..."

###################################################################
# hyprland.conf
###################################################################
# Create backup for hyprland.conf
if [ -e "$HOME/.config/hypr/hyprland.conf" ]; then
  echo "Backing up existing $HYPR_TARGET_PATH/hyprland.conf to $HYPER_TARGET_PATH/hyprland.conf.bak"
  cp -afL "$HYPR_TARGET_PATH/hyprland.conf" "$HYPR_TARGET_PATH/hyprland.conf.bak"
fi
# Create symlink for hyprland.conf
ln -sf "$PROJECT_ROOT/hyprland/hyprland.conf" "$HYPR_TARGET_PATH/hyprland.conf"

###################################################################
# hyprpaper.conf
###################################################################
# Create backup for hyprpaper.conf
if [ -e "$HOME/.config/hypr/hyprpaper.conf" ]; then
  echo "Backing up existing $HYPR_TARGET_PATH/hyprpaper.conf to $HYPER_TARGET_PATH/hyprpaper.conf.bak"
  cp -afL "$HYPR_TARGET_PATH/hyprpaper.conf" "$HYPR_TARGET_PATH/hyprpaper.conf.bak"
fi
# Create symlink for hyprland.conf
ln -sf "$PROJECT_ROOT/hyprland/hyprpaper.conf" "$HYPR_TARGET_PATH/hyprpaper.conf"

echo "Done."
