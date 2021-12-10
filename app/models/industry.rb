class Industry < ActiveHash::Base
 self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '土木業' },
   { id: 3, name: '建築業' },
   { id: 4, name: '左官業' },
   { id: 5, name: 'コンクリート業' },
   { id: 6, name: '解体工事業' },
   { id: 7, name: '屋根工事業' },
   { id: 8, name: '電気工事業' },
   { id: 9, name: '管工事業' },
   { id: 10, name: 'ブロック工事業' },
   { id: 11, name: '鉄筋工事業' },
   { id: 12, name: '板金工事業' },
   { id: 13, name: 'ガラス工事業' },
   { id: 14, name: '塗装工事業' },
   { id: 15, name: '防水工事業' },
   { id: 16, name: '水道工事業' },
   { id: 17, name: 'リフォーム業' },
   { id: 18, name: '清掃業' },
   { id: 19, name: '内装業' },
   { id: 20, name: '造園業' },
   { id: 21, name: '畳業' },
   { id: 22, name: '産廃処理業' },
   { id: 23, name: '農業' },
   { id: 24, name: '製造業' },
   { id: 25, name: '店舗運営' },
   { id: 26, name: 'その他業種' }
 ]

 include ActiveHash::Associations
 has_many :users
 
end