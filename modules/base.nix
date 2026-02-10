{ config, pkgs, ... }:

{
  # flake と nix コマンドを有効化
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # unfreeパッケージを許可 (unrar等)
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Tokyo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "ja_JP.UTF-8"; # 日付表示を日本語形式に
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
  ];

  # NixOSのバージョン追跡用 (手動変更不要)
  system.stateVersion = "25.11";
}
