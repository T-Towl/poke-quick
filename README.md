# アプリケーション名
**poke-quick -ポケクイック-**

## 概要
ポケモンの素早さを計算するアプリケーションです。

An application that calculates the speed of Pokémon.

## 環境構築手順

### 前提条件
- Gitがインストールされていること
- Docker Desktopがインストールされていること（[公式サイト](https://www.docker.com/ja-jp/)を参照）

### 手順
1. 任意のディレクトリ内にGitHubリポジトリをクローンします。（事前にSSH keyを認証しておく必要があります）
	```shell
	$ git clone git@github.com:PG-owl/poke-quick.git
	```

2.  以下のコマンドを実行し、Dockerコンテナをビルドして起動します。
	``` shell
	$ cd poke-quick
	$ docker-compose up --build
	```

### MySQL接続確認手順
1. MySQLクライアントを使用して接続
	``` shell
	```

2. ブラウザで<http://localhost:8080/>にアクセスし、*Hello, Poke Quick!* と表示されれば環境構築は完了です。

* (*補足*) 
	``` shell
	// 全Dockerコンテナを停止する場合のコマンド
	$ docker stop $(docker ps -q)
	```

	``` shell
	// 停止した全Dockerコンテナを起動する場合のコマンド
	$ docker stop $(docker ps -a -q)
	```

## データベース構成

### テーブル: `pokemon`
| カラム名          | データ型       | NULL許可 | キー     | デフォルト値 | その他       |
|-------------------|----------------|----------|----------|--------------|--------------|
| id                | INT            | NO       | PRIMARY  |              | AUTO_INCREMENT |
| national_id       | INT            | NO       | UNIQUE   |              |              |
| name              | VARCHAR(255)   | NO       |          |              |              |
| english_name      | VARCHAR(255)   | NO       |          |              |              |
| type_id_1         | INT            | NO       | FOREIGN  |              |              |
| type_id_2         | INT            | YES      | FOREIGN  |              |              |
| ability_id_1      | INT            | NO       | FOREIGN  |              |              |
| ability_id_2      | INT            | YES      | FOREIGN  |              |              |
| ability_id_3      | INT            | YES      | FOREIGN  |              |              |
| hit_point         | INT            | NO       |          |              |              |
| attack            | INT            | NO       |          |              |              |
| defense           | INT            | NO       |          |              |              |
| special_attack    | INT            | NO       |          |              |              |
| special_defense   | INT            | NO       |          |              |              |
| speed             | INT            | NO       |          |              |              |
| height            | FLOAT          | NO       |          |              |              |
| weight            | FLOAT          | NO       |          |              |              |

### テーブル: `types`
| カラム名          | データ型       | NULL許可 | キー     | デフォルト値 | その他       |
|-------------------|----------------|----------|----------|--------------|--------------|
| id                | INT            | NO       | PRIMARY  |              | AUTO_INCREMENT |
| type_name         | VARCHAR(255)   | NO       | UNIQUE   |              |              |
| english_type_name | VARCHAR(255)   | NO       | UNIQUE   |              |              |

### テーブル: `abilities`
| カラム名          | データ型       | NULL許可 | キー     | デフォルト値 | その他       |
|-------------------|----------------|----------|----------|--------------|--------------|
| id                | INT            | NO       | PRIMARY  |              | AUTO_INCREMENT |
| ability_name      | VARCHAR(255)   | NO       | UNIQUE   |              |              |
| battle_effect     | TEXT           | YES      |          |              |              |
| field_effect      | TEXT           | YES      |          |              |              |

## リレーション
- `pokemon` テーブルの `type_id_1` と `type_id_2` は `types` テーブルの `id` とリレーションを持ちます。
- `pokemon` テーブルの `ability_id_1`、`ability_id_2`、`ability_id_3` は `abilities` テーブルの `id` とリレーションを持ちます。
