FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.unique.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    telephone             {'12345678901'}
    birthday              {'1930-01-01'}
    industry_id           { 2 }
    reason_id             { 2 }
    person_id             { 2 }
  end
end