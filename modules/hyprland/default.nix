{ config, pkgs, ... }:

{
  # Hyprland
  programs.hyprland.enable = true;

  # ログイン画面
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Waylandのスクリーンショット/クリップボード
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
  ];
}
