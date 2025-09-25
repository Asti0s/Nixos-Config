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

  # Minegrub theme
  boot.loader.grub = {
    gfxmodeEfi = "1920x1080x32";
    theme = "${grubTheme}/minegrub-world-selection";
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
