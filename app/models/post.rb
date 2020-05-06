class Post < ApplicationRecord
  has_rich_text :content
  # has_one_attached :image
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :content, presence: true, unless: :image?
  validates :content, presence: true, length: { maximum: 2000 }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
