class Product < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :favourite_lists
  has_many :add_to_cards
end
