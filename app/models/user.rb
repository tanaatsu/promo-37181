class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :current_password
  belongs_to :industry
  belongs_to :reason
  belongs_to :person
  belongs_to :prefecture
  belongs_to :business

  has_many :posts ,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_one_attached :image
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
          nickname: auth.info.name,
          email: auth.info.email
    )

    if user.persisted?
       sns.user = user
       sns.save
    end
    {user: user, sns: sns}
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

   with_options presence: true  do
         validates :nickname      
         validates :password, on: :create     
         validates :last_name,     format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ ,message:"を正しく入力してください"}
         validates :first_name,    format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ ,message:"を正しく入力してください"}
         validates :telephone,     format: {with: /\A\d{10,11}\z/ ,message:"を正しく入力してください"}
         validates :birthday     
   end
         validates :industry_id,   numericality: { other_than: 1 ,message: "を選んでください"}
         validates :reason_id,     numericality: { other_than: 1 ,message: "を選んでください"}
         validates :person_id,     numericality: { other_than: 1 ,message: "を選んでください"}

end


