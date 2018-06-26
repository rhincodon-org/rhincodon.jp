anyenv
===

インストール
---

```
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
```

### pyenv

```
yum groupinstall "Development tools"
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel
```

参考サイト
---

* [https://dev.classmethod.jp/tool/tool-anyenv/](https://dev.classmethod.jp/tool/tool-anyenv/)