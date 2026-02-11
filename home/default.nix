{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix # シェル設定 (bash, エイリアス, starship)
    ./git.nix # Git + GPG署名
    ./editor.nix # Neovim
    ./dev.nix # 開発ツール (Node.js, CLI等)
    ./desktop.nix # 共通デスクトップアプリ (ブラウザ, アーカイブ, メディア)
    ./kde # KDE固有 (fcitx5プロファイル等)
    # ./hyprland # Hyprland固有 (タイリングWM, waybar, mako)
    ./theme.nix # GTKテーマ + カーソル
    ./xdg.nix # デフォルトアプリの関連付け
  ];

  home = {
    username = "yuu1111";
    homeDirectory = "/home/yuu1111";
    stateVersion = "25.11"; # home-managerのバージョン追跡用 (手動変更不要)
  };

  programs.home-manager.enable = true;
}
