{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # ランタイム
    nodejs
    bun

    # CLI ツール
    ripgrep # 高速grep
    fd # 高速find
    eza # モダンls
    fzf # ファジーファインダー
    jq # JSON整形/フィルタ
    bat # シンタックスハイライト付きcat

    # Nix
    nil # Nix LSP (エディタ補完用)
    nixpkgs-fmt # Nixフォーマッタ
  ];

  # direnv: ディレクトリごとに環境変数を自動切り替え
  # .envrc に use flake と書くとプロジェクト固有のシェル環境が自動有効化
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; # flake対応
    enableBashIntegration = true;
  };
}
