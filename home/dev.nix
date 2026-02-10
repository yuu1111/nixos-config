{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_20
    nodePackages.typescript
    nodePackages.pnpm
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
