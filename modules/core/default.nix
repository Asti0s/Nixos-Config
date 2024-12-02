{ inputs, nixpkgs, self, username, host, ... }:

{
  imports = [
    ./hardware.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./xserver.nix
  ];
}

