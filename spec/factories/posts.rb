FactoryBot.define do
  factory :post do
    title {'あいうえお'}
    text {'あいうえおかきくけこ'}
    genre_id { 2 }
    price { 300 }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename:'test_image.png')
    end
  end
end
