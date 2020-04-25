class Post < ApplicationRecord
  validates :title, :content, presence: true
  # validates :title, :content, :image, presence: true
end
