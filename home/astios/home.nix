{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./discord.nix
    ./vscode.nix
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
    nixfmt-rfc-style
    nixd

    # Rust
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer

    # Softwares
    anki
  ];
}
