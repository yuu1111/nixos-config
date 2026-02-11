{ config, pkgs, ... }:

let
  browserPkgs = with pkgs; [
    brave
  ];

  fileManagerPkgs = with pkgs; [
    xfce.thunar
    xfce.thunar-archive-plugin
    file-roller
    xdg-utils
  ];

  archivePkgs = with pkgs; [
    unzip
    unrar
    p7zip
  ];

  mediaPkgs = with pkgs; [
    imv
    mpv
    ffmpeg
  ];
in
{
  # ターミナルエミュレータ
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Hack Nerd Font";
      font_size = 12;
      background_opacity = "0.9";
      confirm_os_window_close = 0; # 閉じる時の確認ダイアログを無効化
    };
  };

  home.packages = browserPkgs ++ fileManagerPkgs ++ archivePkgs ++ mediaPkgs;
}
