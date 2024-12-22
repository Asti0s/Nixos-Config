{ config, pkgs, ... }:

{
  home.username = "astios";
  home.homeDirectory = "/home/astios";


  # Home-manager managed packages
  home.packages = with pkgs; [
    firefox
    alacritty

    wofi
    dolphin
    waybar
    dunst
    libnotify
    wl-clipboard
    hyprpaper
  ];


  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, alacritty"

        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, Return, togglefloating"
        "$mod, A, exec, wofi --show drun"
      ];

      monitor = [
        ",preferred,auto,1"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee)";
        "col.inactive_border" = "rgba(595959aa)";
      };
    };
  };


  # Waybar
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      modules-left = ["hyprland/workspaces"];
      modules-center = ["clock"];
      modules-right = ["network" "pulseaudio" "battery"];
    }];
  };


  # Locales
  home.keyboard = {
    layout = "fr";
    variant = "";
  };


  # Git
  programs.git = {
    enable = true;
    userName = "Asti0s";
    userEmail = "mail.astios@gmail.com";
  };


  # Cringe
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
