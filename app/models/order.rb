class Order < ApplicationRecord
  belongs_to :customer
  has_many :book_orders
  has_many :books, through: :book_orders

  enum status: {being_packed: 0, shipped: 1, complete: 2, cancelled: 3}
end
