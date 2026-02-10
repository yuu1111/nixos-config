{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -l";
      la = "eza -la";
      gs = "git status";
      gd = "git diff";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#vm";
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}
