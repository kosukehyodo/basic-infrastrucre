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

クレデンシャルのセット（profileの追記）

```
ShuheinoMacBook-ea:.aws $ aws configure set aws_access_key_id {xxxxxxxxxxxx} --profile=sukipi
ShuheinoMacBook-ea:.aws $ aws configure set aws_secret_access_key {xxxxxxxxxxxxxxxxxxx} --profile=sukipi
```

tfenvでversion指定

```
ShuheinoMacBook-ea:prod $ tfenv install 1.1.7
...
ShuheinoMacBook-ea:prod $ tfenv use 1.1.7
Switching default version to v1.1.7
Switching completed
```

