class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :title,  presence: true
  validates :text, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true

end
