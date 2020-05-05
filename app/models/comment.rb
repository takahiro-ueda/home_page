class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  validates :content, presence: true
end
