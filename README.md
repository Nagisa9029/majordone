# README

- アプリ名
Ma Jordome（マ・ジョルダン）

- 概要(このアプリでできることを書いて下さい)
ユーザーの味覚をパラメーター化し、ワインパラメーターと照らし合わせて、自分の味覚に合ったワインを検索できるアプリ

- 本番環境(デプロイ先　テストアカウント＆ID)
https://ma-jordome.herokuapp.com/
新規登録から、「e-mail、　パスワード」にてログインください。
※e-mailアドレスは、適当なもので構いません。

- 制作背景(意図)
ソムリエ をしていた時に業務にて行っていた、「お客様の好みを把握し、そのお客様の味覚に合ったワインを提供する」。これを、アプリ上で実現したいと考えました。
自分の好みを理解してくれているソムリエ がスマホにいたら便利だと思い、このアプリを作成しました。
テーマは、「自分だけのソムリエ （執事）」です。
アプリ名も、Majordome（フランス語で「執事」）から、命名しています。

- 動作確認方法
Chromeの最新版を利用してアクセスしてください。
※ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。
接続先およびログイン情報については、上記の通りです。
◆ユーザーパラメーターの登録
①ハンバーガーメニュー 内の「MAINE MENU/Butler」ボタンを押下。
②「味覚パラメーター初期登録」を押下し、チャット形式で質問にお答えください。
③ユーザーのパラメーターが登録されます。
④ハンバーガーメニュー 内の「USER MENU/MyWineList」ボタンを押下。
⑤ユーザーパラメーターをもとに、好みに近いワインが表示されます
　※処理速度に問題があり、表示までに時間がかかります。

- 工夫したポイント
ユーザーの味覚パラメーターと、ワインのパラメーターとの比較ロジック
①パラメーターを画像として保存
②パラメーターの画像を多次元配列に変換
③ユーザーとワインパラメーターの配列の差を計算
④計算結果の絶対値の合計値を産出
⑤④の結果が０に近いほど、ユーザーとワインのパラメータが近い（好みの味）ワインになります。

- 使用技術(開発環境)
Haml・SCSS・Ruby・Ruby on Rails・JavaScript・jQuery・ GitHub・AWS　等の
技術を用いた複合的機能の企画・実装 

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