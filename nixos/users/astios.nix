{
  home-manager = {
    users.astios = import ../../home/astios/home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  users.users.astios = {
    isNormalUser = true;
    description = "Astios";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    createHome = true;
    initialPassword = "changeme";
  };
}
