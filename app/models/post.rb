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
      Post.where('category_id LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  validates :title, :content, :category_id, presence: true, unless: :image?
  validates :content, presence: true, length: { maximum: 2000 }

  
end
