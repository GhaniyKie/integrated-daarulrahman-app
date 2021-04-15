class PaymentType < ApplicationRecord
    # Relasi antar entitas Payments dan Unpaid Payments
    has_many  :invoices
    has_many  :payments
    has_many  :students, through: :invoices
    # has_many  :students, through: :payments

    validates   :nominal_biaya, numericality: { message: "Hanya masukkan nominal dalam angka" }
    validates   :jenis_pembayaran, presence: { message: "Harap masukkan nama Jenis Pembayaran" }
    validates   :deskripsi, presence: { message: "Harap masukkan deskripsi untuk jenis pembayaran ini" }
end
