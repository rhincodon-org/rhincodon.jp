Gaiden
===

モチベーション
---

* 時系列な作業ログは、jBakeさんで書いて、抽象化した情報をGaidenにまとめて、ノウハウ貯めて未来の作業ラクする。

構成
---

```plantuml
left to right direction
skinparam monochrome true

actor "サイト見る人" as user
actor "自分" as servicer

frame client {
  component browser
}
frame management {
  component sshClient
}
cloud github {
  database repository {
    folder gaidenProject {
      file md
    }
  }
}
cloud dockerhub {
  database registory {
    file imageJenkins
  }
}
frame host {
  component httpd
  component firewalld
  component ssh
  component gaiden
  component git
  component docker
  component bash as shell
  database repository as repositoryLocal {
    folder gaiden as gaidenProjectLocal {
      file md as mdLocal
    }
  }
  database registory as registoryLocal {
    file imageJenkins as imageJenkinsLocal
  }
  folder www {
    file html
  }
  agent agent
  frame container {
    component jenkins {
      actor "Jenkinsの中の人" as runner
    }
    interface 50000 as jenkins50000
    interface 8080 as jenkins8080
  }
  interface 50000 as host50000
  interface 8080 as host8080
  interface 80 as host80
  interface 22 as host22
}
user -- browser
browser -(0- firewalld 

servicer ..> sshClient
sshClient ..> ssh
shell ..> docker
repository -0)- git
registory -0)- docker
docker --# registoryLocal
docker --# container
agent ..> shell 
shell ..> git
git --# repositoryLocal
gaiden -- gaidenProjectLocal
firewalld --( host80
host80 -- httpd
httpd -- www
www #-- gaiden
gaiden <.. shell
httpd --( host8080
ssh -- host22
shell <.. ssh
agent <..( host50000
host8080 -- jenkins8080
host50000 <.. jenkins50000
jenkins8080 -- jenkins
jenkins50000 <.. jenkins
host22 <.. jenkins
```

手順
---

* ベースは、jBakeで作った環境を流用
* ホストにgaidenのインストール
* jenkinsでサイトのビルド・デプロイ用のJobを作る

ホストにgaidenのインストール
---

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

jenkinsでサイトのビルド・デプロイ用のJobを作る
---

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

