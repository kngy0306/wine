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
docker compose build
```

### インストール

```sh
docker compose run web bundle install
```

```sh
docker compose run web bin/rails webpacker:install
```

### DB作成

```sh
docker compose run web bin/rails db:create
```

### コンテナ起動

```sh
docker compose up
```

`* Listening on http://0.0.0.0:3000`が出たら http://localhost:3000 にアクセス