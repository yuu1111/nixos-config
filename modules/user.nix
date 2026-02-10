{ config, pkgs, ... }:

{
  users.users.dev = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "nixos";
  };
}
