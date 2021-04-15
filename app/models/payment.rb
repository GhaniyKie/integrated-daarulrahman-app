class Payment < ApplicationRecord
    # Relasi dengan entitas Student dan Payment Types
    belongs_to :payment_type
    belongs_to :student
end
