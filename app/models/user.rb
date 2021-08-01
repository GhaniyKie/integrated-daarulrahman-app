class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable

  # Token digunakan sebagai payload hashing
  before_save :ensure_personal_token

  # Keterangan roles masing-masing user
  enum role: { superuser: 1, secretary: 2, exchequer: 3, teacher: 4, student: 5 }
  
  # Relasi antar entitas Admin dan Student
  has_one :admin
  has_one :student

  # Memastikan bahwa token yang dibuat oleh Devise adalah token yang unik
  def ensure_personal_token
    # personal_token adalah salah satu kolom di Tabel User
    self.personal_token ||= generate_personal_token
  end

  private

  # Membuat Token Autentikasi
  # Token Autentikasi dibuat sendiri sejak versi Devise > 3.2
  def generate_personal_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(personal_token: token).first
    end
  end

end
