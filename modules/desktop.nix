{ config, pkgs, ... }:

let
  fontPkgs = with pkgs; [
    noto-fonts # 基本フォント
    noto-fonts-cjk-sans # 日本語フォント
    nerd-fonts.hack # ターミナル用 (アイコン付き)
  ];

  fcitx5Addons = with pkgs; [
    fcitx5-mozc # Google日本語入力互換エンジン
    fcitx5-gtk # GTKアプリとの統合
  ];
in
{
  # オーディオ (PipeWire = PulseAudio互換 + ALSA互換)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  fonts.packages = fontPkgs;

  # 日本語入力 (fcitx5 + Mozc)
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = fcitx5Addons;
  };

  # fcitx5の環境変数
  # Wayland環境では GTK_IM_MODULE/QT_IM_MODULE は不要 (設定すると警告が出る)
  environment.sessionVariables = {
    XMODIFIERS = "@im=fcitx";
  };

  # 権限昇格ダイアログ (GUIアプリがroot権限を要求する時に必要)
  security.polkit.enable = true;
}
