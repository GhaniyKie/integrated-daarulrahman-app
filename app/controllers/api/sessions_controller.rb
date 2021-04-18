class API::SessionsController < Devise::SessionsController
    skip_before_action :verify_signed_out_user, if: :json_request?
    skip_before_action :verify_authenticity_token

    include API::APIHelper
    
    # Method create ini digunakan untuk membuat sesi (proses login user)
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

    # Method destroy digunakan untuk merevoke otentikasi pengguna (proses logout)
    def destroy        
        if header_authorization.present?
            token = header_authorization.split(' ').last
            render json: 'Logout berhasil', status: 200
            process_to_denylist(token)
        else
            render json: 'Anda harus login terlebih dahulu', status: :unprocessable_entity
        end
    end

end