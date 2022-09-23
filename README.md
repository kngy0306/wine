# Wine

## 仕様書

下記のNotionに仕様、開発の流れを記載している。<br>
https://daily-line-76f.notion.site/MottoOtomo-6915b142f5cc43189f4914e0c09639d8

## Usage

### プロジェクトをclone

```sh
git clone git@github.com:kngy0306/wine.git
```

```sh
cd wine
```

### Dockerイメージのビルド

```sh
docker compose build --no-cache
```

### インストール

#### api

```sh
docker compose run --rm api bundle install
```

```sh
docker compose run --rm api rails db:create
```

#### front

```sh
docker compose run --rm front yarn install
```

### コンテナ起動

```sh
docker compose up
```

以下のログが出力したら、<br>
http://localhost:5173/ へアクセス<br>
http://localhost:3000/ へアクセス

```sh
wine_front  |   VITE v3.0.5  ready in 3082 ms
wine_front  |
wine_front  |   ➜  Local:   http://localhost:5173/
wine_front  |   ➜  Network: http://172.29.0.3:5173/
wine_api    | => Booting Puma
wine_api    | => Rails 6.1.6.1 application starting in development
wine_api    | => Run `bin/rails server --help` for more startup options
wine_api    | Puma starting in single mode...
wine_api    | * Puma version: 5.6.4 (ruby 2.7.6-p219) ("Birdie's Version")
wine_api    | *  Min threads: 5
wine_api    | *  Max threads: 5
wine_api    | *  Environment: development
wine_api    | *          PID: 1
wine_api    | * Listening on http://0.0.0.0:3000
wine_api    | Use Ctrl-C to stop
```

## DB作成

`docker compose up -d`などでコンテナを立ち上げておく

### `apiコンテナ`にてテーブル作成

```sh
# apiコンテナにログイン
docker compose exec api bash

# 以下、apiコンテナ内

# パッケージ最新化
bundle install

# テーブル作成
bin/rails db:migrate
```

### `dbコンテナ`にてテーブル確認

```sh
# dbコンテナにログイン
docker compose exec db bash

# 以下、dbコンテナ内

# postgresにログイン
psql -h localhost -p 5432 -U user wine_development

# テーブル確認 (usersテーブルの場合)
\d users
```
