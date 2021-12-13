class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  has_one :record
  has_one_attached :image

  with_options presence: true do

   validates :title,    format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is valid. Input full-width charaters."},length: {maximum: 25}
   validates :text,     format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is valid. Input full-width charaters."}
   validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :image

  end
  
  
end
