{ config, pkgs, ... }:

{
  # ...

  #############################
  ## Basic System Settings
  #############################
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";

  time.timeZone = "America/Argentina/Buenos_Aires";

  #############################
  ## NVIDIA Drivers
  #############################
  hardware.opengl.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  #############################
  ## Variables ##
  #############################
  environment.variables = {
     XCURSOR_THEME = "Bibata-Modern-Ice";
     XCURSOR_SIZE = "24";
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  };

  #############################
  ## Wayland + Hyperland
  #############################
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprland.withUWSM = true;

  #############################
  ## Zsh ## 
  #############################
  programs.starship.enable = false;
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh {
	enable = true;
	theme = "af-magic"; # or another theme
	plugins = [ "git" "z" "sudo" ];
  }

  # wlroots backend
  programs.waybar.enable = true;
  services.greetd.enable = true;

  services.greetd.settings = {
    default_session = {
      command = "${pkgs.hyprland}/bin/Hyprland";
      user = "julien";
    };
  };

  #############################
  ## Audio - PipeWire
  #############################
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  #############################
  ## Shell & Terminal
  #############################
  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    # Terminals
    wezterm

    # Terminal Utilities
    lsd

    # Browsers
    google-chrome

    # Programming
    rustup
    cargo
    rust-analyzer

    python3
    python3Packages.pip

    nodejs_22
    yarn

    git
    wget
    curl
    unzip
    neovim

    # Wayland utilities
    wofi
    wlr-randr
    wl-clipboard
    grim
    slurp
    swaybg

    # Lock + logout
    wlogout
    swaylock-effects

    # System tools
    htop
    btop
    jq

    # cursor theme
    bibata-cursors
  ];

  #############################
  ## Chrome Sandbox Fix
  #############################
  security.chromiumSuidSandbox.enable = true;

  #############################
  ## User config
  #############################
  users.users.julien = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "docker" ];
  };

  #############################
  ## Bootloader
  #############################
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #############################
  ## Networking
  #############################
  networking.networkmanager.enable = true;

  #############################
  ## Docker
  #############################
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;

    autoPrune = {
      enable = true;
      dates = "weekly";
    };

    # Optional: enable GPU support inside docker
    # extraOptions = "--add-runtime=nvidia=/run/current-system/sw/bin/nvidia-container-runtime";
  };
}


