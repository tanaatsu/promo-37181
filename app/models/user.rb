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

         validates :nickname,      presence: true
         validates :password,      presence: true
         validates :last_name,     presence: true
         validates :first_name,    presence: true
         validates :telephone,     presence: true
         validates :birthday,      presence: true
         validates :industry_id,   numericality: { other_than: 1 ,message: "can't be blank"}
         validates :reason_id,     numericality: { other_than: 1 ,message: "can't be blank"}
         validates :person_id,     numericality: { other_than: 1 ,message: "can't be blank"}
end


