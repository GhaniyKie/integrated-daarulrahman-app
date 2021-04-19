class API::RegistrationsController < Devise::RegistrationsController
    skip_before_action :verify_authenticity_token

    include API::APIHelper

    def create
        if password_param.match(PASSWORD_VALIDATION)
            user = User.new(email: params[:email], password: params[:password])
        
            if user.save
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
                render json: { warning: user.errors.full_messages[0] }, status: 422 # Unprocessable Entity
            end
        else
            render json: { 
                warning: "Password tidak valid. Pastikan password terdiri dari: Minimum 6 karakter, 1 kapital, 1 angka dan 1 karakter unik. Contoh: Gh4n!y" }, 
                status: 422
        end
    end

end