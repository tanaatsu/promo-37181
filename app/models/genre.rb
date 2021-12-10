class Genre < ActiveHash::Base
  self.data =[
    { id: 1 , name:  '--' },
    { id: 2 , name:  '工具' },
    { id: 3 , name:  '金物' },
    { id: 4 , name:  '塗料' },
    { id: 5 , name:  'ワーク用品' },
    { id: 6 , name:  '水道用品' },
    { id: 7 , name:  '電設資材' },
    { id: 8 , name:  '住宅設備機器' },
    { id: 9 , name:  '木材' },
    { id: 10 , name: '建築資材' }
  ]

  include ActiveHash::Associations
  has_many :posts
end


