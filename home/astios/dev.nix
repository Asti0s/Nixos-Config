{ pkgs, ... }:

{
  imports = [
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    bun
    prisma
    podman
    podman-compose
    podman-desktop
    nixfmt-rfc-style
    nixd
    clang-tools
  ];
}
