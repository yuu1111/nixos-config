{ config, pkgs, ... }:

{
  users.users.dev = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # sudo 権限
      "networkmanager" # ネットワーク管理権限
    ];
    initialPassword = "nixos"; # 初回ログイン用 (要変更)
  };
}
