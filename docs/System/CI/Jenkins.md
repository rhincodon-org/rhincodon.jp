Jenkins
===
 
## モチベーション

* サイトの更新作業をJenkinsさんにお願いしてラクする。

## 構成

CentOS7ベース

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
    folder jbakeProject {
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
  component jbake
  component git
  component docker
  component bash as shell
  database repository as repositoryLocal {
    folder jbake as jbakeProjectLocal {
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
jbake -- jbakeProjectLocal
firewalld --( host80
host80 -- httpd
httpd -- www
www #-- jbake
jbake <.. shell
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

![構成](/img/docker-jenkins-01.png)

* bash
* firewalld
* ssh
* httpd
* git
* docker
* jbake
* jenkins

## 手順

* ホストにhttpdインストールと起動
* ホストにdockerインストールとdockerサービス起動
* ホストにgitインストール
* ホストにjbakeのインストール
* ホストにdockerのjenkinsイメージをpullしてコンテナ起動
* httpdでリバースプロキシ設定
* firewalldで80のポート開ける
* コンテナのJenkinsのスレーブとしてホストを登録
* jenkinsでサイトのビルド・デプロイ用のJobを作る

## ホストにhttpdインストールと起動

```
yum install -y httpd
systemctl enable httpd
systemctl start httpd
systemctl status httpd
```

## ホストにdockerインストールとdockerサービス起動

```
yum install -y docker
systemctl start docker
systemctl enable docker
systemctl status docker
```

## ホストにgitインストール

```
yum install -y git
```

## ホストにjbakeのインストール

```
useradd hogehogeslave
passwd hogehogeslave
su - hogehogeslave
yum install java-1.8.0-openjdk
curl -s "https://get.sdkman.io" | bash
source "/home/hogehogeslave/.sdkman/bin/sdkman-init.sh"
sdk i jbake
sdk i java
sdk c
```

jenkinsのスレーブ用のユーザを作成して、その環境にインストールする。
sdkコマンドを有効にするためには、再ログインが必要
OracleJDKのほうがよければ、sdk i javaでインストール
sdk cでインストールされていることを確認

## ホストにdockerのjenkinsイメージをpullしてコンテナ起動

```
docker pull jenkins
docker run -d --name jenkinssan -p 8080:8080 -p 50000:50000 jenkins --prefix=/jenkins
docker logs jenkinssan
```

Jenkinsは初回ログインするときにパスワードが必要。
ログに以下のバスワードが表示される。

```
Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:
```

## httpdでリバースプロキシ設定

```
ProxyPass /jenkins http://localhost:8080/jenkins nocanon
ProxyPassReverse /jenkins http://localhost:8080/jenkins
ProxyRequests Off
AllowEncodedSlashes NoDecode
<Proxy http://localhost:8080/jenkins*>
  Order deny,allow
  Allow from all
</Proxy>
```

https://wiki.jenkins.io/display/JENKINS/Running+Jenkins+behind+Apache

## firewalldで80のポート開ける

```
yum install -y firewalld
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --add-service=http --zone=public --permanent
firewall-cmd --reload
```

## コンテナのJenkinsのスレーブとしてホストを登録

「Jenkinsの管理」ー＞「ノードの管理」ー＞「新規ノード作成」

起動方法を「SSH経由でUnixマシンのスレーブエージェントを起動」で接続
dockerのホストの内部アドレスで接続
host側で

```
ip a
```

実行し、docker0が持っているIPアドレスで接続。この環境は、172.17.0.1。
Jenkins経由ではなく、手動で接続確認する場合は、以下で確認。

```
docker exec -it jenkinssan /bin/bash
ssh -l hogehogeslave 172.17.0.1
```

## jenkinsでサイトのビルド・デプロイ用のJobを作る

「新たしいジョブ作成」ー＞「フリースタイルのプロジェクト」
実行するノードを制限：スレーブのラベル名
ソースコード管理：Git
ビルド・トリガ：GitHub hook trigger for GITScm polling
ビルド：シェルの実行を追加

```
ls assets/img | grep .uml$ | xargs -Ixxx plantuml xxx
source "/home/hogehogeslave/.sdkman/bin/sdkman-init.sh"
jbake -b . /var/www/hogehogesite
```

plantumlで作成しているファイルを画像に変換。
sdkman関連のコマンドを有効化するため、sdkman-init.shを実行する。
出力先のディレクトリに書き込み権限がないと失敗するので、設定する。

ビルドトリガとして、githubにpushしたタイミングでビルドが動くように、github側の設定で、
「Settings」ー＞「integrated&Service」ー＞「Jenkins(GitHub Plugin)」
で、対向のJenkinsのURLを設定する。

