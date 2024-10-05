FactoryBot.define do
  factory :item do
    item_name { Faker::Internet.name }
    description { Faker::Lorem.paragraph }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    shipping_cost_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    shipping_duration_id { rand(2..4) }
    sales_price { Faker::Number.between(from: 300, to: 9999999) }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/image/test_image.png')), filename: 'test_image.png')
    end
  end
end
