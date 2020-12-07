class LineItem < ApplicationRecord
    belongs_to :record
    belongs_to :cart
    belongs_to :orders, optional: true
    
    

    validates :record_id, uniqueness: {scope: :cart_id}
    

    def total_price
        record.price.to_i * quantity.to_i
    end
    
end
