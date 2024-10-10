FactoryBot.define do
  factory :order_address do
    postal_code       { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id     { rand(2..48) }
    city_town_village { Faker::Address.city }
    street_address    { Faker::Address.street_address }
    building_name     { '東京ハイツ' }
    contact_number    { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    token             {"tok_abcdefghijk00000000000000000"}
    price             { Faker::Number.between(from: 300, to: 9999999) }
  end
end
