# ベースイメージとして公式のGolangイメージを使用
FROM golang:1.23

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# Go Modulesの使用を許可（必要な場合）
# ENV GO111MODULE=on

# ローカルのモジュールキャッシュを最適化（必要な場合）
# COPY go.mod go.sum ./
# RUN go mod download && go mod verify


# ソースコードをコンテナにコピー
COPY . .

# アプリケーションをビルド
RUN go build -v -o /usr/local/bin/app ./...

# 実行可能ファイルをデフォルトのコマンドとして設定
CMD ["app"]