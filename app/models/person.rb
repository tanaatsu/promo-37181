class Person < ActiveHash::Base
  self.data = [
    { id: 1 , name: '--'},
    { id: 2 , name: '一般の方'},
    { id: 3 , name: '店舗の方'}
  ]

  include ActiveHash::Associations
  has_many :users
end