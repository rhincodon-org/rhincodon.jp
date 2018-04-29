## dockerでインストール

docker-compose.ymlファイル

```
version: '3.1'

services:

  redmine:
    image: redmine
    restart: always
    ports:
      - 8080:3000
    environment:
      REDMINE_DB_MYSQL: db
      REDMINE_DB_PASSWORD: hogehoge

  db:
    build: ./mysql
    dockerfile: Dockerfile
    restart: always
    environment:
      MYSQL_DATABASE: redmine
      MYSQL_ROOT_PASSWORD: hogehoge
      TZ: "Asia/Tokyo"
    ports:
      - 3306:3306
    volumes:
      - ./db:/var/lib/mysql
```

日本語でのMySQLのDockerfile

```
FROM mysql:5.7

RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

RUN { \
    echo '[mysqld]'; \
    echo 'character-set-server=utf8mb4'; \
    echo 'collation-server=utf8mb4_general_ci'; \
    echo '[client]'; \
    echo 'default-character-set=utf8mb4'; \
} > /etc/mysql/conf.d/charset.cnf
```

## 参考

### Redmine docker起動

* https://hub.docker.com/\_/redmine/

### MySQL日本語化

* https://qiita.com/muff1225/items/48e0753e7b745ec3ecbd

