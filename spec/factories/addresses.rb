FactoryBot.define do
  factory :address do
    user
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    pincode { Faker::Number.number(digits: 6) }
    near_by_place { Faker::Address.street_name }
  end
end
