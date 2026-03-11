{ config, pkgs, ... }:

{
  # flake と nix コマンドを有効化
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # unfreeパッケージを許可
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Tokyo";

  # 日本語にしている
  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "ja_JP.UTF-8";
      LC_MESSAGES = "ja_JP.UTF-8";
    };
  };

  # ネットワーク
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  services.openssh.enable = true;

  # 最低限のシステムツール
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    htop
    tree
    fastfetch
  ];

  # NixOSのバージョン追跡用
  system.stateVersion = "25.11";
}
