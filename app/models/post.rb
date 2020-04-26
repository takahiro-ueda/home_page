class Post < ApplicationRecord
  has_rich_text :content
  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true, unless: :image?
  # validates :title, :content, :image, presence: true
  validates :content, presence: true, length: { maximum: 400 }
end
