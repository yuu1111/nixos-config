{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    openssl
    pkg-config
  ];

  # Docker (必要時にコメントを外す)
  # virtualisation.docker.enable = true;
  # users.users.dev.extraGroups = [ "docker" ];
}
