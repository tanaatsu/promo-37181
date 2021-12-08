class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :industry
  belongs_to :reason
  belongs_to :person
  belongs_to :prefecture

  has_many :posts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true  do
         validates :nickname      
         validates :password      
         validates :last_name,     format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :first_name,    format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :telephone,     format: {with: /\A\d{10,11}\z/ }
         validates :birthday     
   end
         validates :industry_id,   numericality: { other_than: 1 ,message: "can't be blank"}
         validates :reason_id,     numericality: { other_than: 1 ,message: "can't be blank"}
         validates :person_id,     numericality: { other_than: 1 ,message: "can't be blank"}
end


