class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  validates :password,
        presence: { message: '未入力' },
        length: { in: 4..16, message: '4文字以上16文字以内でご入力ください。', allow_blank: true},
        confirmation: { message: 'パスワードが一致しません。' }

  validates :password_confirmation, presence: { message: '未入力' }
  validates :profile, length: { maximum: 1000 } 
end
