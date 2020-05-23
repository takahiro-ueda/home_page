class PostCategory < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :category, optional: true

  validates :post_id, presence:true
  validates :category_id, presence:true
end
