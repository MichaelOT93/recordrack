class Cart < ApplicationRecord

   

    has_many :line_items, dependent: :destroy

    def add_record(record)
        current_item = line_items.find_by(record_id: record.id)
        current_item = line_items.build(record_id: record.id)

        current_item
    end

   

end
