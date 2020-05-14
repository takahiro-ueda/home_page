class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_category, source: :post, dependent: :destroy

  validates :name, presence: true
end
