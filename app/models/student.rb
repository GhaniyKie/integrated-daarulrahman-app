class Student < ApplicationRecord
  # FriendlyId digunakan untuk membuat tampilan URL ketika menampilkan antar entitas tidak menggunakan ID bawaan Rails
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  # Keterangan angka di tabel
  enum gender:		{ man: 1, woman: 2 }
  enum educational_status:	{ active: 1, graduated: 2, stopped: 3 }

  # Relasi dengan entitas User
  belongs_to :user

  # Relasi antar entitas Payments dan Unpaid Payments
  # has_many  :payments
  has_many  :invoices
  # has_many  :payment_type, through: :invoices

  validates :name, presence: { message: "Nama tidak boleh kosong" }
  validates :nisn, uniqueness: { message: "NISN tidak boleh sama dengan lainnya" }, 
            length: { is: 10, message: "Panjang rentang NISN tidak lebih atau kurang dari 10" }
  validates :student_number, uniqueness: { message: "Nomor Induk tidak boleh sama dengan lainnya" }, 
            numericality: { message: "Hanya masukkan angka untuk Nomor Induk Santri" }
  validates :educational_status, presence: { message: "Harap tentukan status pendidikan santri di Daarul Rahman" }
  validates :slug, presence: true

end
