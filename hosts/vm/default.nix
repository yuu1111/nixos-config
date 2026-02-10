{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/dev.nix
    ../../modules/user.nix
  ];

  networking.hostName = "nixos-vm";

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  boot.initrd.checkJournalingFS = false;

  virtualisation.virtualbox.guest.enable = true;
}
