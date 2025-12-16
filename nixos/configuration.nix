{ config, pkgs, ... }:

{
  # ...

  # Note from Jesu
  # To rebuild the system, use sudo ```nixos-rebuild switch --flake /etc/nixos#my-hostname```
  # since we are using flakes


  #############################
  ## Basic System Settings
  #############################
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";

  time.timeZone = "America/Argentina/Buenos_Aires";

  #############################
  ## Stylix
  #############################
  #stylix.enable = true;
  #stylix.base16Scheme = {
  #  base00 = "181818";
  #  base01 = "282828";
  #  base02 = "383838";
  #  base03 = "585858";
  #  base04 = "b8b8b8";
  #  base05 = "d8d8d8";
  #  base06 = "e8e8e8";
  #  base07 = "f8f8f8";
  #  base08 = "ab4642";
  #  base09 = "dc9656";
  #  base0A = "f7ca88";
  #  base0B = "a1b56c";
  #  base0C = "86c1b9";
  #  base0D = "7cafc2";
  #  base0E = "ba8baf";
  #  base0F = "a16946";
  #};
  #stylix.image = /home/julien/Wallpapers/corgi-succeed.jpg;

  #############################
  ## Graphics
  #############################
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  };
  hardware.graphics = {
	enable32Bit = true;
	enable = true;
  };

  #############################
  ## Variables ##
  #############################
  environment.variables = {
	XCURSOR_THEME = "Bibata-Modern-Ice";
	XCURSOR_SIZE = "24";
	GOOGLE_CHROME_FLAGS = "--disable-gpu --use-gl=desktop";
	CHROMIUM_FLAGS = "--disable-gpu --use-gl=desktop";
	VIVALDI_FLAGS = "--disable-gpu --use-gl=desktop";
	__GLX_VENDOR_LIBRARY_NAME = "nvidia";
	WLR_NO_HARDWARE_CURSORS = "1";
  };


  #############################
  ## Wayland + Hyperland ##
  #############################
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  #############################
  ## Shell & Terminal
  #############################
  users.defaultUserShell = pkgs.zsh;

  #############################
  ## Zsh ## 
  #############################
  programs.starship.enable = false;
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
	enable = true;
	theme = "af-magic"; # or another theme
	plugins = [ "git" "z" "sudo" ];
  };

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


  environment.systemPackages = with pkgs; [
    # Terminals
    wezterm

    # Terminal Utilities
    lsd
    fzf

    # Social
    discord-ptb

    # Browsers
    google-chrome
    (google-chrome.override {
      commandLineArgs = [
        # Flag to fix the main flicker (which you already identified)
        "--disable-gpu-compositing"
        
        # Keep it running in native Wayland mode (if desired)
        "--ozone-platform=wayland" 
      ];
    })
    firefox
    vivaldi
    vivaldi-ffmpeg-codecs

    # Programming
    rustc
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
    hyprpaper
    swaybg

    # file search
    evince

    # Lock + logout
    wlogout
    swaylock-effects

    # System tools
    htop
    btop
    jq

    # Cursor Theme
    bibata-cursors

    # Sound Control
    pavucontrol

    # Database Manager
    dbeaver-bin

    # To run programs without installing them
    comma

    
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome
    noto-fonts
    noto-fonts-color-emoji
  ];

  #############################
  ## DIRENV
  #############################
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  

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


