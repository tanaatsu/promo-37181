class User < ApplicationRecord
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
         validates :occupation_id, presence: true
         validates :industry_id,   presence: true
         validates :reason_id,     presence: true
         validates :person_id,     presence: true
end


