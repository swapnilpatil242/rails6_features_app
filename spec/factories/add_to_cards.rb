FactoryBot.define do
  factory :add_to_card do
    user
    product
    date { Time.now }
    quantity { Faker::Number.rand_in_range(1, 2) }
  end
end