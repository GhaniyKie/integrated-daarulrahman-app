class Cart < ApplicationRecord
    has_many :invoice_items_details, dependent: :destroy
end