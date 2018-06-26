Graph-Easy
===

アスキーアートで図を描きたかったので、使ってみる。

CPANサイト
--------

* [http://search.cpan.org/%7Etels/Graph-Easy/lib/Graph/Easy.pm](http://search.cpan.org/%7Etels/Graph-Easy/lib/Graph/Easy.pm)

インストール
----------

macのhomebrewでplenvインストールして、cpanm入れてから、Graph::Easyインストール。

```
$ brew install plenv perl-build
```

.bash_profileに設定追加

```
PATH=$PTH:$HOME/.plenv/bin
eval "$(plenv init -)"
```

perlインストール

```
$ plenv install -l
$ plenv install 5.20.1
$ plenv global 5.20.1
```

新しすぎると、Graph::Easyが対応していないのか、インストールできなかった。

cpanインストール

```
$ plenv install-cpanm
```

Graph::Easyインストール

```
$ cpanm Graph::Easy
```

設定確認

```
$ plenv versions
$ plenv list-modules
```

実行結果
-------

こんな感じ

```
$ graph-easy <<< '[a] -> [b]'
+---+     +---+
| a | --> | b |
+---+     +---+
```

使い方
-----

* [https://qiita.com/Takeru/items/772218255b9cd92fc05e](https://qiita.com/Takeru/items/772218255b9cd92fc05e)
* [http://bloodgate.com/perl/graph/manual/index.html](http://bloodgate.com/perl/graph/manual/index.html)
