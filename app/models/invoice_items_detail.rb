class InvoiceItemsDetail < ApplicationRecord
    # Relasi dengan entitas Student dan Payment Types
    belongs_to :expense
    belongs_to :invoice
end
