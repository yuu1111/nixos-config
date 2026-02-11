{ config, pkgs, ... }:

{
  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  # ログイン画面 (KDE標準)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # オーディオ (PipeWire = PulseAudio互換 + ALSA互換)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # フォント
  fonts.packages = with pkgs; [
    noto-fonts # 基本フォント
    noto-fonts-cjk-sans # 日本語フォント
    nerd-fonts.hack # ターミナル用 (アイコン付き)
  ];

  # 日本語入力 (fcitx5 + Mozc)
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc # Google日本語入力互換エンジン
      fcitx5-gtk # GTKアプリとの統合
      fcitx5-qt # QT/KDEアプリとの統合
    ];
  };

  # 権限昇格ダイアログ (GUIアプリがroot権限を要求する時に必要)
  security.polkit.enable = true;
}
