{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # nixos-generate-config が生成したハードウェア設定
    ../../modules/base.nix
    ../../modules/dev.nix
    ../../modules/user.nix
    ../../modules/desktop.nix
    ../../modules/hyprland
  ];

  networking.hostName = "desktop";

  # ブートローダー (UEFI)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
