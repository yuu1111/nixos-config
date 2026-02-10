{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./editor.nix
    ./dev.nix
  ];

  home = {
    username = "dev";
    homeDirectory = "/home/dev";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
