{ config, pkgs, ... }:

let
  runtimePkgs = with pkgs; [
    nodejs
    bun
  ];

  cliPkgs = with pkgs; [
    ripgrep # 高速grep
    fd # 高速find
    eza # モダンls
    fzf # ファジーファインダー
    jq # JSON整形/フィルタ
    bat # シンタックスハイライト付きcat
  ];

  gitHostingPkgs = with pkgs; [
    gh # GitHub CLI
    glab # GitLab CLI
  ];

  nixPkgs = with pkgs; [
    nil # Nix LSP (エディタ補完用)
    nixpkgs-fmt # Nixフォーマッタ
  ];
in
{
  home.packages = runtimePkgs ++ cliPkgs ++ gitHostingPkgs ++ nixPkgs;

  # direnv: ディレクトリごとに環境変数を自動切り替え
  # .envrc に use flake と書くとプロジェクト固有のシェル環境が自動有効化
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; # flake対応
    enableBashIntegration = true;
  };
}
