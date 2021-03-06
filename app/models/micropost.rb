class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :content, :context, presence: true, length: { maximum: 255 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" }

   acts_as_votable
           end
             def display_image
             image.variant(resize_to_limit: [500, 500])
             end
