class Record < ApplicationRecord
    before_destroy :not_references_by_any_line_item
    belongs_to :user
    has_one_attached :album_cover

    has_many :order_items
    has_many :line_items

    default_scope -> { order(created_at: :desc)}

    validates :user_id, presence: true

    validates :title, presence: true, length: {maximum: 50 }
    validates :artist, presence: true
    validates :price, presence: true
    validates :album_cover, attached: true, size: { greater_than: 200.megabytes, message: "Image is too big. Please try another image."}


    private
    def not_references_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Line items present")
            throw :abort
        end
    end

   
    
end
