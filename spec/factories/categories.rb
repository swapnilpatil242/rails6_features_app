FactoryBot.define do
  factory :category do
    title { "category_#{Faker::Lorem.word}" }
    description { Faker::Lorem.sentence }
  end
end
