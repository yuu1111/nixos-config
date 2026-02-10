{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true; # $EDITOR を nvim に設定
    viAlias = true; # vi コマンドで nvim を起動
    vimAlias = true; # vim コマンドで nvim を起動
  };
}
