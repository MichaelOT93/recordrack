class Record < ApplicationRecord
    belongs_to :user

    default_scope -> { order(created_at: :desc)}

    validates :user_id, presence: true

    validates :title, presence: true, length: {maximum: 50 }
    validates :artist, presence: true
    validates :price, presence: true


    
    
end
