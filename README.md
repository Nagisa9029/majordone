# README

- アプリ名
Ma Jordome（マ・ジョルダン）
- 概要(このアプリでできることを書いて下さい)
ユーザーの味覚をパラメーター化し、ワインパラメーターと照らし合わせて、自分の味覚に合ったワインを検索できるアプリ
- 本番環境(デプロイ先　テストアカウント＆ID)
https://ma-jordome.herokuapp.com/

- 制作背景(意図)
ソムリエ をしていた時に業務にて行っていた、お客様の好みを見抜き、そのお客様の味覚に合ったワインを提供する
自分に合ったワインをアプリで探して提供してくれる。


- DEMO

- 使用技術(開発環境)

- 課題や今後実装したい機能
処理速度の向上
パラメーター（ユーザー、ワイン、料理）の複合的な相性診断機能
ユーザー同士の味覚によるマッチング（相性診断）

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string||
|first_name|string||
|family_name_kana|string||
|first_name_kana|string||
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|user_flg|boolean|null: false, default: false|
|birthday|date||
|postal_code|string||
|region|string||
|street|string||
|phone|string||
### Association
- has_one :rougeParame
- has_one :blancParame
- has_one :sparklingParame
- has_one :cart
- has_many :recipes
- has_many :purchases
- has_many :favorites
- has_many :wines, through: :favorites


## rouge_paramesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|attack|integer|null: false, default: 0|
|body|integer|null: false, default: 0|
|color|integer|null: false, default: 0|
|flavor|integer|null: false, default: 0|
|fruit_flavor|integer|null: false, default: 0|
|bitterness|integer|null: false, default: 0|
|acidity|integer|null: false, default: 0|
|tannin|integer|null: false, default: 0|
|astringency|integer|null: false, default: 0|
|score_image|text|null: false, default: 0|
|score|integer|null: false, default: 0|
### Association
- belongs_to :user

## blanc_paramesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|attack|integer|null: false, default: 0|
|body|integer|null: false, default: 0|
|color|integer|null: false, default: 0|
|flavor|integer|null: false, default: 0|
|fruit_flavor|integer|null: false, default: 0|
|sweetness|integer|null: false, default: 0|
|acidity|integer|null: false, default: 0|
|taste|integer|null: false, default: 0|
|score_image|text|null: false, default: 0|
|score|integer|null: false, default: 0|
### Association
- belongs_to :user

## sparkling_paramesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|attack|integer|null: false, default: 0|
|body|integer|null: false, default: 0|
|color|integer|null: false, default: 0|
|flavor|integer|null: false, default: 0|
|fruit_flavor|integer|null: false, default: 0|
|sweetness|integer|null: false, default: 0|
|bitterness|integer|null: false, default: 0|
|acidity|integer|null: false, default: 0|
|taste|integer|null: false, default: 0|
|score_image|text|null: false, default: 0|
|score|integer|null: false, default: 0|
### Association
- belongs_to :user

## winesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_spell|string|null: false|
|title|text|null: false|
|comment|text|null: false|
|producer|string|null: false|
|wine_type|references|foreign_key: true|
|domaine|references|foreign_key: true|
|chator|string|null: false|
|price|integer|null: false|
|attack|integer|null: false|
|body|integer|null: false|
|color|integer|null: false|
|flavor|integer|null: false|
|fruit_flavor|integer|null: false|
|sweetness|integer||
|bitterness|integer||
|acidity|integer||
|taste|integer||
|tannin|integer||
|astringency|integer||
|score_image|text||
|score|integer||
### Association
- has_many :kinds
- has_many :product_images
- belongs_to :domaine
- belongs_to :wine_type
- has_many :kinds
- has_many :sepages, through: :kinds
- has_many :cartItemes
- has_many :purchaseGoods
- has_many :favorites

## productimagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|wine|references|foreign_key: true|
### Association
- belongs_to :wine

## wine_sepagesテーブル
|Column|Type|Options|
|------|----|-------|
|wine|references|foreign_key: true|
|sepage|references|foreign_key: true|
### Association
- belongs_to :wine
- belongs_to :sepage

## sepagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_spell|string|null: false|
|text|text|null: false|
|kind|string|null: false|
### Association
- has_many :kinds
- has_many :wines, through: :kinds

## domainesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|flag|text|null: false|
### Association
- has_many :wines

## wine_typesテーブル
|Column|Type|Options|
|------|----|-------|
|group|string|null: false|
### Association
- has_many :wines

## cartsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
### Association
- belongs_to :user
- has_many :cartItemes

## cartItemesテーブル
|Column|Type|Options|
|------|----|-------|
|wine|references|foreign_key: true|
|cart|references|foreign_key: true|
### Association
- belongs_to :wine
- belongs_to :cart

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|p_code|string|null: false|
|d_region|string|null: false|
|d_street|string|null: false|
|d_name|string|null: false|
|pay|string|null: false|
|status|string|null: false|
|p_date|date|null: false|
### Association
- belongs_to :user
- has_many :purchaseGoods

## purchase_goodsテーブル
|Column|Type|Options|
|------|----|-------|
|purchaser|references|foreign_key: true|
|product|references|foreign_key: true|
|sale|string|null: false|
|sale_price|string|null: false|
### Association
- belongs_to :purchase
- belongs_to :wine

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|wine|references|foreign_key: true|
|user|references|foreign_key: true|
### Association
- belongs_to :wine
- belongs_to :user