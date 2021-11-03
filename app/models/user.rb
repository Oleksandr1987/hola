class User < ApplicationRecord
   has_many :microposts, dependent: :destroy
   has_many :comments, dependent: :destroy
   validates :email, presence: true, uniqueness: true
   validates :name, presence: true, length: { maximum: 50 }
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end
