{ config, pkgs, ... }:

{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 7200;
    pinentryPackage = pkgs.pinentry-curses;
  };

  programs.git = {
    enable = true;
    userName = "yuu111";
    userEmail = "yuu210yuu@gmail.com";
    delta.enable = true;
    signing = {
      key = "62EECDA58B4A967D";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
