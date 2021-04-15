json.data_siswa do
    json.total                  @students.count
    json.total_siswa_laki       @students.where(jenis_kelamin: 1).count
    json.total_siswa_perempuan  @students.where(jenis_kelamin: 2).count
    
    # IMPROVEMENT:
    # Menggunakan fitur where dan count sangat membebani database.
    # Untuk kedepannya, buat table statistic, didalamnya menggunakan fitur counter_cache
    # Data yang di count berupa seluruh jumlah data yang terkandung pada masing2 attribut tabel:
    # Seperti: Jumlah siswa pria, jumlah siswa wanita, jumlah keseluruhan murid, jumlah guru, jumlah admin dll
    json.siswa @students do |siswa|
        json.nama               siswa.nama
        json.url                api_v1_student_url(id: siswa.slug)
    end
end