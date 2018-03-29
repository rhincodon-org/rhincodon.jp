title=Vagrantの調べ物
date=2018-03-29
type=post
tags=blog
status=published
~~~~~~

本家サイト
--------

* [https://www.vagrantup.com](https://www.vagrantup.com)

解説サイト
--------

* [https://thinkit.co.jp/story/2015/03/05/5671](https://thinkit.co.jp/story/2015/03/05/5671)

書籍
----

* [Vagrant入門ガイド](https://www.amazon.co.jp/Vagrant入門ガイド-新原雅司-ebook/dp/B00F418SQ8/ref=sr_1_2?ie=UTF8&qid=1522324175&sr=8-2&keywords=vagrant)

登場人物
-------

* Vagrantfile
* Provider
* Repository
* Box
* Plugin

概要
----

* VirtualBoxとかのコンピュータリソースの仮想化ソフトウェアをProviderってオブジェクトでラップして、Vagrantfileに書いた内容で仮想マシンをCLIから制御してくれる。
* 仮想マシンとして起動するイメージファイルは、Boxってオブジェクトでインターネットのリポジトリから持ってこれる。
* Pluginで機能の共有が可能。


インストール
----------

### Macの場合

```
# brew cask install virtualbox
# brew cask install vagrant
```

コマンドチート
------------

```
# vagrant box list
# vagrant box add centos/7
# mkdir hogehoge
# cd hogehoge
# vagrant init centos/7
# vagrant status
# vagrant up
# vagrant ssh
# vagrant halt
# vagrant destroy
```

destroyすると、一回生成したデータが全部消えるので、消えて困るデータがある場合は、注意。

ガイド
-----

vagrant initコマンドでデフォルトのVagrantfileが生成される。変更したい場合は、欲しい仮想マシンのスペックを記載する。

### デフォルトユーザの変更

T.B.D

### SSHの設定変更

T.B.D

### デフォルトファイルの変更

T.B.D

### ネットワークの設定

T.B.D

### HDDの設定

T.B.D

### CPUの設定

T.B.D

### MEMの設定

T.B.D

### ホスト名の設定

T.B.D
