{ config, pkgs, ... }:

{
  home.username = "astios";
  home.homeDirectory = "/home/astios";

  # Home-manager managed packages
  home.packages = with pkgs; [
    firefox
    alacritty
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Basic git configuration
  programs.git = {
    enable = true;
    userName = "Asti0s";
    userEmail = "mail.astios@gmail.com";
  };

  home.stateVersion = "24.11";
}
