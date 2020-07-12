# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating categories and products
for i in 1..10
  category = FactoryBot.create(:category)
  for j in 1..5
    FactoryBot.create(:product, :category => category)
  end
end

# Creating Users
for i in 1..5
  user = FactoryBot.create(:user)
  for j in 1..2
    FactoryBot.create(:address, :user => user)
  end
  FactoryBot.create(:payment_method, :card, :user => user)
end

# Generated all transactions for test user
# Add to card & favourite & Orders
test_user = FactoryBot.create(:test_user)
address = FactoryBot.create(:address, :user => test_user)
payment = FactoryBot.create(:payment_method, :card, :user => test_user)

first_two_products = Product.first(2)
FactoryBot.create(:add_to_card, :user => test_user, :product => first_two_products.first)
FactoryBot.create(:favourite_list, :user => test_user, :product => first_two_products.last)

last_four_products = Product.last(4)
order_status = [:processing, :shipping, :delivered, :rejected]
# Orders
for i in 0..3
  FactoryBot.create(:order, order_status[i], :user => test_user, :product => last_four_products[i], :payment_method => payment, :address => address)
end

