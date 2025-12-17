{ pkgs, ... }:
{
  # Timezone
  time.timeZone = "Asia/Shanghai";

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

  # Tsinghua mirror
  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
  ];

  # Tailscale
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
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

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Zsh
  programs.zsh.enable = true;

  # User
  users.users.astios = {
    shell = pkgs.zsh;
    useDefaultShell = true;
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
