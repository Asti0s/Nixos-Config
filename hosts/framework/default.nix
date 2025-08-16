{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
    ../../nixos/users/astios.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "astios-nixos";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.printing.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    wget
    curl
    tree
    htop
    unzip
    zip
  ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "fr";
      variant = "";
    };
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Battery life
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "25.05";
}
