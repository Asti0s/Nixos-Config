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
    };
  };

  # Networking
  networking.hostName = "framework-nixos";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.printing.enable = true;

  # Tailscale
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

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
