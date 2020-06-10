# README
# アプリ名
タイトル：　home page
# アプリ概要
【実装機能】<br>
<必須><br>
・管理ユーザ登録・削除機能、管理ユーザログイン機能<br>
・記事一覧投稿機能、記事詳細表示機能、記事投稿・削除機能、rails6 actiontext機能<br>
・画像投稿、ページネーション機能<br>
・単体テスト、機能テスト、統合テスト<br>
<br>
<応用><br>
・Googleカレンダー、カテゴリ機能、非同期コメント機能、非同期いいね機能<br>
・投稿文字数カウント機能、検索機能、パンくず機能<br>
・slick導入でスライド、もっと見る機能(投稿部分)、もっと見る機能(コメント部分)

# 企画背景
自己啓発で自主学習していることをアウトプットする為<br>
【目的】<br/>
・アウトプットは自分の頭の整理になる<br>
・転職や仕事を紹介してもらう時にアピールできる<br>
・目標を達成するための日々の積み重ねを記録<br>
・Twitterで書ききれなかったことを記すこと<br>

# 開発環境
言語：HTML・Ruby・Ruby on Rails・JavaScript・jQuery・SQL・Git・ GitHub・SCSS<br>
ruby '2.5.1'<br>
rails '~> 6.0'<br>

## users(ユーザー)
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|age|integer|null: false|
|sex|integer|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string|null: true|

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_posts, through: :likes, source: :post


## action_text_rich_texts
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|body|text|size: :long|
|record|references|null:false|


## active_storage_attachments
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|record|references|null:false|
|blob|references|null: false|
|created_at|datetime|null: false|


## active_storage_blobs
|Column|Type|Options|
|------|----|-------|
|key|string|null: false|
|filename|string|null:false|
|content_type|string|
|metadata|text|
|byte_size|bigint|null: false|
|checksum|string|null: false|
|created_at|datetime|null: false|


## posts(投稿)
|Column|Type|Options|
|------|----|-------|
|title|text|
|content|text|
|image|string|
|likes_count|integer|
|likes_count|references|null: false|

### Association
- has_rich_text :content
- belongs_to :user, optional: true
- has_many :post_categories, dependent: :destroy
- has_many :categories, through: :post_categories, source: :category, dependent: :destroy
- accepts_nested_attributes_for :post_categories, allow_destroy: true
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_users, through: :likes, source: :user


## post_categories(投稿・カテゴリ中間テーブル)
|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :post, optional: true
- belongs_to :category, optional: true


## categories(カテゴリ)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :post_categories, dependent: :destroy
- has_many :posts, through: :post_categories, source: :post, dependent: :destroy


## comments(コメント)
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post, optional: true


## likes(いいね)
|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :post, counter_cache: :likes_count
- belongs_to :user
