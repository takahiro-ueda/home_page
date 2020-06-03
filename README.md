# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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