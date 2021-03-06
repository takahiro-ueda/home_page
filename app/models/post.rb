class Post < ApplicationRecord
  has_rich_text :content
  
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true

  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, source: :category, dependent: :destroy
  accepts_nested_attributes_for :post_categories, allow_destroy: true

  has_many :comments, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  validates :title, :content, presence: true, unless: :image?
  validates :category_id, presence: true
  validates :content, length: { maximum: 3000, message: "入力は３０００文字までです。" }
  
end
