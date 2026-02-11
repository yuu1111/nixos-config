# NixOS VM セットアップ手順

## 1. VirtualBox VM 作成

| 項目 | 値 |
|---|---|
| RAM | 4096 MB |
| CPU | 2コア |
| ストレージ | 50 GB (VDI, 可変サイズ) |
| グラフィックス | VMSVGA |
| ネットワーク | NAT |

ISO: [NixOS 25.11 Minimal](https://nixos.org/download/#nixos-iso)

## 2. NixOS インストール

ISOからブートし、以下を実行する。

### パーティション作成

```bash
sudo parted /dev/sda -- mklabel msdos
sudo parted /dev/sda -- mkpart primary 1MB -8GB
sudo parted /dev/sda -- mkpart primary linux-swap -8GB 100%
```

### フォーマット・マウント

```bash
sudo mkfs.ext4 -L nixos /dev/sda1
sudo mkswap -L swap /dev/sda2
sudo mount /dev/sda1 /mnt
sudo swapon /dev/sda2
```

### 最小構成で初回インストール

```bash
sudo nixos-generate-config --root /mnt
```

`/mnt/etc/nixos/configuration.nix` を編集して最小限の設定を追加:

```bash
sudo nano /mnt/etc/nixos/configuration.nix
```

閉じ `}` の前に以下を追記:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
environment.systemPackages = with pkgs; [ git vim ];
users.users.dev = {
  isNormalUser = true;
  extraGroups = [ "wheel" ];
  initialPassword = "nixos";
};
```

```bash
sudo nixos-install
# rootパスワードを設定
sudo reboot
```

## 3. Flake構成の適用

再起動後 `dev` ユーザーでログインする(パスワード: `nixos`)。

```bash
# このリポジトリをclone
git clone <リポジトリURL> ~/nixos-config
cd ~/nixos-config

# hardware-configuration.nix をコピー
cp /etc/nixos/hardware-configuration.nix hosts/vm/

# Flake構成で再ビルド
sudo nixos-rebuild switch --flake ~/nixos-config#vm
```

## 4. GPG鍵のインポート

Windows側でエクスポート:

```powershell
gpg --export-secret-keys 62EECDA58B4A967D > key.gpg
```

ファイルをVMに転送(共有フォルダ、scp等)してからインポート:

```bash
gpg --import key.gpg
gpg --edit-key 62EECDA58B4A967D trust
# → 5 (ultimate) を選択 → quit
rm key.gpg
```

## 5. 初回ログイン後

```bash
# パスワード変更
passwd

# Claude Code インストール
bun i -g @anthropic-ai/claude-code

# 動作確認
node --version
bun --version
nvim --version
direnv --version
claude --version
git log --show-signature  # 署名確認
```

