class OrderItem < ApplicationRecord
  has_many :line_items
  belongs_to :order
  belongs_to :record


  def total_price
    record.price.to_i * quantity.to_i
  end
  
end
