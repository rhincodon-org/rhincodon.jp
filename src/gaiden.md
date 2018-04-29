## モチベーション

* 時系列な作業ログは、jBakeさんで書いて、抽象化した情報をGaidenにまとめて、ノウハウ貯めて未来の作業ラクする。

## 構成

![構成](/img/gaiden.png)


## 手順

* ベースは、jBakeで作った環境を流用
* ホストにgaidenのインストール
* jenkinsでサイトのビルド・デプロイ用のJobを作る

## ホストにgaidenのインストール

```
su - hogehogeslave
source "/home/hogehogeslave/.sdkman/bin/sdkman-init.sh"
sdk i gaiden
sdk c
```

jenkinsのスレーブ用のユーザを作成して、その環境にインストールする。
sdkコマンドを有効にするためには、再ログインが必要
OracleJDKのほうがよければ、sdk i javaでインストール
sdk cでインストールされていることを確認

## jenkinsでサイトのビルド・デプロイ用のJobを作る

「新たしいジョブ作成」ー＞「フリースタイルのプロジェクト」
実行するノードを制限：スレーブのラベル名
ソースコード管理：Git
ビルド・トリガ：GitHub hook trigger for GITScm polling
ビルド：シェルの実行を追加

```
source "/home/hogehogeslave/.sdkman/bin/sdkman-init.sh"
gaiden build
```
出力先のディレクトリに書き込み権限がないと失敗するので、設定する。

ビルドトリガとして、githubにpushしたタイミングでビルドが動くように、github側の設定で、
「Settings」ー＞「integrated&Service」ー＞「Jenkins(GitHub Plugin)」
で、対向のJenkinsのURLを設定する。

