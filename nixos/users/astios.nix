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

  # Virtualization
  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
      enableKvm = true;
      addNetworkInterface = false;
    };
    docker = {
      enable = true;
      daemon.settings = {
        dns = [
          "8.8.8.8"
          "1.1.1.1"
        ];
      };
    };
  };

  networking.networkmanager.insertNameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];

  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_amd nested=1
  '';
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

  environment.systemPackages = with pkgs; [
    qemu_full
    virt-viewer
    libguestfs
    nodejs_25
    bun
  ];

  nix.settings = {
    trusted-users = [
      "root"
      "astios"
    ];

    substituters = [
      # China mirrors
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

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
      "libvirtd"
      "kvm"
      "docker"
      "vboxusers"
    ];
    createHome = true;
    initialPassword = "changeme";
  };
}
