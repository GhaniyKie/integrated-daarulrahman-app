class Student < ApplicationRecord
  # FriendlyId digunakan untuk membuat tampilan URL ketika menampilkan antar entitas tidak menggunakan ID bawaan Rails
  extend FriendlyId
  friendly_id :nama, use: [:slugged, :finders]
  
  # Keterangan angka di tabel
  enum jenis_kelamin:		{ pria: 1, wanita: 2 }
  enum status_pendidikan:	{ aktif: 1, lulus: 2, berhenti: 3 }

  # Relasi dengan entitas User
  belongs_to :user

  # Relasi antar entitas Payments dan Unpaid Payments
  has_many  :invoices
  has_many  :payments
  has_many  :payment_type, through: :invoices
  # has_many  :payment_type, through: :payments

  validates :nama, presence: { message: "Nama tidak boleh kosong" }
  validates :nisn, uniqueness: { message: "NISN tidak boleh sama dengan lainnya" }, 
            length: { is: 10, message: "Panjang rentang NISN tidak lebih atau kurang dari 10" }
  validates :no_induk, uniqueness: { message: "Nomor Induk tidak boleh sama dengan lainnya" }, 
            numericality: { message: "Hanya masukkan angka untuk Nomor Induk Santri" }
  validates :status_pendidikan, presence: { message: "Harap tentukan status pendidikan santri di Daarul Rahman" }
  validates :slug, presence: true

end
