class User < ApplicationRecord
  class User < ApplicationRecord
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
   validates :name, presence: true, length: { maximum: 50 }
end
end
