{
  description = "NixOS configuration";

  nixConfig.extra-substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
  ];

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations."framework@astios" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/framework
          ./nixos/users/astios.nix
          { nixpkgs.config.allowUnfree = true; }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              verbose = true;
              extraSpecialArgs = { inherit inputs; };
              users.astios = import ./home/astios/home.nix;
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
        ];
      };
    };
}
