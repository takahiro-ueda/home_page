class Post < ApplicationRecord
  has_rich_text :content
  
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  validates :title, :content, :category_id, presence: true, unless: :image?
  validates :content, presence: true, length: { maximum: 2000 }

  
end
