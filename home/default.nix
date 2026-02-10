{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./editor.nix
    ./dev.nix
    ./hyprland.nix
    ./theme.nix
    ./xdg.nix
  ];

  home = {
    username = "dev";
    homeDirectory = "/home/dev";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
