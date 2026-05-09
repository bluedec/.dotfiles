{ config, pkgs, ... }:

{
  # ...

  #############################
  ## Basic System Settings
  #############################
  imports = [
    ./hardware-configuration.nix
  ];

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";

  time.timeZone = "America/Argentina/Cordoba";
  time.hardwareClockInLocalTime = false;
  services.timesyncd = {
     enable = true;
     servers = [
       "0.pool.ntp.org"
       "1.pool.ntp.org"
       "2.pool.ntp.org"
     ];
  };
  environment.variables.TZ = "America/Argentina/Cordoba";


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
  
  hardware.bluetooth.enable = true;
  services.blueman.enable = true; # optional but recommended (GUI helper)
  


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
  ## Thunar File Manager ##
  #############################
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin # For handling .zip, .tar, etc.
      thunar-volman         # For volume management (USB drives, etc.)
    ];
  };
  programs.xfconf.enable = true; # Required for Thunar settings

  services.gvfs.enable = true; # For mount/trash functionality
  services.tumbler.enable = true; # For image thumbnails


  #############################
  ## Wayland + Hyperland ##
  #############################
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


  #############################
  ## Zsh ## 
  #############################
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.starship.enable = false;
  programs.zsh.ohMyZsh = {
	enable = true;
	# theme = "af-magic"; # or another theme
	plugins = [ 
  	  "git" 
  	  "z"
  	  "sudo" 
	];
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
  ## Audio - PipeWire ##
  #############################
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  #############################
  ## OBS ##
  #############################
  programs.obs-studio.enableVirtualCamera = true;


  #############################
  ## System Packages ##
  #############################
  environment.systemPackages = with pkgs; [
    # Terminals
    wezterm

    # Terminal Utilities
    lsd
    fzf

    # Zsh
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    pure-prompt


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
    lua
    rustc
    cargo
    rust-analyzer

    # haskell
    # (not stable currently) ghc
    # (not stable currently) cabal-install

    # Language Servers (LSP's)
    # (not stable currently) haskell-language-server
    lua-language-server

    # python
    python3
    python3Packages.pip

    # node
    nodejs_22
    yarn

    # generic
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

    # Thunar (file explorer) things
    xfce.thunar
    xfce.thunar-volman
    xfce.tumbler
    xfce.xfconf
    adwaita-icon-theme
    papirus-icon-theme
    arc-theme

    # Image editing
    gimp

    # LibreOffice
    libreoffice

    # OBS
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
	wlrobs
	obs-backgroundremoval
	obs-pipewire-audio-capture
	obs-gstreamer
	obs-vkcapture
      ];
    })

    # Sensors?
    lm_sensors

    # Usb utilities
    usbutils
  ];


  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-mono
    nerd-fonts.ubuntu-mono
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


