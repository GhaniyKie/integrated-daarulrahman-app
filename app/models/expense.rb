class Expense < ApplicationRecord
    # Relasi antar entitas Payments dan Unpaid Payments
    # has_many  :payments
    has_many  :invoice_items_details
    has_many  :invoices, through: :invoice_items_details

    validates   :payment_name, presence: { message: "Harap masukkan nama Jenis Pembayaran" }
    validates   :amount, numericality: { message: "Hanya masukkan nominal dalam angka" }
    validates   :description, presence: { message: "Harap masukkan deskripsi untuk jenis pembayaran ini" }
end
