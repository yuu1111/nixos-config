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

  # Waylandのスクリーンショット/クリップボード (システムレベル)
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
  ];
}
