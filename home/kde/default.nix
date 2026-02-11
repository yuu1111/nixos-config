{ config, pkgs, ... }:

{
  # KDE Plasma のダークテーマ・外観設定
  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "breeze-dark";
      cursor = {
        theme = "Adwaita";
        size = 24;
      };
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
}
