class API::SessionsController < Devise::SessionsController
    skip_before_action :verify_signed_out_user, if: :json_request?
    skip_before_action :verify_authenticity_token
    
    def create
        user = User.find_by_email(params[:email])
  
        if user && user.valid_password?(params[:password])
            # iat (Issued At): Waktu dimana JWT ini di berikan ke pengguna
            # jti (JWT ID): Id hasil dari payload iat dan personal token sebagai identifikasi Token JWT
            iat = Time.now.to_i
            jti = Digest::MD5.hexdigest("#{iat}:#{user.personal_token}")
    
            payload = {
                id: user.id,
                email: user.email,
                jti: jti,
                iat: iat
            }
            encoded = API::JsonWebToken.encode(payload)
            render  json: { 
                    token: encoded,
                    email: user.email,
                    message: "Sesi login ini akan kadaluarsa pada pukul #{Time.at(payload[:exp]).strftime('%k:%M:%S')}"
            },      status: 200
        else
            render json: "Email atau Password salah", status: 401      
        end
    end
  
    def destroy
        # TODO:
        
        # Cari cara supaya get Token, terus dimasukin ke jwt_blacklist                                        wes
        # Token ditambahin jti, sama iat                                                                      wes
        # Jangan lupa juga di JsonWebToken.rb, ubah juga fungsinya.                                           wes
        # Caranya ada di kertas, pahamin lagi nanti                                                           enggeh
        # Cara identifikasi user yang login bisa pake email dan id.                                           PR
        # Token dipecah, dicari ID sama Email, kalo sama dengan user yang login, destroy session nya          PR
        # iat dan exp masuk ke database. Buat supaya session create (login) baca data di tabel jwt_blacklist  wes
        # Kasih exception buat orang yang gak login pake 401 (Gak login tapi maksa logout)                    Gakmungkin
        
        if header_authorization.present?
            token = header_authorization.split(' ').last
            render json: 'Logout berhasil', status: 200
            process_to_denylist(token)
        else
            render json: 'Anda harus login terlebih dahulu', status: :unprocessable_entity
        end
    end
  
    private
    
    def process_to_denylist(token)
        decode_token = API::JsonWebToken.decode(token)
        jti_payload = {
            jti: decode_token['jti'],
            expired_at: Time.at(decode_token['exp'])
        }
    
        JwtDenylist.create!(jti_payload)
    end

    # Method untuk mendapatkan header Autorisasi
    def header_authorization
        request.headers['Authorization']
    end
end