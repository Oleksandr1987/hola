class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  # validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
                   # size: { less_than: 5.megabytes, message: "should be less than 5MB" }
end
