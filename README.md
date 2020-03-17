
## アプリ名
Money Wish List


# 概要
- 家計簿とウィッシュリストの機能を持ったアプリ
- 毎日の支出を細かく管理するものではなく、大きな買い物（目安１万円以上）を管理するもの
- 欲しい物をWishリストに買った物をRecordリストに記録する。
　

# 本番環境
- デプロイ先：http://18.178.24.93/
- ユーザー名：money-wish
- パスワード：1111

- テストアカウント:11111@gmail.com
- ID：111111


# 制作背景(意図)
- 前職に関係するアプリを作ってみたかった。
- 人生１００年時代と言われている昨今、若い方、ご家族がいる方、ご高齢の方皆に「貯蓄」をするということは共通のテーマであると考えた。
- 前職では、特に若い方から「なかなか貯金できない」「家計簿が続けられない」という声があった。
- まずは大きな買い物をする前に欲しい物をリスト化し、購入前に本当に必要な物なのか見直しの機会を持ち、節約しようということを提案したかった。


# DEMO
- ログイン画面 https://i.gyazo.com/50fcdf7e27c2c2b1ee590657bf29d8cd.jpg
- 欲しい物リスト　https://i.gyazo.com/df8f7237c2da1f1356fe11f223a35981.jpg
- 買った物リスト　https://i.gyazo.com/babe0980f52627e2c9ccfcb4b35abe08.jpg
- 購入額グラフ　https://i.gyazo.com/c7412fb506a14a69eee96722bf335ba0.jpg
- 登録時のランダムメッセージ表示　https://i.gyazo.com/b8467b445a3b6dc1a36164aef9215aa6.mp4


# 工夫したポイント
- 一画面で登録・変更・削除をできるように実装した。
- 固いお金のイメージをビューで柔らかく見せた。
- リストは表にし、金額のカンマ、月順、フッター固定のスクロールで見やすくした。
- 登録後にランダムでお金の豆知識を表示させ、楽しみながら節約できるようにした。

# 使用技術(開発環境)
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code


# 課題や今後実装したい機能
- レスポンシブデザインの実装。
- 登録フォームにバリデーションを設定し、エラーメッセージを表示する。
- ユーザーが登録する期間（１年）を入力し、過去の記録を保存できる機能。
- 欲しい物リストに画像（インスタグラム等のスクリーンショット）を保存できるようにする。


# DB設計

## usersテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true, index|
|email|string|null: false, unique: true|
|password|string|null: infalse|
|incomes|integer|null: false|
|fixedcosts|integer|null: false|
|savings|integer|null: false|
### Association
- has_many :wishes
- has_many :records

## wishesテーブル
|Column|Type|Option|
|------|----|------|
|month|integer||
|content|string||
|cost|integer|null: false|
|user|references|foreign_key: true|
### Association
- belongs_to :user

## recordsテーブル
|Column|Type|Option|
|------|----|------|
|month|integer||
|content|string||
|cost|integer|null: false|
|user|references|foreign_key: true|
### Association
- belongs_to :user
