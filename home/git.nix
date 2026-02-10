{ config, pkgs, ... }:

{
  # GPG (コミット署名用)
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600; # パスフレーズのキャッシュ: 1時間
    maxCacheTtl = 7200; # 最大キャッシュ: 2時間
    pinentryPackage = pkgs.pinentry-curses; # ターミナルでパスフレーズ入力
  };

  programs.git = {
    enable = true;
    userName = "yuu1111";
    userEmail = "yuu210yuu@gmail.com";
    delta.enable = true; # diff をシンタックスハイライト付きで表示
    signing = {
      key = "62EECDA58B4A967D";
      signByDefault = true; # 全コミットを自動署名
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true; # pull 時にマージコミットを作らない
    };
  };
}
