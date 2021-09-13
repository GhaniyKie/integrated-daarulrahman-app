# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

expenses = [
    { payment_name: "SPP", amount: 750_000, description: "SPP Bulanan Pondok"},
    { payment_name: "Buku", amount: 700_000, description: "Pembiayaan Buku Tahun Ajaran Baru"},
    { payment_name: "Uang Pangkal", amount: 3_000_000, description: "Uang Pangkal Pendaftaran Pondok"},
    { payment_name: "Daftar Ulang", amount: 200_000, description: "Daftar Ulang Kenaikan Kelas 3 ke 4"},
    { payment_name: "Kalender", amount: 100_000, description: "Pembelian Kalender Tahun Baru"},
    { payment_name: "IP3DR/IP4DR", amount: 20_000, description: "Biaya Bulanan Bendahara Pengurus"},
]

students = [
    {name: "Laras Puspa Kirana", gender: 2, nisn: 1234567890, student_number: 12345678, educational_status: 1, batch: 40},
    {name: "Neng Elen Febrianti", gender: 2, nisn: 2345678901, student_number: 23456781, educational_status: 1, batch: 41},
    {name: "Neni Nafsul Muthmainnah", gender: 2, nisn: 3456789012, student_number: 34567812, educational_status: 1, batch: 42},
    {name: "Dodit Iriawan", gender: 1, nisn: 4567890123, student_number: 45678123, educational_status: 1, batch: 42},
    {name: "Hakim Abdul Majid", gender: 1, nisn: 5678901234, student_number: 56781234, educational_status: 1, batch: 42}
]

students.each do |std|
    Student.create(std)
end

expenses.each do |pmnt|
    Expense.create(pmnt)
end