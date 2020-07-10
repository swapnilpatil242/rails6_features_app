FactoryBot.define do
  factory :category do
    title { Faker::Name.last_name }
    description { Faker::Name.last_name }
  end
end
