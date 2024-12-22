{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];


  # Experimental settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Networking
  networking.hostName = "astios";
  networking.networkmanager.enable = true;


  # System pkgs
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    git

    wayland
    xwayland
    polkit_gnome
  ];


  # Locales
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  console.keyMap = "fr";


  # User account
  users.users.astios = {
    isNormalUser = true;
    description = "Astios";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" ];
  };


  # Graphics
  hardware.graphics.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };


  # Sound
  hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  # Nix garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };


  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];


  # Services
  services.openssh.enable = true;
  services.dbus.enable = true;
  services.gvfs.enable = true;


  # Env vars
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };


  # Security
  security = {
    polkit.enable = true;
    pam.services.swaylock = {};
  };


  # System version
  system.stateVersion = "24.11";
}
