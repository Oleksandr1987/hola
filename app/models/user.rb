class User < ApplicationRecord
   has_many :microposts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :active_relationships, class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
   has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
   has_many :following, through: :active_relationships, source: :followed
   has_many :followers, through: :passive_relationships, source: :follower                                 
   validates :email, presence: true, uniqueness: true
   validates :name, presence: true, length: { maximum: 50 }
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end
