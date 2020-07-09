class User < ApplicationRecord

  has_many  :add_to_cards
  has_many  :addresses 
  has_many  :favourite_lists
  has_many  :orders
  has_many  :payment_methods

end
