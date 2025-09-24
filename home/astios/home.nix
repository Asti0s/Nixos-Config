{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./discord.nix
    ./vscode.nix
    ./kitty.nix
    ./zsh.nix
    ./fonts.nix
    ./git.nix
  ];

  home.username = "astios";
  home.homeDirectory = "/home/astios";
  home.stateVersion = "25.05";

  # Gnome natural scrolling
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
  };

  # Packages
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nixd

    # Programs
    unzip
    zip

    # Softwares
    anki
    qbittorrent
    wechat
  ];
}
