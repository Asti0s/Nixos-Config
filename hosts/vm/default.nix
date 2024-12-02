{ pkgs, config, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
}

