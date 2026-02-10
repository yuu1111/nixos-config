{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Tokyo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "ja_JP.UTF-8";
    };
  };

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    htop
    tree
  ];

  system.stateVersion = "25.11";
}
