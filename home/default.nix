{ config, pkgs, desktop, ... }:

let
  deModule = {
    kde = ./kde;
    hyprland = ./hyprland;
  };
in
{
  imports = [
    ./shell.nix
    ./git.nix
    ./editor.nix
    ./dev.nix
    ./desktop.nix
    ./theme.nix
    ./xdg.nix
    deModule.${desktop}
  ];

  home = {
    username = "yuu1111";
    homeDirectory = "/home/yuu1111";
    stateVersion = "25.11"; # home-managerのバージョン追跡用
  };

  programs.home-manager.enable = true;
}
