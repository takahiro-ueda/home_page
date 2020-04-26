class Post < ApplicationRecord
  
  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true, unless: :image?
  # validates :title, :content, :image, presence: true
  validates :content, presence: true, length: { maximum: 400 }
end
