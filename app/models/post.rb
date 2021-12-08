class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  has_one_attached :image

  with_options presence: true do

   validates :title, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is valid. Input full-width charaters."}
   validates :text,  format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is valid. Input full-width charaters."}
   validates :genre_id

  end
  
  validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to:99_999_999 },
                    format: {with: /\A[0-9]+\z/}
end
