
PROJECT_ROOT=$(git rev-parse --show-toplevel)


sudo ln -sf "$PROJECT_ROOT/nixos/configuration.nix" "/etc/nixos/"
