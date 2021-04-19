# Module API::APIHelper digunakan untuk membuat suatu fungsi bantuan
# Fungsi tersebut bukan Main Core dari arsitektur MVC, tetapi dapat membantu proses dari Model, View atau Control
# untuk menjalankan tugasnya.
module API::APIHelper
    # Modul ini tetap memasukkan modul ApplicationHelper
    # Karena ada beberapa fungsionalitas dari aplikasi non-API yang dapat digunakan di environment API
    include ApplicationHelper

    # Method untuk mendapatkan header Autorisasi
    def header_authorization
        request.headers['Authorization']
    end

    # Memproses token ke Denylist, sehingga token tidak dapat digunakan kembali
    def process_to_denylist(token)
        decode_token = API::JsonWebToken.decode(token)
        jti_payload = {
            jti: decode_token['jti'],
            expired_at: Time.at(decode_token['exp'])
        }
    
        JwtDenylist.create!(jti_payload)
    end

    # Mengembalikan nilai true jika 'jti' hasil decode dari header berada dalam database JwtDenylist
    # Atau nilai false jika tidak terdapat di database
    def token_was_denied?(decode)
        JwtDenylist.find_by_jti(decode['jti'])
    end
    
    PASSWORD_VALIDATION = /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{6,}\z/

    def password_param
        params[:password]
    end
end