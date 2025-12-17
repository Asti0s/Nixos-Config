{ pkgs, ... }:

{
  imports = [
    ./vscode.nix
    ./dev.nix
    ./firefox.nix
    ./discord.nix
    ./kitty.nix
    ./zsh.nix
    ./fonts.nix
    ./git.nix
    ./starship.nix
  ];

  home.username = "astios";
  home.homeDirectory = "/home/astios";
  home.stateVersion = "25.11";

  # Gnome natural scrolling
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
  };

  # Packages
  home.packages = with pkgs; [
    # Programs
    wget
    curl
    tree
    htop

    # Softwares
    anki
    qbittorrent
  ];
}
