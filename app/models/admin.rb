class Admin < ApplicationRecord
    # Relasi dengan entitas User
    belongs_to  :user
    # Relasi antar entitas Payments dan Unpaid Payments
    has_many    :unpaid_payments
    has_many    :payments

    validates   :nama, presence: { message: "Harap hanya masukkan nama dan tidak boleh kosong" }
end
