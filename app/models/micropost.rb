class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" }
           end
             def display_image
             image.variant(resize_to_limit: [500, 500])
             end
