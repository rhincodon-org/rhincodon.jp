Bash
===

```
bash --version
brew install bash
sudo vi /etc/shells
chsh -s /usr/local/bin/bash
echo $BASH_VERSION
```

上記の手順で実施すると、no change madeとかのエラーが発生し、うまくいかず。
/bin/bashをルート権限で/usr/local/bin/bashで置きかえようとしたが権限がないって怒られてうまくいかず。
rootなのに。。。

とりあえず、.bashrcに

```
alias bash='/usr/local/bin/bash'
```

を追加して置き換えることで動作させてみる。

Ref
---

* https://qiita.com/zaburo/items/1b990436ca45545959e9