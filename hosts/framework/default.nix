{ pkgs, ... }:
let
  grubTheme = pkgs.fetchFromGitHub {
    owner = "Lxtharia";
    repo = "minegrub-world-sel-theme";
    rev = "00254ae5e1836ede1ad502b74dac162eab8eebe2";
    hash = "sha256-X3AevoAmeyAAWkofXhK8vkfFO7lUSct0sAyKQ5MD6ak=";
  };
in
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      gfxmodeEfi = "1920x1080x32";
      theme = "${grubTheme}/minegrub-world-selection";
    };
  };

  # Opengl support
  hardware.graphics = {
    enable = true;
  };

  # Networking
  networking.hostName = "framework-nixos";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.printing.enable = true;

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

  system.stateVersion = "25.11";
}
