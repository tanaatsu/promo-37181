class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :record_id, :user_id, :post_id,:token

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :user_id
    validates :post_id
    validates :token
  end
  validates :prefecture_id,  numericality:{other_than: 1, message:"can't be blank"}

  def save
    record = Record.create(user_id: user_id, post_id: post_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name,record_id: record.id)
  end
end