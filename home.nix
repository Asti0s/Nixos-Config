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

    swaylock-effects
    swayidle
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
        "$mod, L, exec, swaylock"
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

      exec-once = [
        "swayidle -w timeout 300 'swaylock -f' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f'"
      ];
    };
  };


  # Swaylock
  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
      font = "JetBrains Mono";
      font-size = 24;
      indicator-radius = 100;
      indicator-thickness = 7;
      inside-color = "00000088";
      inside-clear-color = "00000088";
      inside-ver-color = "00000088";
      inside-wrong-color = "00000088";
      key-hl-color = "880033";
      line-color = "000000";
      line-clear-color = "000000";
      line-ver-color = "000000";
      line-wrong-color = "000000";
      ring-color = "337777";
      ring-clear-color = "337777";
      ring-ver-color = "337777";
      ring-wrong-color = "550000";
      text-color = "ffffff";
      text-clear-color = "ffffff";
      text-ver-color = "ffffff";
      text-wrong-color = "ffffff";
      };
  };
  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock"; }
      { event = "lock"; command = "${pkgs.swaylock}/bin/swaylock"; }
    ];
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 600; command = "hyprctl dispatch dpms off"; resumeCommand = "hyprctl dispatch dpms on"; }
    ];
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
