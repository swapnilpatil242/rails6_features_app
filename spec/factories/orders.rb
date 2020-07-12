FactoryBot.define do
  factory :order do
    user
    product
    payment_method
    address
    trait :processing do
      status { "processing" }
    end
    trait :shipping do
      status { "shipping" }
    end
    trait :delivered do
      status { "delivered" }
    end
    trait :rejected do
      status { "rejected" }
    end
    date { Time.now }
    org_number { Faker::Alphanumeric.alphanumeric(number: 10) }
    quantity { Faker::Number.rand_in_range(0, 10) }
    price { product.price }
    status_comment { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
  end
end
