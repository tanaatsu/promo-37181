FactoryBot.define do
  factory :record_address do
    postal_code   {'123-4567'}
    municipality  {'港区赤坂'}
    building_name {'赤坂ビル'}
    address       {'12-25'}
    token         {"tok_abcdefghijk00000000000000000"}
    prefecture_id { 2 }
    user_id       { 1 }
    post_id       { 1 }

  end
end
