FactoryBot.define do
  factory :favourite_list do
    user
    product
    date { Time.now }
  end
end