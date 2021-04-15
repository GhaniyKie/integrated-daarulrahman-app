# Task ini digunakan untuk menghapus data di tabel jwt_denylist
# Task akan menghapus data tersimpan tepat atau kurang dari 3 jam yang lalu
# ==========================================================================

# Task dijalankan tepat jam 12 malam. Lalu, kenapa tetap menggunakan fungsi 3.hours.ago ?
# Seperti ini:
# Masa aktif token adalah 2 jam. Selebih itu dianggap invalid
# Bayangkan ketika ada user logout tepat jam 23.59, token yang dia miliki akan disimpan di jwt_denylist
# Lalu, saat jam 00.00, token yang dia miliki dihapus dari tabel.
# Secara otomatis, token yang tadinya sudah invalid akan kembali valid karena:
# 1. Data dihapus dari jwt_denylist
# 2. Sistem memverifikasi data token yang sudah logout dari jwt_denylist. 
#    Walaupun sudah logout, namun jika tidak ada di Database, maka token tetap dianggap valid.
# 3. Selama token tersebut belum mencapai batas expire, token tersebut dapat digunakan untuk login.
# --
# Kesimpulan: CRON hanya menghapus semua data token yang logout sampai jam 9 malam.

namespace :jti do
    desc 'Menghapus data JTI yang sudah lebih dari 3 jam'
    task  :destroy => :environment do
        JwtDenylist.where('expired_at <= ?', 3.hours.ago).each do |jti|
            jti.destroy
        end
    end
end

# TODO:
# Buat sistem logging untuk sistem ini