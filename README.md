# README PLEASE !

## File ini mencakup sebagian dokumentasi yang dibutuhkan saat pengembangan sistem atau ingin mendeploy ke Server. Silahkan baca dokumentasi berikut jika ingin berkontribusi :)
---
Bismillahirahmanirrahim.

Segala puji bagi Allah, Tuhan semesta Alam yang telah memberikan kepada kita semua nikmat ilmu, iman, Islam, dan kesehatan. Solawat serta salam untuk Baginda Nabi Muhammad SAW, semoga segala kebaikan selalu tercurahkan untuk pengikut beliau hingga akhir zaman.

Perkembangan teknologi saat ini sangat pesat dan memaksa kita untuk mengikuti perubahan zaman. Saat ini, pondok pesantren adalah salah satu lembaga yang benar-benar menjunjung tinggi akhlakul karimah dan keislaman. Namun, masih banyak pesantren di Indonesia yang tidak mengikuti arus ini, salah satunya dengan memanfaatkan teknologi informasi internet sebagai penunjang sistem administrasi. Kekurangan tersebut bukan karena Pondok Pesantren menolak untuk menggunakan Teknologi sebagai salah satu metode yang dapat diterapkan dan berjalan bersama dengan pendidikan Pesantren, melainkan mereka kekurangan SDM yang mampu untuk menciptakan sistem tersebut.

Atas dasar keprihatinan tersebut, kami selaku lulusan pondok yang terjun dalam bidang Teknologi Informasi merasa perlu diciptakannya suatu sistem yang dapat menunjang hal tersebut. Karena dengan memanfaatkan sistem yang terintegrasi, pengambilan keputusan akan lebih mudah untuk dicapai.

Sistem ini dinamakan **Sistem Terintegrasi Pondok Pesantren Daarul Rahman**

---

9 April 2021

Untuk saat ini, sistem yang terdapat pada aplikasi ini adalah **_Sistem Pembayaran Online_**, untuk kedepannya akan dibuat sistem lainnya sehingga tercipta suatu sistem utuh seperti:

1. Sistem Penilaian
2. Sistem E-Jurnal
3. Sistem E-Library
4. Portal Website Daarul Rahman
5. dan sistem lainnya...

Besar harapan kami atas doa dan dukungan serta restu dari Guru-guru dan kawan alumni sekalian.

Mungkin hanya ini yang dapat kami sampaikan.
Wallahul muwafiq ilaa aqwaamit thoriq.

Wassalamu'alaikum Wr. Wb.

---

## System Requirements

Aplikasi ini menggunakan Requirements dan Depedencies sebagai berikut:
- Ruby 3.0
- Rails 6.1
- Gem devise untuk proses otentikasi
- Gem devise-jwt untuk proses otentikasi disisi API
- Gem cors untuk pertukaran resource disisi API
- Gem pundit untuk proses otorisasi
- RDBMS Postgresql
- Untuk client yang mengakses aplikasi ini menggunakan web HTML, aplikasi ini menggunakan Session untuk proses otentikasi, dan meggunakan JWT (JSON Web Token) pada client yang mengakses melalui API.

Aplikasi ini menggunakan Arsitektur Monolitik. Dimana seluruh moduk sistem terintegrasi menjadi 1 pada sebuah aplikasi.

---
