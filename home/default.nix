{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix # シェル設定 (bash, エイリアス, starship)
    ./git.nix # Git + GPG署名
    ./editor.nix # Neovim
    ./dev.nix # 開発ツール (Node.js, CLI等)
    ./desktop.nix # 共通デスクトップアプリ (ブラウザ, アーカイブ, メディア)
    # ./hyprland.nix # Hyprland用 (タイリングWM, waybar, mako) ※KDE時は不要
    ./theme.nix # GTKテーマ + カーソル
    ./xdg.nix # デフォルトアプリの関連付け
  ];

  home = {
    username = "dev";
    homeDirectory = "/home/dev";
    stateVersion = "25.11"; # home-managerのバージョン追跡用 (手動変更不要)
  };

  programs.home-manager.enable = true;
}
