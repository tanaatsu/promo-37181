class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  has_one :record
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do

   validates :title,length: {maximum: 25}
   validates :text
   validates :genre_id, numericality: { other_than: 1 , message: "を選択してください"}
   validates :image

  end
  
  
end
