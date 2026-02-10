# デスクトップ環境の使い方

Flake 適用後、再起動すると tuigreet (ログイン画面) → Hyprland が起動する。

## キーバインド一覧

| キー | 動作 |
|---|---|
| SUPER + Return | ターミナル(kitty)を開く |
| SUPER + D | アプリランチャー(wofi)を開く |
| SUPER + C | ウィンドウを閉じる |
| SUPER + F | フルスクリーン |
| SUPER + V | フローティング切替 |
| SUPER + H/J/K/L | フォーカス移動(左/下/上/右) |
| SUPER + 1-9 | ワークスペース切替 |
| SUPER + SHIFT + 1-9 | ウィンドウをワークスペースに移動 |

## Brave ブラウザ

wofi から起動する:

```
SUPER + D → "brave" と入力 → Enter
```

## 日本語入力 (fcitx5 + mozc)

Hyprland 起動時に fcitx5 がデーモンとして自動起動する。

### 入力切替

`Ctrl + Space` で英語/日本語(mozc)を切り替える。

### 初回設定が必要な場合

fcitx5 の入力メソッドに mozc が追加されていない場合は手動で設定する:

```bash
fcitx5-configtool
```

1. 左下の「+」ボタンをクリック
2. 「Only Show Current Language」のチェックを外す
3. 「Mozc」を検索して追加
4. OK で閉じる

### 動作確認

```bash
# fcitx5 が起動しているか確認
fcitx5-remote
# 0: 閉じている, 1: 英語, 2: 日本語

# 環境変数が設定されているか確認
echo $GTK_IM_MODULE   # fcitx
echo $QT_IM_MODULE    # fcitx
echo $XMODIFIERS      # @im=fcitx
```

kitty や Brave で `Ctrl + Space` を押し、日本語が入力できれば OK。
