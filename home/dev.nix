{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    bun
    ripgrep
    fd
    eza
    fzf
    jq
    bat
    nil
    nixpkgs-fmt
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
  };
}
