{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./editor.nix
    ./dev.nix
    ./hyprland.nix
  ];

  home = {
    username = "dev";
    homeDirectory = "/home/dev";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
