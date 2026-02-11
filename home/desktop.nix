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

  # fcitx5 入力メソッド設定 (英語キーボード + Mozc)
  xdg.configFile."fcitx5/profile".text = ''
    [Groups/0]
    Name=Default
    Default Layout=us
    DefaultIM=mozc

    [Groups/0/Items/0]
    Name=keyboard-us
    Layout=

    [Groups/0/Items/1]
    Name=mozc
    Layout=

    [GroupOrder]
    0=Default
  '';

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
