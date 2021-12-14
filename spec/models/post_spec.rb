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
      expect(@post.errors.full_messages).to include("Title can't be blank")
    end
    it 'titleが全角ひらがな、カタカナ、漢字でないと登録できない' do
      @post.title = 'aaaaa'
      @post.valid?
      expect(@post.errors.full_messages).to include("Title is valid. Input full-width charaters.")
    end
    it 'textが空では登録できない' do
      @post.text = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Text can't be blank")
    end
    it 'imageが空では登録できない' do
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Image can't be blank")
    end
    it 'genre_idが--では登録できない' do
      @post.genre_id = 1
      @post.valid?
      expect(@post.errors.full_messages).to include("Genre can't be blank")
    end
    it 'userが紐づいていないと登録できない' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("User must exist")
    end
  end
end

