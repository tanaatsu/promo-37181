require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  context '登録できるとき' do
    it 'title,text,genre_id,が存在していれば登録できる' do
      expect(@post).to be_valid
    end
    it 'priceが空でも登録ができる' do
      @post.price = ''
      expect(@post).to be_valid
    end
  end
  context '登録できないとき' do
    it 'titleが空では登録できない' do
      @post.title = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("タイトルを入力してください")
    end
    it 'textが空では登録できない' do
      @post.text = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("説明文を入力してください")
    end
    it 'imageが空では登録できない' do
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("画像を入力してください")
    end
    it 'genre_idが--では登録できない' do
      @post.genre_id = 1
      @post.valid?
      expect(@post.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it 'userが紐づいていないと登録できない' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Userを入力してください")
    end
  end
end

