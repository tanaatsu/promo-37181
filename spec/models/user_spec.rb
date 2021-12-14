require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '登録できるとき' do
    it '全て正しく入力すれば登録ができる' do
      expect(@user).to be_valid
    end
  end
  context '登録できない時' do
    it 'nicknameが空であると登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'passwordが空であると登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'last_nameが空であると登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end
    it 'last_nameが全角ひらがな、全角カタカナ、全角漢字でないと登録できない' do
      @user.last_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を正しく入力してください")
    end
    it 'first_nameが空であると登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'first_nameが全角ひらがな、全角カタカナ、全角漢字でないと登録できない' do
      @user.first_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を正しく入力してください")
    end
    it 'telephoneが空であると登録できない' do
      @user.telephone = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'telephoneが数字9桁以下であると登録できない' do
      @user.telephone = '123456789'
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号を正しく入力してください")
    end
    it 'telephoneが数字12桁以上であると登録できない' do
      @user.telephone = '123456789123'
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号を正しく入力してください")
    end
    it 'birthdayが空であると登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
    it 'industryが--であると登録できない' do
      @user.industry_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("業種を選んでください")
    end
    it 'reasonが--であると登録できない' do
      @user.reason_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("アプリを知った理由を選んでください")
    end
    it 'personが--であると登録できない' do
      @user.person_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("パーソンを選んでください")
    end
  end
end
