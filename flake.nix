{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, plasma-manager, ... }:
  let
    system = "x86_64-linux";
    unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };

    mkHost = { hostModule, desktop, sharedModules ? [] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          { nixpkgs.overlays = [ (final: prev: { bun = unstable.bun; }) ]; }
          hostModule
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = sharedModules;
            home-manager.extraSpecialArgs = { inherit desktop; };
            home-manager.users.yuu1111 = import ./home;
          }
        ];
      };
  in
  {
    nixosConfigurations.vm = mkHost {
      hostModule = ./hosts/vm;
      desktop = "kde";
      sharedModules = [ plasma-manager.homeModules.plasma-manager ];
    };

    nixosConfigurations.desktop = mkHost {
      hostModule = ./hosts/desktop;
      desktop = "hyprland";
    };
  };
}
