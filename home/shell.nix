{ config, pkgs, ... }:

{
  # bun global bin (claude-code等)
  home.sessionPath = [ "$HOME/.bun/bin" ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -l";
      la = "eza -la";
      gs = "git status";
      gd = "git diff";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#vm"; # NixOS再ビルド
    };
  };

  # Starship: カスタマイズ可能なプロンプト (~/.config/starship.toml で設定)
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}
