FactoryBot.define do
  factory :product do
    category
    name { "Product #{Faker::Lorem.word}" }
    description { Faker::Lorem.sentence }
    quantity { Faker::Number.rand_in_range(0, 50) }
    price { Faker::Number.rand_in_range(100, 500) }
    is_active { [true, false].sample }
  end
end