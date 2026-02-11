{ config, pkgs, ... }:

{
  # ビルドツール (ネイティブ依存のあるパッケージのコンパイル用)
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    openssl
    pkg-config
  ];

  # Docker (必要時にコメントを外す)
  # virtualisation.docker.enable = true;
  # users.users.yuu1111.extraGroups = [ "docker" ];
}
