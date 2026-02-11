{ config, pkgs, ... }:

{
  # デフォルトアプリの関連付け
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # ブラウザ
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";

      # ファイルマネージャ
      "inode/directory" = "thunar.desktop";

      # 画像ビューア
      "image/png" = "imv-dir.desktop";
      "image/jpeg" = "imv-dir.desktop";
      "image/gif" = "imv-dir.desktop";
      "image/webp" = "imv-dir.desktop";
    };
  };
}
