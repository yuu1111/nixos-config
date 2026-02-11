{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # nixos-generate-config が生成したハードウェア設定
    ../../modules/base.nix # 基本設定 (locale, ネットワーク等)
    ../../modules/dev.nix # 開発ツール (gcc, make等)
    ../../modules/user.nix # ユーザーアカウント
    ../../modules/desktop.nix # 共通デスクトップ (音声, フォント, fcitx5)
    ../../modules/kde # KDE Plasma + SDDM
    # ../../modules/hyprland # Hyprland + greetd
  ];

  networking.hostName = "nixos-vm";

  # ブートローダー (BIOS/MBR)
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  # VM環境ではジャーナリングチェックをスキップ (起動高速化)
  boot.initrd.checkJournalingFS = false;

  # VirtualBox Guest Additions (共有フォルダ, 解像度自動調整等)
  virtualisation.virtualbox.guest.enable = true;
}
