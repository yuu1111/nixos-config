{ config, pkgs, ... }:

{
  # Hyprland (Waylandタイリングウィンドウマネージャ)
  programs.hyprland.enable = true;

  # ログイン画面 (TUIベースのgreeter)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'WLR_RENDERER_ALLOW_SOFTWARE=1 Hyprland'";
        user = "greeter";
      };
    };
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

  # Waylandのスクリーンショット/クリップボード (システムレベル)
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
  ];

  # 日本語入力 (fcitx5 + Mozc)
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc # Google日本語入力互換エンジン
      fcitx5-gtk # GTKアプリとの統合
    ];
  };

  # 権限昇格ダイアログ (GUIアプリがroot権限を要求する時に必要)
  security.polkit.enable = true;
}
