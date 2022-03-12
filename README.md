# 環境構築手順

## 前提
※前提としてaws cliがインストールされていること。

## 手順

tfenvのインストール

```
ShuheinoMacBook-ea:.aws $ brew install tfenv
Warning: You are using macOS 10.13.
We (and Apple) do not provide support for this old version.
You will encounter build failures with some formulae.
```

terraformのインストール

```
ShuheinoMacBook-ea:.aws $ brew tap hashicorp/tap
Running `brew update --preinstall`...
==> Auto-updated Homebrew!
...
ShuheinoMacBook-ea:.aws $ brew install hashicorp/tap/terraform
...
```

assume-roleのインストール

```
ShuheinoMacBook-ea:.aws $ brew install remind101/formulae/assume-role
==> Tapping remind101/formulae
Cloning into '/usr/local/Homebrew/Library/Taps/remind101/homebrew-formulae'...
remote: Enumerating objects: 68, done.
```

profileの追加

```
ShuheinoMacBook-ea:.aws $ aws configure set aws_access_key_id {xxxxxxxxxxxx} --profile={任意のprofile名}
ShuheinoMacBook-ea:.aws $ aws configure set aws_secret_access_key {xxxxxxxxxxxxxxxxxxx} --profile={任意のprofile名}
```

tfenvでversionのインストールと指定（2022/3/12時点1.1.7で固定）

```
ShuheinoMacBook-ea:prod $ tfenv install 1.1.7
...
ShuheinoMacBook-ea:prod $ tfenv use 1.1.7
Switching default version to v1.1.7
Switching completed
```

クレデンシャルのセット

```
ShuheinoMacBook-ea:sukipi-match-infrastrucre $ eval $(assume-role {追加したprofile名})
```

ディレクトリ移動と初期化

```
ShuheinoMacBook-ea:sukipi-match-infrastrucre $ cd prod/
ShuheinoMacBook-ea:prod $ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.5.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```