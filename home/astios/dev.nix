{ pkgs, ... }:

{
  imports = [
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    nixfmt
    nixd
    clang-tools
  ];
}
