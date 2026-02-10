{ config, pkgs, ... }:

{
  # GTK テーマ (Thunar, file-roller 等のGTKアプリに適用)
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark"; # ダークテーマ
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      size = 24;
    };
  };

  # Wayland 全体のカーソル設定
  home.pointerCursor = {
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };
}
