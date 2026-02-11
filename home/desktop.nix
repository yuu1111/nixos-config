{ config, pkgs, ... }:

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

  home.packages = with pkgs; [
    # ブラウザ
    brave

    # ファイル管理
    xfce.thunar
    xfce.thunar-archive-plugin
    file-roller
    xdg-utils

    # アーカイブ
    unzip
    unrar
    p7zip

    # メディア
    imv
    mpv
    ffmpeg
  ];
}
