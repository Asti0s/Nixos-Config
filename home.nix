{ config, pkgs, ... }:

{
  home.username = "astios";
  home.homeDirectory = "/home/astios";

  home.stateVersion = "24.11"; # Please read the comment before changing.
  programs.home-manager.enable = true;


  # Home pkgs
  home.packages = with pkgs; [
    hello
  ];


  # Hyprland
  # wayland.windowManager.hyprland = {
  #   enable = true;
  # };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  # Env vars
  home.sessionVariables = {
    EDITOR = "nano";
  };
}
