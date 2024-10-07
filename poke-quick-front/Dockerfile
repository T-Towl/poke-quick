# ベースイメージとして公式のNode.jsイメージを使用
FROM node:22.9.0

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係をインストール
COPY package*.json ./
RUN npm install

# ソースコードをコンテナにコピー
COPY . .

# アプリケーションをビルド
RUN npm run build

# サーバーを起動
CMD ["npm", "start"]
