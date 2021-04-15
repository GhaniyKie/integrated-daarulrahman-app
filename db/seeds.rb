# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    {email: "abdulhakimghaniy@kodein.web.id", password: "Paviliong4", peranan: 1},
    {email: "mega_at@kodein.web.id", password: "Paviliong4", peranan: 3},
    {email: "laraspuspakirana@kodein.web.id", password: "Paviliong4", peranan: 5},
    {email: "nengelenfebrianti@kodein.web.id", password: "Paviliong4", peranan: 5},
    {email: "neninafsulmuthmainnah@kodein.web.id", password: "Paviliong4", peranan: 5},
    {email: "doditiriawan@kodein.web.id", password: "Paviliong4", peranan: 5},
    {email: "hakimabdulmajid@kodein.web.id", password: "Paviliong4", peranan: 5},
]

users.each do |usr|
    User.create(usr)
end

students = [
    {nama: "Laras Puspa Kirana", jenis_kelamin: 2, nisn: 1234567890, no_induk: 12345678, status_pendidikan: 1, angkatan: 40, user_id: 3},
    {nama: "Neng Elen Febrianti", jenis_kelamin: 2, nisn: 2345678901, no_induk: 23456781, status_pendidikan: 1, angkatan: 41, user_id: 4},
    {nama: "Neni Nafsul Muthmainnah", jenis_kelamin: 2, nisn: 3456789012, no_induk: 34567812, status_pendidikan: 1, angkatan: 42, user_id: 5},
    {nama: "Dodit Iriawan", jenis_kelamin: 1, nisn: 4567890123, no_induk: 45678123, status_pendidikan: 1, angkatan: 42, user_id: 6},
    {nama: "Hakim Abdul Majid", jenis_kelamin: 1, nisn: 5678901234, no_induk: 56781234, status_pendidikan: 1, angkatan: 42, user_id: 7}

]

students.each do |std|
    Student.create(std)
end

payment_types = [
    { jenis_pembayaran: "SPP", nominal_biaya: 750_000, deskripsi: "SPP Bulanan Pondok"},
    { jenis_pembayaran: "Buku", nominal_biaya: 700_000, deskripsi: "Pembiayaan Buku Tahun Ajaran Baru"},
    { jenis_pembayaran: "Uang Pangkal", nominal_biaya: 3_000_000, deskripsi: "Uang Pangkal Pendaftaran Pondok"},
    { jenis_pembayaran: "Daftar Ulang", nominal_biaya: 200_000, deskripsi: "Daftar Ulang Kenaikan Kelas 3 ke 4"},
    { jenis_pembayaran: "Kalender", nominal_biaya: 100_000, deskripsi: "Pembelian Kalender Tahun Baru"},
    { jenis_pembayaran: "IP3DR/IP4DR", nominal_biaya: 20_000, deskripsi: "Biaya Bulanan Bendahara Pengurus"},

]

payment_types.each do |pmnt|
    PaymentType.create(pmnt)
end

admins = [
    { nama: "Abdul Hakim Ghaniy", user_id: 1 },
    { nama: "Mega Apriyani Tarwiyah", user_id: 2 }
]

admins.each do |admn|
    Admin.create(admn)
end

invoices = [
    { payment_type_id: 1, student_id: 1 },
    { payment_type_id: 2, student_id: 1 },
    { payment_type_id: 3, student_id: 1 },
    { payment_type_id: 4, student_id: 1 },
    { payment_type_id: 1, student_id: 2 },
    { payment_type_id: 4, student_id: 2 },
    { payment_type_id: 5, student_id: 3 },
    { payment_type_id: 5, student_id: 1 },
    { payment_type_id: 4, student_id: 2 },
    { payment_type_id: 2, student_id: 3 },
    { payment_type_id: 5, student_id: 3 },
    { payment_type_id: 2, student_id: 3 },
    { payment_type_id: 2, student_id: 1 },
    { payment_type_id: 3, student_id: 1 },
    { payment_type_id: 4, student_id: 1 },
    { payment_type_id: 1, student_id: 2 },
    { payment_type_id: 5, student_id: 1 }

]

invoices.each do |invc|
    Invoice.create(invc)
end