{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # home-manager が使う nixpkgs を上の nixpkgs に揃える
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }: {
    # "vm" という名前のNixOS構成を定義
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/vm # VM固有のハードウェア設定・ブートローダー
        home-manager.nixosModules.home-manager
        {
          # システム全体の pkgs をhome-managerでも共有
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # plasma-manager を home-manager のモジュールとして共有
          home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
          # yuu1111 ユーザーのhome-manager設定
          home-manager.users.yuu1111 = import ./home;
        }
      ];
    };
  };
}
