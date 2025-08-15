{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
  ];

  home.username = "astios";
  home.homeDirectory = "/home/astios";
  home.stateVersion = "24.11";

  programs.git = {
    enable = true;
    userName = "asti0s";
    userEmail = "contact.astios@gmail.com";
  };

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
  };

  home.packages = with pkgs; [
    vscode
    discord
    nixfmt-rfc-style
    nixd
  ];
}
