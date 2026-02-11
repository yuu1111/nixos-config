{ config, pkgs, ... }:

{
  users.users.yuu1111 = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # sudo 権限
      "networkmanager" # ネットワーク管理権限
    ];
    initialPassword = "114514"; # 初回ログイン用 (要変更)
  };
}
