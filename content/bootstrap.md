title=bootstrapの調べ物
date=2018-04-01
type=post
tags=blog
status=published
~~~~~~
公式サイト
--------

* [https://getbootstrap.com](https://getbootstrap.com)

登場人物
-------

* CSS
  * class
* JavaScript
* HTML
* グリッドシステム
  * container
    * row
      * col
        * offset
        * pull
        * push
        * img-responsive
* レスポンシブWebデザイン
  * xs
  * sm
  * md
  * lg
  * hidden
  * visible
* 書式指定
* navigation


概要
----

* Twitter社が作ったCSSフレームワーク。
* 既存の技術では、自分でHTMLのタグ書いて、そこにCSSファイルも自分で書いて、ページレイアウトしていた。
* CSSを直接書かなくても、見た目がいいWebサイトを作れる。自分でやるより、デザインのノウハウが活用できる。
* 昔は、tableタグとかでレイアウト作ったりしてたけど、bootstrapはグリッドシステムを使って指定する。
* クライアントによって、表示するレイアウトを変化できる。
* 6000行ぐらいCSSファイルが書かれているそうな。

使い方
-----

* [https://techacademy.jp/magazine/6270](https://techacademy.jp/magazine/6270)
* 基本は、HTMLタグにclass属性を指定して使用する。
* 配布されるCSSファイルにクラスセレクタが準備されていて、それらを使う感じなので、どんなクラスが準備されているかを学習する感じ。
* デフォルトでHTMLタグ指定の設定も入っているので、class指定しなくても表示反映されるところがある。
* ソースファイルは、自分のサイトのサーバ上に配置するか、CDN経由で利用する。


参考資料
-------

* [Bootstrapファーストガイド](https://www.amazon.co.jp/Bootstrapファーストガイド―CSS設計の手間を大幅に削減-相澤-裕介/dp/4877833609/ref=sr_1_1?ie=UTF8&qid=1522566950&sr=8-1&keywords=bootstrap+ファーストガイド)