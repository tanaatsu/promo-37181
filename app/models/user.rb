class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :industry
  belongs_to :reason
  belongs_to :person
  belongs_to :prefecture
  belongs_to :business

  has_many :posts
  has_many :comments
  has_one_attached :image
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true  do
         validates :nickname      
         validates :password      
         validates :last_name,     format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ ,message:"を正しく入力してください"}
         validates :first_name,    format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ ,message:"を正しく入力してください"}
         validates :telephone,     format: {with: /\A\d{10,11}\z/ ,message:"を正しく入力してください"}
         validates :birthday     
   end
         validates :industry_id,   numericality: { other_than: 1 ,message: "を選んでください"}
         validates :reason_id,     numericality: { other_than: 1 ,message: "を選んでください"}
         validates :person_id,     numericality: { other_than: 1 ,message: "を選んでください"}

end


