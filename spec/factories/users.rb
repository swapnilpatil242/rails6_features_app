FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    phone { Faker::Number.number(digits: 10) }
    age { Faker::Number.rand_in_range(20, 60) }

    factory :test_user do
      name { "user1 test" }
      email { "user1@test123.com" }
      phone { Faker::Number.number(digits: 10) }
      age { Faker::Number.rand_in_range(20, 60) }
    end
  end
end
