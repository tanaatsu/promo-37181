class Genre < ActiveHash::Base
  self.data =[
    { id: 1 , name:  '--' },
    { id: 2 , name:  '工具       （例=> ドライバー、メジャー、電動工具etc）' },
    { id: 3 , name:  '金物       （例=> ビス、ネジ、点検口、ダクト、ドアノブ、キャスターetc）' },
    { id: 4 , name:  '塗料       （例=> 一般塗料、DIY塗料、業務用塗料、刷毛、養生用品etc）' },
    { id: 5 , name:  'ワーク用品  （例=> 作業着、作業手袋、安全靴、保安用品etc）' },
    { id: 6 , name:  '水道用品    （例=> 混合水栓、トイレ用品、浴室用品、洗濯用品、他水回り用品etc）' },
    { id: 7 , name:  '電設資材    （例=> 配線コード、投光器、延長コード、スイッチプレートetc）' },
    { id: 8 , name:  '住宅設備機器 （例=> 洗面化粧台、キッチン台、給湯器、換気扇etc）' },
    { id: 9 , name:  '木材        （例=> 合板、角材、SPF材、DIY用品etc）' },
    { id: 10 , name: '建築資材    （例=> ブロック、セメント、台車、工事用品etc）' }
  ]

  include ActiveHash::Associations
  has_many :posts
end


