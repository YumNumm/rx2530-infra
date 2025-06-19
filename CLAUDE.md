# CLAUDE.md

このファイルは、このリポジトリでコードを扱う際にClaude Code (claude.ai/code) に対するガイダンスを提供します。

## プロジェクト概要

これはLXDコンテナと仮想マシンを使用してホームサーバーインフラを管理するInfrastructure as Code (IaC) プロジェクトです。RX2530ホームサーバー上で動作し、各種サービス用の12以上のLXDインスタンス（コンテナとVM）を管理しています。

## 一般的なコマンド

### 開発環境のセットアップ

```bash
# miseで必要なツールをインストール
mise install

# Terraformをバックエンド設定で初期化（シークレットが必要）
cd terraform
terraform init -backend-config=backend.tfbackend
```

### Terraform操作

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

### SOPSシークレット管理

```bash
# 暗号化された環境ファイルを編集
sops .env.yaml

# シークレットを復号化して表示
sops -d .env.yaml
```

## アーキテクチャ

### コアインフラストラクチャコンポーネント

- **LXDプロバイダー**: 192.168.1.100:443のリモートLXDホスト上でコンテナとVMを管理
- **リモートステート**: 暗号化されたCloudflare R2バックエンドに保存
- **シークレット管理**: 機密データ用のAge暗号化によるSOPS
- **セルフホスト型CI/CD**: GitHub Actionsランナーが実際のインフラストラクチャ上で実行（runs-on: rx2530）

### インフラストラクチャレイアウト

メインインフラストラクチャは以下で構成されています：

- **サービスコンテナ**: loki, docker-registry, media, eqmonitor, network, monitor, sandbox, tv, packer-lxd, github-actions-runner
- **仮想マシン**: ubuntu-desktop (16 CPU, 24GB RAM), win11 (80 CPU, 32GB RAM)
- **リソース管理**: GPUパススルー, /mnt/HDD/からのストレージマウント, インスタンスごとのメモリとCPU制限

### 設定構造

- `terraform/main.tf`: コアインフラストラクチャ定義
- `terraform/provider.tf`: LXDプロバイダー設定 (バージョン 2.5.0)
- `terraform/backend.tf`: R2リモートステート設定
- `terraform/cloud-init/`: インスタンス初期化テンプレート
- `.env.yaml`: SOPS暗号化された環境変数
- `mise.toml`: 開発ツールチェーン設定

## 開発ワークフロー

1. **ローカル変更**: `terraform/`ディレクトリ内のTerraformファイルを変更
2. **PR作成**: 自動計画とtfcmtコメント機能付きのterraform-planワークフローをトリガー
3. **メインへのマージ**: 自動デプロイメント用のterraform-applyワークフローをトリガー
4. **シークレット管理**: 機密設定変更にはSOPSを使用

## 重要な注意点

- すべてのTerraform操作には適切なバックエンド設定（backend.tfbackendファイル）が必要
- インフラストラクチャはセルフホスト型GitHub Actionsランナーを使用するため、CI/CDは実際のターゲットインフラストラクチャ上で実行される
- `var.LXD_RX2530_TOKEN`によるLXDトークン認証が必要
- シークレット操作にはSOPS Age keyを`~/.config/mise/age.txt`に設定する必要がある
- 変更をコミットする前に必ず`terraform fmt`と`tflint`を実行する
