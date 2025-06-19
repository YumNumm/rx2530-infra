# RX2530 M4 Infrastructure

このリポジトリは、RX2530ホームサーバー上で動作するLXDコンテナと仮想マシンを管理するInfrastructure as Code (IaC) プロジェクトです。

## 開発環境セットアップ

### 前提条件

- [mise](https://mise.jdx.dev/) がインストールされていること
- SOPS Age keyが `~/.config/mise/age.txt` に設定されていること
- LXDトークンが環境変数として設定されていること

### セットアップ手順

```bash
# 必要なツールをインストール
mise install

# Terraformを初期化（シークレットが必要）
cd terraform
terraform init -backend-config=backend.tfbackend
```

## 使用方法

### 基本コマンド

```bash
# Terraformファイルをフォーマット
terraform fmt

# 設定を検証
terraform validate

# Terraformファイルをリント
tflint

# 変更を計画
terraform plan

# 変更を適用（注意して使用）
terraform apply
```

### ディレクトリ構造

```log
├── terraform/
│   ├── main.tf              # メインインフラストラクチャ定義
│   ├── provider.tf          # LXDプロバイダー設定
│   ├── backend.tf           # リモートステート設定
│   ├── variable.tf          # 変数定義
│   └── cloud-init/          # インスタンス初期化設定
├── CLAUDE.md                # Claude Code用プロジェクト指示
├── mise.toml               # 開発ツールチェーン設定
└── .env.yaml               # SOPS暗号化環境変数
```
