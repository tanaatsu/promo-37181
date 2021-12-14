require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
   before  do
     user = FactoryBot.create(:user)
     post = FactoryBot.create(:post)
     @record_address = FactoryBot.build(:record_address, user_id: user.id, post_id: post.id)
     sleep(1)
   end
 

  context '投稿できる時' do
    it '全ての情報が正しく入力されていれば登録できる' do
      expect(@record_address).to be_valid
    end
    it 'building_nameが空でも登録できる' do
      @record_address.building_name = ''
      expect(@record_address).to be_valid
    end
  end

  context '投稿でいない時' do
    it 'postal_codeが空では登録できない' do
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeがハイフンありの7桁でなければ登録できない' do
      @record_address.postal_code = '1234567'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'addressが空では登録できない' do
      @record_address.address = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'prefecture_idが--では登録できない' do
      @record_address.prefecture_id = 1
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'tokenが空では登録できない' do
      @record_address.token = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが紐づいていないと登録できない' do
      @record_address.user_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("User can't be blank")
    end
    it 'post_idが紐づいていないと登録できない' do
      @record_address.post_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Post can't be blank")
    end
   end
end

