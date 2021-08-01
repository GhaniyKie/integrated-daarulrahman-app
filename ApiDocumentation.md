# Documentation Api

## Authorization

| method | endpoint | keterangan | Response |
|--------|----------|------------| -------- |
|  POST  | /api/login(:format) | Login ke API | 200 |
|  POST  | /api/register(:format) | Registrasi User | 200 |
|  PUT   | /api/credential(:format) | Update Email / Password | 200 |
| DELETE | /api/logout | Logout dari aplikasi | 200 |

--------
## Penggunaan API

### Login

```
/api/login?email=otoy@kucing.com&password=Gh4n!y
```
Method ini akan mereturn token

```
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTMsImVtYWlsIjoiYWJkdWxoYWtpbWdoYW5peUBrb2RlaW4uY28uaWQiLCJqdGkiOiI4YzZlNGYzZmJjYzk2NjcxZTkyYWEwYjA1MDI5YjUxNCIsImlhdCI6MTYyMDQxNjM0NiwiZXhwIjoxNjIwNDIzNTQ2fQ.CF4EAO4UIwsykNCi4KeGEdGUvZvUUvDRhCv09BSyVhw",
    "email": "otoy@kucing.com",
    "message": "Sesi login ini akan kadaluarsa pada pukul  4:39:06"
}
```

### Logout

```
/api/logout
```
Method ini memerlukan Authorization Bearer di HTTP Header.

```
curl -X DELETE localhost:3000/api/logout \
-H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTEsImVtYWlsIjoib3RveUBrdWNpbmcuY29tIiwianRpIjoiNjYyMjU5ZjdiYTI1Zjk2MjRmMzlhYWQ2NWJlNjYwNjkiLCJpYXQiOjE2MjA0MTcyMDIsImV4cCI6MTYyMDQyNDQwMn0.aLbaksA25xvr3xvmiYAm-XAapH3SzhOQSH9xd24To-s"
```

### Register

```
/api/register?email=admin@admin.co.id&password=(Ghaniy37)
```
Method ini memasukkan data ke Database, dan menghasilkan token.

```
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTcsImVtYWlsIjoiYWRtaW5AYWRtaW4uY28uaWQiLCJqdGkiOiI0OTg2ODEyOGQ0Y2Q1ODczNmFlM2E5MTJmNmY2NjhkNCIsImlhdCI6MTYyMDQxNzY3MywiZXhwIjoxNjIwNDI0ODczfQ.V0cWkpoPMmElYEKzH4BfZaGV5Y0in6O_TfYZdAhdVac",
    "email": "admin@admin.co.id",
    "message": "Sesi login ini akan kadaluarsa pada pukul  5:01:13"
}
```

### Update (Email)

Penjelasan untuk update email:

Didalam token JWT sudah tersedia email yang digunakan untuk mengotorisasi user saat pertama kali mendaftar ke sistem.
Untuk merubah email, cukup memasukkan email baru ke URL, lalu sistem akan otomatis mengupdate email lama berdasarkan hasil decode token JWT.

```
/api/credential?email=emailbaru@email.com
```
Method ini memerlukan Authorization Bearer di HTTP Header.

```
curl -X PUT localhost:3000/api/credential -d "email=admin@gmail.com" \
-H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTcsImVtYWlsIjoiYWRtaW5AYWRtaW4uY28uaWQiLCJqdGkiOiI0OTg2ODEyOGQ0Y2Q1ODczNmFlM2E5MTJmNmY2NjhkNCIsImlhdCI6MTYyMDQxNzY3MywiZXhwIjoxNjIwNDI0ODczfQ.V0cWkpoPMmElYEKzH4BfZaGV5Y0in6O_TfYZdAhdVac"
```

### Update (Password)

Penjelasan untuk update password:

Password dicocokkan berdasarkan id user yang terdata di sistem. Untuk merubah password, cukup masukkan password baru ke URL beserta token Authorization di Header.
Sistem akan otomatis merubah password berdasarkan email dan id user yang berada di Token tersebut.

```
/api/credential?password=(Ghaniy38)
```
Method ini memerlukan Authorization Bearer di HTTP Header.

```
curl -X PUT localhost:3000/api/credential -d "password=(Ghaniy38)" \
-H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTcsImVtYWlsIjoiYWRtaW5AYWRtaW4uY28uaWQiLCJqdGkiOiI0OTg2ODEyOGQ0Y2Q1ODczNmFlM2E5MTJmNmY2NjhkNCIsImlhdCI6MTYyMDQxNzY3MywiZXhwIjoxNjIwNDI0ODczfQ.V0cWkpoPMmElYEKzH4BfZaGV5Y0in6O_TfYZdAhdVac"
```

## Error Responses

| Action | Response | Keterangan |
| ------ | -------- | ---------- |
| Merubah Password / Email | 401 | Jika token expired, invalid, atau sudah terdaftar di database sebagai denied token |
| Mengakses Resource | 401 | Jika token kosong, expired, invalid, atau sudah terdaftar di database sebagai denied token |
| Merubah Password | 422 | Jika password tidak sesuai validasi (min 6, terdapat huruf kapital, karakter uniq dan angka) |
| Merubah Email | 422 | Jika email tidak seperti layaknya email, atau email sudah terdaftar |
| Merubah Kredensial | 400 | Jika paramater di URL salah |

-----

## Resources

| method | endpoint | keterangan | status |
| ------ | -------- | ---------- | ------ |
| GET    | /api/v1/students | Index data seluruh siswa | 200 |

---

Akses IP: http://34.101.252.168/ <br>
Dummy Credentials <br>
Email: otoy@kucing.com <br>
Password: iWGgif6JTNZmez7