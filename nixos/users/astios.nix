{ pkgs, ... }:

{
  # Fonts
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
      liberation_ttf
      noto-fonts-color-emoji
    ];
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "fr";
      variant = "";
    };
  };

  # Opengl support
  hardware.graphics = {
    enable = true;
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    wget
    curl
    tree
    htop
  ];

  # Zsh
  programs.zsh.enable = true;

  users.users.astios = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Astios";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    createHome = true;
    initialPassword = "changeme";
  };
}
