class Business < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ホームセンター' },
    { id: 3, name: 'プロショップ' },
    { id: 4, name: 'ワークショップ' },
    { id: 5, name: '専門店' },
    { id: 6, name: 'スーパーマーケット' },
    { id: 7, name: 'ドラッグストア' },
    { id: 8, name: '百貨店' },
    { id: 9, name: 'その他業態' }
  ]

  include ActiveHash::Associations
  has_many :users

end