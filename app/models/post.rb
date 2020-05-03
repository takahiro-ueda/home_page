class Post < ApplicationRecord
  has_rich_text :content
  # has_one_attached :image
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments

  validates :title, :content, presence: true, unless: :image?
  # validates :title, :content, :image, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
end
