FactoryBot.define do
  factory :payment_method do
    user

    trait :card do
      payment_type { "card" }
      card_no { Faker::Number.number(digits: 6) }
      card_name { Faker::Name.name }
    end

    trait :net do
      payment_type { "net" }
      account_no { Faker::Bank.account_number }
      account_name { Faker::Name.name }
      account_bank { Faker::Bank.name }
    end

    trait :upi do
      payment_type { "upi" }
      upi_address { "#{Faker::Number.number(digits: 10)}@upi" }
    end
  end
end
