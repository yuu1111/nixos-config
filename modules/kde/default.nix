{ config, pkgs, ... }:

{
  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  # ログイン画面
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # KDE向け fcitx5 Qt統合
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    libsForQt5.fcitx5-qt
  ];
}
