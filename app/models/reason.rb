class Reason < ActiveHash::Base
  self.data = [
    { id: 1 , name: '--' },
    { id: 2 , name: '店舗来店時' },
    { id: 3 , name: 'インターネット' },
    { id: 4 , name: '知人の紹介' },
    { id: 5 , name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :users
end