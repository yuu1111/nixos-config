{ config, pkgs, ... }:

let
  launcherPkgs = with pkgs; [
    wofi
  ];

  screenshotPkgs = with pkgs; [
    grim
    slurp
    wl-clipboard
    cliphist
  ];
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # 接続されたモニターを自動検出して使う
      monitor = [ ",preferred,auto,1" ];

      env = [
        # VMなどソフトウェアレンダリングが必要な環境用
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        # fcitx5を入力メソッドとして指定
        "XMODIFIERS,@im=fcitx"
      ];

      cursor = {
        # VM環境でカーソルが消える問題の回避
        no_hardware_cursors = true;
      };

      general = {
        gaps_in = 4; # ウィンドウ間の隙間
        gaps_out = 8; # 画面端との隙間
        border_size = 2;
        "col.active_border" = "rgba(88c0d0ff)"; # Nord blue
        "col.inactive_border" = "rgba(4c566aff)"; # Nord gray
      };

      decoration = {
        rounding = 8; # ウィンドウ角の丸み
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1; # マウスが乗ったウィンドウにフォーカス
      };

      # 起動時に一度だけ実行
      exec-once = [
        "fcitx5 -d" # 日本語入力デーモン
        "wl-paste --watch cliphist store" # クリップボード履歴の記録
      ];

      # Mod キー = Windows/Super キー
      "$mod" = "SUPER";

      bind = [
        # アプリ起動
        "$mod, Return, exec, kitty" # ターミナル
        "$mod, D, exec, wofi --show drun" # アプリランチャー
        "$mod, C, killactive" # ウィンドウを閉じる

        # スクリーンショット
        ", Print, exec, grim - | wl-copy" # 全画面→クリップボード
        "$mod, Print, exec, grim -g \"$(slurp)\" - | wl-copy" # 範囲選択→クリップボード

        # クリップボード履歴
        "$mod, P, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        # ウィンドウ操作
        "$mod, F, fullscreen"
        "$mod, V, togglefloating"

        # フォーカス移動 (Vim風: h/j/k/l)
        "$mod, H, movefocus, l" # 左
        "$mod, L, movefocus, r" # 右
        "$mod, K, movefocus, u" # 上
        "$mod, J, movefocus, d" # 下

        # ワークスペース切り替え
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        # ウィンドウを別ワークスペースに移動
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
      ];

      # マウスバインド (Mod+ドラッグ)
      bindm = [
        "$mod, mouse:272, movewindow" # 左ドラッグ: ウィンドウ移動
        "$mod, mouse:273, resizewindow" # 右ドラッグ: リサイズ
      ];
    };
  };

  # ステータスバー
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "memory" "cpu" ];
        clock.format = "{:%H:%M  %Y-%m-%d}";
        cpu.format = "CPU {usage}%";
        memory.format = "MEM {}%";
        pulseaudio.format = "VOL {volume}%";
      };
    };
  };

  # 通知デーモン
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000; # 5秒で自動消去
      border-radius = 8;
    };
  };

  home.packages = launcherPkgs ++ screenshotPkgs;
}
