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
      expect(@record_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_codeがハイフンありの7桁でなければ登録できない' do
      @record_address.postal_code = '1234567'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("郵便番号を正しく入力してください")
    end
    it 'municipalityが空では登録できない' do
      @record_address.municipality = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("市町村を入力してください")
    end
    it 'addressが空では登録できない' do
      @record_address.address = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("番地を入力してください")
    end
    it 'prefecture_idが--では登録できない' do
      @record_address.prefecture_id = 1
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("都道府県を選択してください")
    end
    it 'tokenが空では登録できない' do
      @record_address.token = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("カード情報を入力してください")
    end
    it 'user_idが紐づいていないと登録できない' do
      @record_address.user_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Userを入力してください")
    end
    it 'post_idが紐づいていないと登録できない' do
      @record_address.post_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postを入力してください")
    end
   end
end

