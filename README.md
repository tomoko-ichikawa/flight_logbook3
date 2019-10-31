# README

# フライトログブック

## 概要
ログブックは、本来CAさんに書いてもらうものですが、羽田ー伊丹などとっても飛行時間が短いフライトですと、CAさんはそれを書く時間がありません。でも、面と向かってお断りもできなそうなので、頼む側のマナーが今問われています。  
そこで、あなたの搭乗記録を、CAさんの手を煩わせることなく、手軽に自身で記録できて、永久に保存できるデジタルなフライトログブックを作りました。  
写真も掲載できます。  
いつでもどこでも閲覧可能です。

## コンセプト
シンプルなログブック

## バージョン
Ruby 2.6.4
Rails 5.2.3

## 機能一覧
- ログイン機能	
- ユーザー登録機能	
- ログ一覧機能	
- ログ投稿機能	
- 写真投稿機能	
- ログ編集機能	
- ログ削除機能	
- マイページ	
- ログお気に入り機能
- コメント投稿機能
- 検索機能

## カタログ設計
https://drive.google.com/open?id=1SFZo_HnoG7jfiyn7FaY10_Ccww9dDcwO

## テーブル定義
https://drive.google.com/open?id=1qhUjk8avVG4SYtHCkK_-LEZ77hjeBOa6

## 画面遷移図
https://drive.google.com/open?id=17A-aCzzY06idYpveak_FpdLe_AdsxIiA

## 画面ワイヤーフレーム
https://drive.google.com/open?id=1VLEbYVdWZLl2wNPmixt8egPdk8KTThTM

## 使用予定Gem
carrierwave  
mini_magick  
devise  
Ransack  

## 技術要件
就業Termから
- ログイン機能（Devise）
- コメント機能（編集や削除もできること。投稿失敗時にエラーメッセージをAjaxで出力すること）

カリキュラム外から
- 検索機能（Ransackを使用。出発空港、到着空港、航空会社、座席クラスを検索）
