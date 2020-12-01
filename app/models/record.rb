class Record < ApplicationRecord
    before_destroy :not_references_by_any_line_item
    belongs_to :user

    has_many :line_items

    default_scope -> { order(created_at: :desc)}

    validates :user_id, presence: true

    validates :title, presence: true, length: {maximum: 50 }
    validates :artist, presence: true
    validates :price, presence: true


    private
    def not_references_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Line items present")
            throw :abort
        end
    end
    
end
